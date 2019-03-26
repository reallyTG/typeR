library(highlight)


### Name: highlight-package
### Title: Syntax Highlighter for R
### Aliases: highlight-package

### ** Examples

## Not run: 
##D tf <- tempfile()
##D dump( "glm" , file = tf )
##D 
##D # rendering in html
##D highlight( tf, output = stdout(),
##D 	renderer = renderer_html() )
##D 
##D # rendering in latex
##D highlight( tf, output = stdout(),
##D 	renderer = renderer_latex() )
##D 
##D # Sweave driver using syntax highlighting
##D if( require( grid ) ){
##D 	v <- vignette( "grid", package = "grid" )$file
##D 	file.copy( v, "grid.Snw" )
##D 	Sweave( "grid.Snw", driver= HighlightWeaveLatex() )
##D 	system( "pdflatex grid.tex" )
##D 	if (.Platform$OS.type == "windows"){
##D 		shell.exec( "grid.pdf" )
##D 	} else {
##D 		system(paste(shQuote(getOption("pdfviewer")), "grid.pdf" ),
##D 			wait = FALSE)
##D 	}
##D }
##D 
##D unlink( tf )
## End(Not run)



