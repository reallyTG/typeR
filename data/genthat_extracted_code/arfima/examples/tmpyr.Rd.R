library(arfima)


### Name: tmpyr
### Title: Temperature Data
### Aliases: tmpyr
### Keywords: datasets

### ** Examples


## No test: 
data(tmpyr)

fit <- arfima(tmpyr, order = c(1, 0, 1), numeach = c(3, 3), dmean = TRUE, back=TRUE)
fit
##suspect that fourth mode may be spurious, even though not close to a boundary
##may be an induced mode from the optimization of the mean

fit <- arfima(tmpyr, order = c(1, 0, 1), numeach = c(3, 3), dmean = FALSE, back=TRUE)
fit

##perhaps so


plot(tacvf(fit), maxlag = 30, tacf = TRUE)

fit1 <- arfima(tmpyr, order = c(1, 0, 0), dmean = TRUE, back=TRUE)
fit1

fit2 <- arfima(tmpyr, order = c(1, 0, 0), dmean = FALSE, back=TRUE)
fit2  ##still bimodal.  Second mode may or may not be spurious.

fit3 <- arfima(tmpyr, order = c(1, 0, 0), dmean = FALSE, whichopt = 1, numeach = c(3, 3))
fit3  ##Unimodal.  So the second mode was likely spurious.

plot(tacvf(fit2), maxlag = 30, tacf = TRUE)
##maybe not spurious.  Hard to tell without visualizing the surface.

##compare to plotted tacf of fit1:  looks alike
plot(tacvf(fit1), maxlag = 30, tacf = TRUE)

tacfplot(list(fit1, fit2))
## End(No test)




