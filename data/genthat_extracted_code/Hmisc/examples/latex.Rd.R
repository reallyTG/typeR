library(Hmisc)


### Name: latex
### Title: Convert an S object to LaTeX, and Related Utilities
### Aliases: latex latex.default latex.function latex.list latexTranslate
###   htmlTranslate latexSN htmlSN latexVerbatim dvi print.dvi dvi.latex
###   dvips dvips.latex dvips.dvi dvigv dvigv.latex dvigv.dvi print.latex
###   show.latex show.dvi
### Keywords: utilities interface methods file character manip

### ** Examples

x <- matrix(1:6, nrow=2, dimnames=list(c('a','b'),c('c','d','this that')))
## Not run: 
##D latex(x)   # creates x.tex in working directory
##D # The result of the above command is an object of class "latex"
##D # which here is automatically printed by the latex print method.
##D # The latex print method prepends and appends latex headers and
##D # calls the latex program in the PATH.  If the latex program is
##D # not in the PATH, you will get error messages from the operating
##D # system.
##D 
##D w <- latex(x, file='/tmp/my.tex')
##D # Does not call the latex program as the print method was not invoked
##D print.default(w)
##D # Shows the contents of the w variable without attempting to latex it.
##D 
##D d <- dvi(w)  # compile LaTeX document, make .dvi
##D              # latex assumed to be in path
##D d            # or show(d) : run xdvi (assumed in path) to display
##D w            # or show(w) : run dvi then xdvi
##D dvips(d)     # run dvips to print document
##D dvips(w)     # run dvi then dvips
##D library(tools)
##D texi2dvi('/tmp/my.tex')   # compile and produce pdf file in working dir.
## End(Not run)
latex(x, file="")   # just write out LaTeX code to screen

## Not run: 
##D # Use paragraph formatting to wrap text to 3 in. wide in a column
##D d <- data.frame(x=1:2,
##D                 y=c(paste("a",
##D                     paste(rep("very",30),collapse=" "),"long string"),
##D                 "a short string"))
##D latex(d, file="", col.just=c("l", "p{3in}"), table.env=FALSE)
## End(Not run)

## Not run: 
##D # After running latex( ) multiple times with different special styles in
##D # effect, make a file that will call for the needed LaTeX packages when
##D # latex is run (especially when using Sweave with R)
##D if(exists(latexStyles))
##D   cat(paste('\usepackage{',latexStyles,'}',sep=''),
##D       file='stylesused.tex', sep='\n')
##D # Then in the latex job have something like:
##D # \documentclass{article}
##D # \input{stylesused}
##D # \begin{document}
##D # ...
## End(Not run)



