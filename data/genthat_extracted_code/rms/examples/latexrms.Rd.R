library(rms)


### Name: latexrms
### Title: LaTeX Representation of a Fitted Model
### Aliases: latexrms latex.bj latex.Glm latex.Gls
### Keywords: models regression character methods interface

### ** Examples

## Not run: 
##D f <- lrm(death ~ rcs(age)+sex)
##D w <- latex(f, file='f.tex')
##D w     # displays, using e.g. xdvi
##D latex(f)    # send LaTeX code to console, as for knitr
##D options(prType='html')
##D latex(f)    # emit html and latex for knitr html and html notebooks
## End(Not run)



