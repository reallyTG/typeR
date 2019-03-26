library(psych)


### Name: blant
### Title: A 29 x 29 matrix that produces weird factor analytic results
### Aliases: blant
### Keywords: datasets

### ** Examples

data(blant)
#compare
f5 <- fa(blant,5,rotate="none")  #the default minres 
f5.old <-fa(blant,5, fm="old.min",rotate="none") #old version of minres
f5.mle <- fa(blant,5,fm="mle",rotate= "none") #maximum likelihood
#compare solutions
factor.congruence(list(f5,f5.old,f5.mle))
#compare sums of squared residuals
sum(residuals(f5,diag=FALSE)^2,na.rm=TRUE) # 1.355489
sum(residuals(f5.old,diag=FALSE)^2,na.rm=TRUE) # 1.539757
sum(residuals(f5.mle,diag=FALSE)^2,na.rm=TRUE) # 2.402092

#but, when we divide the squared residuals by the original (squared) correlations, we find 
#a different ordering of fit
f5$fit     # 0.9748177
f5.old$fit  # 0.9752774
f5.mle$fit   # 0.9603324




