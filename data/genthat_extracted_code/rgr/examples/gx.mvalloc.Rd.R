library(rgr)


### Name: gx.mvalloc
### Title: Function for Allocation on the basis of Multivariate Data
### Aliases: gx.mvalloc
### Keywords: multivariate

### ** Examples

## Generate three groups of synthetic bivariate normal data
grp1 <- mvrnorm(100, mu = c(40, 30), Sigma = matrix(c(6, 3, 3, 2), 2, 2))
grp1 <- cbind(grp1, rep(1, 100))
grp2 <- mvrnorm(100 ,mu = c(50, 40), Sigma = matrix(c(4, -3, -3, 5), 2, 2))
grp2 <- cbind(grp2, rep(2, 100))
grp3 <- mvrnorm(100 ,mu = c(30, 45), Sigma = matrix(c(6, 4, 4, 5), 2, 2))
grp3 <- cbind(grp3 ,rep(3, 100))
## Generate a set of six (6) outliers
anom <- matrix(c(35, 40, 25, 60, 25, 60, 35, 40, 25, 60, 60, 25),6, 2)
anom <- cbind(anom, rep(4, 6))
## Bind the test data sets together and display the test data 
test.mvalloc.mat <- rbind(grp1, grp2, grp3, anom)
test.mvalloc <- as.data.frame(test.mvalloc.mat)
dimnames(test.mvalloc)[[2]] <- c("x","y","grp")
attach(test.mvalloc)
xyplot.tags(x, y, grp, cex = 0.75)

## Generate robust reference groups 
test.save.grp1 <- gx.md.gait(grp1[, -3], mcdstart = TRUE)
test.save.grp2 <- gx.md.gait(grp2[, -3], mcdstart = TRUE)
test.save.grp3 <- gx.md.gait(grp3[, -3], mcdstart = TRUE)

## Allocate the synthetic data into the three reference groups
test.save.mvalloc <- gx.mvalloc(pcrit = 0.05, test.mvalloc.mat[,-3],
test.save.grp1, test.save.grp2, test.save.grp3)
## Display the results of the allocation
xyplot.tags(x, y, test.save.mvalloc$xalloc, cex = 0.75)
gx.mvalloc.print(test.save.mvalloc)

## Save the allocation as a csv file
gx.mvalloc.print(test.save.mvalloc, ifprint = FALSE,
file = " ")

## Clean-up and detach synthetic test data
rm(grp1)
rm(grp2)
rm(grp3)
rm(anom)
rm(test.mvalloc)
rm(test.save.grp1)
rm(test.save.grp2)
rm(test.save.grp3)
rm(test.save.mvalloc)
detach(test.mvalloc)



