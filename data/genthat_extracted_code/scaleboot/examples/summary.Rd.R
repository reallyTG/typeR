library(scaleboot)


### Name: summary.scaleboot
### Title: P-value Calculation for Multiscale Bootstrap
### Aliases: summary.scaleboot summary.scalebootv print.summary.scaleboot
###   print.summary.scalebootv
### Keywords: models nonparametric

### ** Examples

data(mam15)
## For a single hypothesis
a <- mam15.relltest[["t4"]] # an object of class "scaleboot"
summary(a) # calculate and print p-values (k=3)
summary(a,k=2) # calculate and print p-values (k=2)
summary(a,k=1:4) # up to "k.4" p-value.

## For multiple hypotheses
b <- mam15.relltest[1:15] # an object of class "scalebootv"
summary(b) # calculate and print p-values (k=3)
summary(b,k=1:4) # up to "k.4" p-value.




