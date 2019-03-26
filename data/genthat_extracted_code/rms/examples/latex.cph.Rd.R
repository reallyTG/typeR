library(rms)


### Name: latex.cph
### Title: LaTeX Representation of a Fitted Cox Model
### Aliases: latex.cph latex.lrm latex.ols latex.orm latex.pphsm latex.psm
### Keywords: regression character survival interface models

### ** Examples

## Not run: 
##D units(ftime) <- "Day"
##D f <- cph(Surv(ftime, death) ~ rcs(age)+sex, surv=TRUE, time.inc=60)
##D w <- latex(f, file='f.tex')  #Interprets fitted model and makes table of S0(t)
##D                #for t=0,60,120,180,...
##D w              #displays image, if viewer installed and file given above
##D latex(f)   # send LaTeX code to the console for knitr
##D options(prType='html')
##D latex(f)       # for use with knitr and R Markdown using MathJax
## End(Not run)



