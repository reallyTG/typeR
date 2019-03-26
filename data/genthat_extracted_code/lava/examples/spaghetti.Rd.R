library(lava)


### Name: spaghetti
### Title: Spaghetti plot
### Aliases: spaghetti

### ** Examples

if (interactive() & requireNamespace("mets")) {
K <- 5
y <- "y"%++%seq(K)
m <- lvm()
regression(m,y=y,x=~u) <- 1
regression(m,y=y,x=~s) <- seq(K)-1
regression(m,y=y,x=~x) <- "b"
N <- 50
d <- sim(m,N); d$z <- rbinom(N,1,0.5)
dd <- mets::fast.reshape(d); dd$num <- dd$num+3
spaghetti(y~num,dd,id="id",lty=1,col=Col(1,.4),
          trend.formula=~factor(num),trend=TRUE,trend.col="darkblue")
dd$num <- dd$num+rnorm(nrow(dd),sd=0.5) ## Unbalance
spaghetti(y~num,dd,id="id",lty=1,col=Col(1,.4),
          trend=TRUE,trend.col="darkblue")
spaghetti(y~num,dd,id="id",lty=1,col=Col(1,.4),
           trend.formula=~num+I(num^2),trend=TRUE,trend.col="darkblue")
}



