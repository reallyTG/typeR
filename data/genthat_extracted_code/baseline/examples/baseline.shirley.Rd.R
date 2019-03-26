library(baseline)


### Name: baseline.shirley
### Title: Shirley Background Estimation
### Aliases: baseline.shirley

### ** Examples

data("O1s")
Data <- O1s

## The same example with C1s data 
# data("C1s")
# Data <- C1s

Y <- Data[2,, drop = FALSE]
X <- Data[1,]

corrected <- baseline(Y, method = "shirley", t = X)
plot(corrected, rev.x = TRUE, labels = X)

## Not run: 
##D # Dependent on external software
##D baselineGUI(Y, labels=X, method="shirley")
## End(Not run)



