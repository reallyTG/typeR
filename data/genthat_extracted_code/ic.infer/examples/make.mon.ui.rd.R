library(ic.infer)


### Name: make.mon.ui
### Title: Function for creating the matrix ui for monotonicity
###   (in)equality restrictions
### Aliases: make.mon.ui
### Keywords: multivariate optimize

### ** Examples

gifte <- boot::poisons    ## gifte is German for poisons
## default: contr.treatment (with default base 1)
linmod <- lm(1/time~poison+treat, gifte)
summary(orlm(linmod, ui=make.mon.ui(gifte$poison), index=2:3))

## next: contr.diff
contrasts(gifte$poison) <- "contr.diff" 
linmod <- lm(1/time~poison+treat, gifte)
summary(orlm(linmod, ui=make.mon.ui(gifte$poison), index=2:3))

## next: contr.SAS
contrasts(gifte$poison) <- "contr.SAS"
linmod <- lm(1/time~poison+treat, gifte)
summary(orlm(linmod, ui=make.mon.ui(gifte$poison), index=2:3))

## next: contr.sum
contrasts(gifte$poison) <- "contr.sum"
linmod <- lm(1/time~poison+treat, gifte)
summary(orlm(linmod, ui=make.mon.ui(gifte$poison), index=2:3))





