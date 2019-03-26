library(GB2)


### Name: Contindic
### Title: Sensitivity Analysis of Laeken Indicators on GB2 Parameters
### Aliases: Contindic contindic.gb2

### ** Examples

par(mfrow=c(2,2))
shape21 <- 0.3
shape31 <- 0.36
shape22 <- 1.5
shape32 <- 1.5
shape11 <- 2.7
shape12 <- 9.2
resol <- 11
rangea <- round(seq(shape11, shape12 ,length.out=4),digits=1)
arpr <- function(shape1, shape2, shape3) 100*arpr.gb2(0.6, shape1, shape2, shape3)
fonc <- "arpr"
for (shape1 in rangea){
contindic.gb2(resol, shape1, shape21, shape22, shape31, shape32, arpr, "At-risk-of-poverty rate", 
table=TRUE)
}



