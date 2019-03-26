library(CMLS)


### Name: cv.cmls
### Title: Cross-Validation for cmls
### Aliases: cv.cmls
### Keywords: models multivariate regression optimize smooth

### ** Examples

# make X
set.seed(1)
n <- 50
m <- 20
p <- 2
Xmat <- matrix(rnorm(n*p), nrow = n, ncol = p)


# make B (which satisfies all constraints except monotonicity)
x <- seq(0, 1, length.out = m)
Bmat <- rbind(sin(2*pi*x), sin(2*pi*x+pi)) / sqrt(4.75)
struc <- rbind(rep(c(TRUE, FALSE), each = m / 2),
               rep(c(FALSE, TRUE), each = m / 2))
Bmat <- Bmat * struc


# make noisy data
Ymat <- Xmat %*% Bmat + rnorm(n*m, sd = 0.5)


# 5-fold CV:  tune df (5,...,15) for const = "smooth"
kcv <- cv.cmls(X = Xmat, Y = Ymat, nfolds = 5,
               const = "smooth", df = 5:15)
kcv$best.parameters
kcv$top5.parameters
plot(kcv$full.parameters$df, kcv$full.parameters$cvloss, t = "b")


## No test: 

# sample foldid for 5-fold CV
set.seed(2)
foldid <- sample(rep(1:5, length.out = n))


# 5-fold CV:  tune df (5,...,15) w/ all 20 relevant constraints (no struc)
#             using sequential computation (default)
myconst <- as.character(const(print = FALSE)$label[-c(13:16)])
system.time({
  kcv <- cv.cmls(X = Xmat, Y = Ymat, foldid = foldid,
                 const = myconst, df = 5:15)
})
kcv$best.parameters
kcv$top5.parameters


# 5-fold CV:  tune df (5,...,15) w/ all 20 relevant constraints (no struc)
#             using parallel package for parallel computations
myconst <- as.character(const(print = FALSE)$label[-c(13:16)])
system.time({
   cl <- makeCluster(detectCores())
   kcv <- cv.cmls(X = Xmat, Y = Ymat, foldid = foldid,
                  const = myconst, df = 5:15,
                  parallel = TRUE, cl = cl)
   stopCluster(cl)                  
})
kcv$best.parameters
kcv$top5.parameters


# 5-fold CV:  tune df (5,...,15) w/ all 20 relevant constraints (w/ struc)
#             using sequential computation (default)
myconst <- as.character(const(print = FALSE)$label[-c(13:16)])
system.time({
  kcv <- cv.cmls(X = Xmat, Y = Ymat, foldid = foldid,
                 const = myconst, df = 5:15, struc = struc)
})
kcv$best.parameters
kcv$top5.parameters


# 5-fold CV:  tune df (5,...,15) w/ all 20 relevant constraints (w/ struc)
#             using parallel package for parallel computations
myconst <- as.character(const(print = FALSE)$label[-c(13:16)])
system.time({
  cl <- makeCluster(detectCores())
  kcv <- cv.cmls(X = Xmat, Y = Ymat, foldid = foldid,
                 const = myconst, df = 5:15, struc = struc,
                 parallel = TRUE, cl = cl)
  stopCluster(cl)
})
kcv$best.parameters
kcv$top5.parameters

## End(No test) 




