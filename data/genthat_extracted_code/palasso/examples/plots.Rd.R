library(palasso)


### Name: plots
### Title: Plot functions for manuscript
### Aliases: plots plot_score plot_table plot_circle plot_box plot_pairs
###   plot_diff
### Keywords: internal

### ** Examples

### score ###
n <- 10; p <- 4
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
palasso:::plot_score(X)

### table ###
n <- 5; p <- 3
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
palasso:::plot_table(X,margin=2)

### circle ###
n <- 50; p <- 25
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
Z <- matrix(rnorm(n*p),nrow=n,ncol=p)
b <- sapply(seq_len(p),function(i) abs(cor(X[,i],Z[,i])))
w <- pmax(abs(cor(X)),abs(cor(Z)),na.rm=TRUE)
palasso:::plot_circle(b,w,cutoff=0)

### box ###
n <- 10; p <- 5
X <- matrix(rnorm(n*p),nrow=n,ncol=p)
palasso:::plot_box(X,choice=5)

### pairs ###
n <- 10
x <- runif(n)
y <- runif(n)
palasso:::plot_pairs(x,y)

### diff ###
n <- 100
x <- runif(n)
y <- runif(n)
palasso:::plot_diff(x,y)




