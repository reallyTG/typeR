library(papeR)


### Name: toLatex
### Title: Cleaning R Code for printing in LaTeX environments
### Aliases: toLatex toLatex.character toLatex.sessionInfo
### Keywords: univar IO print

### ** Examples

txt <- "Price: <= 500$ & additional goodies"
toLatex(txt)

############################################################
## session info for automatic inclusion in reports

info <- toLatex(sessionInfo())
info

## extract first part (the Latex part)
toLatex(info)
## extract second part (the BibTeX part)
toBibtex(info)


############################################################
## usual usage scenario

## Do not run the following code automatically as it needs
## write access to the current working directory.
## This code (without removing the file) could for example
## be included in a LaTeX chunk of your Sweave or knitr
## report.

## Not run: 
##D getwd()     ## location where write access is needed
##D toLatex(sessionInfo(), file = "packages.bib")
##D file.remove("packages.bib")
## End(Not run)




