library(knitrBootstrap)


### Name: knitrBootstrap
### Title: 'knitrBootstrap' A framework to create Bootstrap 3 HTML reports
###   from knitr Rmarkdown. Knitr Bootstrap includes a 'bootstrap_document'
###   custom rendering function for use with the rmarkdown <URL:
###   http://rmarkdown.rstudio.com/>) package.
### Aliases: knitrBootstrap knitrBootstrap-package

### ** Examples

## Not run: 
##D library(rmarkdown)
##D library(knitrBootstrap)
##D 
##D render('input.Rmd', bootstrap_document())
##D 
##D #with some options
##D render('input.Rmd', bootstrap_document(title='Test', highlight='Github',
##D   theme='Slate', theme.chooser=TRUE, highlight.chooser=TRUE))
## End(Not run)



