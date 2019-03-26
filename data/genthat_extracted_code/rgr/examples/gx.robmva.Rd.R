library(rgr)


### Name: gx.robmva
### Title: Function to undertake a Robust Exploratory Multivariate Data
###   Analysis
### Aliases: gx.robmva
### Keywords: multivariate robust

### ** Examples

## Generate a population of synthetic bivariate normal data
grp1 <- mvrnorm(100, mu = c(40, 30), Sigma = matrix(c(6, 3, 3, 2), 2, 2))
grp1 <- cbind(grp1, rep(1, 100))
## Generate a set of six (6) outliers
anom <- matrix(c(43, 34, 50, 37, 47, 30, 27, 29, 35, 33, 32, 25),6, 2)
anom <- cbind(anom, rep(2, 6))
## Bind the test data together and display the test data 
test.robmva.mat <- rbind(grp1, anom)
test.robmva <- as.data.frame(test.robmva.mat)
dimnames(test.robmva)[[2]] <- c("x","y","grp")
attach(test.robmva)
xyplot.tags(x, y, dimnames(test.robmva)[[1]], cex = 0.75)

## Generate gx.robmva saved object 
save.rob <- gx.robmva(as.matrix(test.robmva[, c(1:2)]))
## Display saved object with alternate main titles
gx.rqpca.screeplot(save.rob, main = "Bivariate synthetic data")
gx.rqpca.plot(save.rob, cex.lab = 0.8, rowids = TRUE,
main = "Bivariate synthetic data")
gx.md.plot(save.rob, cex.main = 0.9, cex.lab = 0.8, cex.axis = 0.8,
main = "Bivariate synthetic data")
gx.md.print(save.rob, pcut = 0.05)

## Clean-up and detach test data
rm(grp1)
rm(anom)
rm(test.robmva.mat)
rm(test.robmva)
rm(save.rob)
detach(test.robmva)



