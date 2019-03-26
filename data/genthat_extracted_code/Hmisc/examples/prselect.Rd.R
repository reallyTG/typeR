library(Hmisc)


### Name: prselect
### Title: Selectively Print Lines of a Text Vector
### Aliases: prselect
### Keywords: manip utilities

### ** Examples

x <- c('the','cat','ran','past','the','dog')
prselect(x, 'big','bad')     # omit nothing- no match
prselect(x, 'the','past')    # omit first 4 lines
prselect(x,'the','junk')     # omit nothing- no match for stop
prselect(x,'ran','dog')      # omit last 4 lines
prselect(x,'cat')            # omit lines 2-
prselect(x,'cat',i=1)        # omit lines 3-
prselect(x,'cat','past')     # omit lines 2-4
prselect(x,'cat','past',j=1) # omit lines 2-5
prselect(x,'cat','past',j=-1)# omit lines 2-3
prselect(x,'t$','dog')       # omit lines 2-6; t must be at end

# Example for Sweave: run a regression analysis with the rms package
# then selectively output only a portion of what print.ols prints.
# (Thanks to \email{romain.francois@dbmail.com})
# <<z,eval=FALSE,echo=T>>=
# library(rms)
# y <- rnorm(20); x1 <- rnorm(20); x2 <- rnorm(20)
# ols(y ~ x1 + x2)
# <<echo=F>>=
# z <- capture.output( {
# <<z>>
#    } )
# prselect(z, 'Residuals:') # keep only summary stats; or:
# prselect(z, stop='Coefficients', j=-1)  # keep coefficients, rmse, R^2; or:
# prselect(z, 'Coefficients', 'Residual standard error', j=-1) # omit coef
# @



