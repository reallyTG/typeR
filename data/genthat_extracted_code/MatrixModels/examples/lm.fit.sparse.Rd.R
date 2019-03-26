library(MatrixModels)


### Name: lm.fit.sparse
### Title: Fitter Function for Sparse Linear Models
### Aliases: lm.fit.sparse
### Keywords: regression array

### ** Examples

dd <- expand.grid(a = as.factor(1:3),
                  b = as.factor(1:4),
                  c = as.factor(1:2),
                  d= as.factor(1:8))
n <- nrow(dd <- dd[rep(seq_len(nrow(dd)), each = 10), ])
set.seed(17)
dM <- cbind(dd, x = round(rnorm(n), 1))
## randomly drop some
n <- nrow(dM <- dM[- sample(n, 50),])
dM <- within(dM, { A <- c(2,5,10)[a]
                   B <- c(-10,-1, 3:4)[b]
                   C <- c(-8,8)[c]
                   D <- c(10*(-5:-2), 20*c(0, 3:5))[d]
   Y <- A + B + A*B + C + D + A*D + C*x + rnorm(n)/10
   wts <- sample(1:10, n, replace=TRUE)
   rm(A,B,C,D)
})
str(dM) # 1870 x 7

X <- Matrix::sparse.model.matrix( ~ (a+b+c+d)^2 + c*x, data = dM)
dim(X) # 1870 x 69
X[1:10, 1:20]

## For now, use  'MatrixModels:::'  --- TODO : export once interface is clear!

Xd <- as(X,"matrix")
system.time(fmDense <- lm.fit(Xd, y = dM[,"Y"]))
system.time( r1 <- MatrixModels:::lm.fit.sparse(X, y = dM[,"Y"]) ) # *is* faster
stopifnot(all.equal(r1, unname(fmDense$coeff), tolerance = 1e-12))
system.time(
     r2 <- MatrixModels:::lm.fit.sparse(X, y = dM[,"Y"], method = "chol") )
stopifnot(all.equal(r1, r2$coef, tolerance = 1e-12),
          all.equal(fmDense$residuals, r2$residuals, tolerance=1e-9)
         )
## with weights:
system.time(fmD.w <- with(dM, lm.wfit(Xd, Y, w = wts)))
system.time(fm.w1 <- with(dM, MatrixModels:::lm.fit.sparse(X, Y, w = wts)))
system.time(fm.w2 <- with(dM, MatrixModels:::lm.fit.sparse(X, Y, w = wts,
                                                     method = "chol") ))
stopifnot(all.equal(fm.w1, unname(fmD.w$coeff), tolerance = 1e-12),
          all.equal(fm.w2$coef, fm.w1, tolerance = 1e-12),
          all.equal(fmD.w$residuals, fm.w2$residuals, tolerance=1e-9)
          )



