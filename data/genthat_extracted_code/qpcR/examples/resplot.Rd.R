library(qpcR)


### Name: resplot
### Title: An (overlayed) residuals barplot
### Aliases: resplot
### Keywords: models nonlinear

### ** Examples

## Create l5 model and plot 
## standardized residuals.
m1 <- pcrfit(reps, 1, 2, l5)
resplot(m1)

## Not run: 
##D ## Using replicates.
##D m2 <- pcrfit(reps, 1, 2:5, l5)
##D resplot(m2)
## End(Not run)



