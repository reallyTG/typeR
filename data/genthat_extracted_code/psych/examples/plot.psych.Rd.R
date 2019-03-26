library(psych)


### Name: plot.psych
### Title: Plotting functions for the psych package of class "psych"
### Aliases: plot.psych plot.poly plot.irt plot.residuals
### Keywords: multivariate

### ** Examples

test.data <- Harman74.cor$cov
f4 <- fa(test.data,4)
plot(f4)
plot(resid(f4))
plot(resid(f4),main="Residuals from a 4 factor solution",qq=FALSE)
#not run
#data(bfi)
#e.irt <- irt.fa(bfi[11:15])  #just the extraversion items
#plot(e.irt)   #the information curves
#
ic <- iclust(test.data,3)   #shows hierarchical structure 
plot(ic)                    #plots loadings
#





