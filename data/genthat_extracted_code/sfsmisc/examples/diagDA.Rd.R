library(sfsmisc)


### Name: diagDA
### Title: Diagonal Discriminant Analysis
### Aliases: diagDA dDA print.dDA predict.dDA
### Keywords: naive Bayes classifier models classif

### ** Examples

## two artificial examples by Andreas Greutert:
d1 <- data.frame(x = c(1, 5, 5, 5, 10, 25, 25, 25, 25, 29),
                 y = c(4, 1, 2, 4,  4,  4,     6:8,     7))
n.plot(d1)
library(cluster)
(cl1P <- pam(d1,k=4)$cluster) # 4 surprising clusters
with(d1, points(x+0.5, y, col = cl1P, pch =cl1P))

i1 <- c(1,3,5,6)
tr1 <- d1[-i1,]
cl1. <- c(1,2,1,2,1,3)
cl1  <- c(2,2,1,1,1,3)
plot(tr1, cex=2, col = cl1, pch = 20+cl1)
(dd.<- diagDA(tr1, cl1., ts = d1[ i1,]))# ok
(dd <- diagDA(tr1, cl1 , ts = d1[ i1,]))# ok, too!
points(d1[ i1,], pch = 10, cex=3, col = dd)

## use new fit + predict instead :
(r1 <- dDA(tr1, cl1))
(r1.<- dDA(tr1, cl1.))
stopifnot(dd == predict(r1,  new = d1[ i1,]),
          dd.== predict(r1., new = d1[ i1,]))

plot(tr1, cex=2, col = cl1, bg = cl1, pch = 20+cl1,
     xlim=c(1,30), ylim= c(0,10))
xy <- cbind(x= runif(500, min=1,max=30), y = runif(500, min=0, max=10))
points(xy, cex= 0.5, col = predict(r1, new = xy))
abline(v=c( mean(c(5,25)), mean(c(25,29))))

## example where one variable xj has  Var(xj) = 0:
x4 <- matrix(c(2:4,7, 6,8,5,6,  7,2,3,1, 7,7,7,7), ncol=4)
y <- c(2,2, 1,1)
m4.1 <- dDA(x4, y, pool = FALSE)
m4.2 <- dDA(x4, y, pool = TRUE)
xx <- matrix(c(3,7,5,7), ncol=4)
predict(m4.1, xx)## gave integer(0) previously
predict(m4.2, xx)



