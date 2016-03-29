NAME=siggraph14-ias

$(NAME).pdf: *.tex *.bib # fig/*.pdf fig/*.png
	pdflatex $(NAME).tex
	bibtex $(NAME)
	pdflatex $(NAME).tex
	pdflatex $(NAME).tex



clean:
	rm -f ${NAME}.pdf
	rm -f ${NAME}.blg
	rm -f ${NAME}.aux
	rm -f ${NAME}.log
	rm -f ${NAME}.lbl
	rm -f ${NAME}.bbl
	rm -f ${NAME}.brf
	rm -f ${NAME}.pdf

	rm -f *~ \#* *.bak

view: $(NAME).pdf
	acroread $(NAME).pdf

okular:
	pdflatex $(NAME).tex
	okular $(NAME).pdf

osx: 
	pdflatex $(NAME).tex
	open $(NAME).pdf

linux: $(NAME).pdf
	evince $(NAME).pdf

windows: $(NAME).pdf
	explorer.exe $(NAME).pdf

check:
	pdflatex $(NAME).tex | grep -i -e "undefined" -e "multiply"
