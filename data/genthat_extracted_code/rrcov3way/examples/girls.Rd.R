library(rrcov3way)


### Name: girls
### Title: Sempe girls' growth curves data
### Aliases: girls
### Keywords: datasets

### ** Examples

data(girls)
str(girls)
## Center the data in mode A and find the "average girl"
center.girls <- do3Scale(girls, center=TRUE, only.data=FALSE)
X <- center.girls$x
center <- center.girls$center
average.girl <- as.data.frame(matrix(center, ncol=8, byrow=TRUE))
dimnames(average.girl) <- list(dimnames(X)[[3]], dimnames(X)[[2]])

## Divide these variables by 10 to reduce their range
average.girl$weight <- average.girl$weight/10
average.girl$length <- average.girl$length/10
average.girl$crrump <- average.girl$crrump/10

average.girl 
p <- ncol(average.girl)
plot(rownames(average.girl), average.girl[,1], ylim=c(min(average.girl), 
    max(average.girl)), type="n", xlab="Age", ylab="")
for(i in 1: p)
{
    lines(rownames(average.girl), average.girl[,i], lty=i, col=i) 
    points(rownames(average.girl), average.girl[,i], pch=i, col=i) 
}    
legend <- colnames(average.girl)
legend[1] <- paste0(legend[1], "*")
legend[2] <- paste0(legend[3], "*")
legend[3] <- paste0(legend[4], "*")
legend("topleft", legend=legend, col=1:p, lty=1:p, pch=1:p)



