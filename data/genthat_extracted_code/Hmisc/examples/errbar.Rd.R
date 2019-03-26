library(Hmisc)


### Name: errbar
### Title: Plot Error Bars
### Aliases: errbar
### Keywords: hplot

### ** Examples

set.seed(1)
x <- 1:10
y <- x + rnorm(10)
delta <- runif(10)
errbar( x, y, y + delta, y - delta )


# Show bootstrap nonparametric CLs for 3 group means and for
# pairwise differences on same graph
group <- sample(c('a','b','d'), 200, TRUE)
y     <- runif(200) + .25*(group=='b') + .5*(group=='d')
cla <- smean.cl.boot(y[group=='a'],B=100,reps=TRUE)  # usually B=1000
a   <- attr(cla,'reps')
clb <- smean.cl.boot(y[group=='b'],B=100,reps=TRUE)
b   <- attr(clb,'reps')
cld <- smean.cl.boot(y[group=='d'],B=100,reps=TRUE)
d   <- attr(cld,'reps')
a.b <- quantile(a-b,c(.025,.975))
a.d <- quantile(a-d,c(.025,.975))
b.d <- quantile(b-d,c(.025,.975))
errbar(c('a','b','d','a - b','a - d','b - d'),
       c(cla[1],clb[1],cld[1],cla[1]-clb[1],cla[1]-cld[1],clb[1]-cld[1]),
       c(cla[3],clb[3],cld[3],a.b[2],a.d[2],b.d[2]),
       c(cla[2],clb[2],cld[2],a.b[1],a.d[1],b.d[1]),
       Type=c(1,1,1,2,2,2), xlab='', ylab='')
       



