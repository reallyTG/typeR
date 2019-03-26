library(rmarkdown)


### Name: pandoc_args
### Title: Functions for generating pandoc command line arguments
### Aliases: pandoc_args pandoc_variable_arg pandoc_include_args
###   pandoc_highlight_args pandoc_latex_engine_args pandoc_toc_args

### ** Examples

## Not run: 
##D library(rmarkdown)
##D 
##D pandoc_include_args(before_body = "header.htm")
##D pandoc_include_args(before_body = "header.tex")
##D 
##D pandoc_highlight_args("kate")
##D 
##D pandoc_latex_engine_args("pdflatex")
##D 
##D pandoc_toc_args(toc = TRUE, toc_depth = 2)
## End(Not run)



