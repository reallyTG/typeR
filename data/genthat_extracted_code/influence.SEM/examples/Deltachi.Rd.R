library(influence.SEM)


### Name: Deltachi
### Title: Chi-square difference.
### Aliases: Deltachi
### Keywords: multivariate

### ** Examples

## not run: this example take several minutes
data("PDII")
model <- "
  F1 =~ y1+y2+y3+y4
"

# fit0 <- sem(model, data=PDII)
# Dchi <- Deltachi(model,data=PDII)
# plot(Dchi,pch=19,xlab="observations",ylab="Delta chisquare")

## not run: this example take several minutes
## an example in which the deletion of a case yelds a solution 
## with negative estimated variances
model <- "
  F1 =~ x1+x2+x3
  F2 =~ y1+y2+y3+y4
  F3 =~ y5+y6+y7+y8
"

# fit0 <- sem(model, data=PDII)
# Dchi <- Deltachi(model,data=PDII)
# plot(Dchi,pch=19,xlab="observations",ylab="Delta chisquare",main="Deltachi function")

## the case that produces negative estimated variances
# sem(model,data=PDII[-which(is.na(Dchi)),])

## same results 
# Dchi <- fitinfluence("chisq",model,data=PDII)$Dind$chisq
# plot(Dchi,pch=19,xlab="observations",ylab="Delta chisquare",main="fitinfluence function")




