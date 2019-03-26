library(eRm)


### Name: anova.llra
### Title: Analysis of Deviance for Linear Logistic Models with Relaxed
###   Assumptions
### Aliases: anova.llra

### ** Examples
## Not run: 
##D ##An LLRA with 2 treatment groups and 1 baseline group, 5 items and 4
##D ##time points. Item 1 is dichotomous, all others have 3, 4, 5, 6
##D ##categories respectively.
##D 
##D #fit LLRA
##D ex2 <- LLRA(llraDat2[,1:20],mpoints=4,groups=llraDat2[,21])
##D 
##D #Imposing a linear trend for items 2 and 3 using collapse_W 
##D collItems2 <- list(c(32,37,42),c(33,38,43))
##D newNames2 <- c("trend.I2","trend.I3")
##D Wnew <- collapse_W(ex2$W,collItems2,newNames2)
##D 
##D #Estimating LLRA with the linear trend for item 2 and 3
##D ex2new <- LLRA(llraDat2[1:20],W=Wnew,mpoints=4,groups=llraDat2[21])
##D 
##D #comparing models with likelihood ratio test
##D anova(ex2,ex2new)
## End(Not run)


