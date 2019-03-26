library(psych)


### Name: outlier
### Title: Find and graph Mahalanobis squared distances to detect outliers
### Aliases: outlier
### Keywords: multivariate models

### ** Examples

#first, just find and graph the outliers
d2 <- outlier(sat.act)
#combine with the data frame and plot it with the outliers highlighted in blue
sat.d2 <- data.frame(sat.act,d2)
pairs.panels(sat.d2,bg=c("yellow","blue")[(d2 > 25)+1],pch=21)



