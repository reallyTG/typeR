library(easyCODA)


### Name: DOT
### Title: Dot plot
### Aliases: DOT
### Keywords: visualization

### ** Examples

# Dot plot of columns of Vegetables data set
data(veg)
DOT(veg)
# Dot plot of domestic work column of TimeBudget data set, split by sex
data(time)
DOT(time[,2], groups=substr(rownames(time),3,3), cols=c("blue","red"), ylim=c(0,20), 
    jitter=2, main="Percentage of Domestic Work")



