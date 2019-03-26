library(apsrtable)


### Name: apsrtableSummary
### Title: Custom summary functions for output tables
### Aliases: apsrtableSummary apsrtableSummary.gee apsrtableSummary.lrm

### ** Examples

### summary.gee produces z scores but not Pr(z). This converts the relevant columns
### to Pr(z) so that apsrstars() works on it, and places the vector of robust se's in 
### an $se position which apsrtable expects.

apsrtableSummary.gee <- function(x) {
  s <- summary(x)
  newCoef <- coef(s)
  ## which columns have z scores? (two of them in robust case)
  zcols <- grep("z",colnames(newCoef))
  newCoef[,zcols] <- pnorm(abs(newCoef[,zcols]), lower.tail=FALSE)
  colnames(newCoef)[zcols] <- "Pr(z)"
  s$coefficients <- newCoef
  ## put the robust se in $se so that notefunction works automatically
  ## the se checker will overwrite [,4] with pt, but this doesn't matter
  ## because the last column Pr(z) is used by apsrstars() anyway
  ## and the se are pulled from $se.
  if( class(x) == "gee.robust") {
    s$se <- coef(s)[,4]
  }
  return(s)
}



