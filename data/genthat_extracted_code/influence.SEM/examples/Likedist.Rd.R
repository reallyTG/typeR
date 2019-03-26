library(influence.SEM)


### Name: Likedist
### Title: Likelihood Distance.
### Aliases: Likedist
### Keywords: multivariate

### ** Examples

## not run: this example take several minutes
data("PDII")
model <- "
  F1 =~ y1+y2+y3+y4
"
# fit0 <- sem(model, data=PDII)
# LD <-Likedist(model,data=PDII)
# plot(LD,pch=19,xlab="observations",ylab="Likelihood distances")

## not run: this example take several minutes
## an example in which the deletion of a case yelds a solution 
## with negative estimated variances
model <- "
  F1 =~ x1+x2+x3
  F2 =~ y1+y2+y3+y4
  F3 =~ y5+y6+y7+y8
"

# fit0 <- sem(model, data=PDII)
# LD <-Likedist(model,data=PDII)
# plot(LD,pch=19,xlab="observations",ylab="Likelihood distances")



