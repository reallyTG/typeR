# require("robCompositions")
# require("MASS")
# require("robustbase")
# genVarsSimple <- function(n=200, p=50, k=3){
#   T <- matrix(rnorm(n*k,0,1), ncol=k)
#   #  B <- matrix(rnorm(p*k,0,0.1), ncol=k)
#   B <- matrix(runif(p*k,-1,1), ncol=k)
#   X <- T %*% t(B)
#   E <-  matrix(rnorm(n*p, 0,0.1), ncol=p)
#   XE <- X + E
#   XE <- isomLRinv(XE)
#   return(constSum(XE))  
# }
# 
# # 
# # crnorm <- function(n, mu, Sigma){ 
# #   constSum(data.frame(exp(mvrnorm(n, mu, Sigma))))
# # }
# # sigGen <- function(p, d){
# #   x <- diag(p)
# #   x[upper.tri(x)] <- x[lower.tri(x)] <- d
# #   x
# # }
# set.seed(1234)
# # x <- crnorm(50, rep(10,10), Sigma=sigGen(10,0.9))
# # x <- xOrig <- x+rnorm(ncol(x)*nrow(x), 10, 1)
# x <- xOrig <- data.frame(genVarsSimple(50, k=3, p=12))
# 
# xOrig <- x
# lim <- apply(x, 2, quantile, 0.05)
# for(i in 1:ncol(x)){
#   x[x[,i] < lim[i],i] <- 0
# }
# xOrig[1,1] <- xOrig[2,2] <- xOrig[3,1] <- 0.00001
# x[1,1] <- x[2,2] <- x[3,1] <- 0
# 
# 
# res01 <- imputeBDLs(x, dl=dl, method="pls", variation = FALSE, verbose = TRUE)
# res02 <- imputeBDLs(x, dl=dl, method="lm", variation = TRUE, verbose = TRUE)
# res01b <- imputeBDLs(x, dl=dl, method="pls", variation = FALSE, verbose = TRUE, test = TRUE)
# res02b <- imputeBDLs(x, dl=dl, method="lm", variation = TRUE, verbose = TRUE, test = TRUE)
# 
# 
# res1 <- impRZilr(x, dl=dl, method="lm")
# res2 <- impRZilr(x, dl=dl, method="MM")
# res3 <- impRZilr(x, dl=dl, method="pls", nComp="boot", verbose=TRUE)
# res4 <- impRZilr(x, dl=dl, method="pls", nComp=rep(5,ncol(x)), verbose=TRUE)
# 
# epsilon <- 55*.Machine$double.eps
# if(any(!c(
#   isTRUE(is.logical((x[1,3]/x[1,4] - res1$x[1,3]/res1$x[1,4]) < epsilon)),
#   isTRUE(is.logical((x[1,3]/x[1,4] - res2$x[1,3]/res2$x[1,4]) < epsilon)),
#   isTRUE(is.logical((x[1,3]/x[1,4] - res3$x[1,3]/res3$x[1,4]) < epsilon)),
#   isTRUE(is.logical((x[1,3]/x[1,4] - res4$x[1,3]/res4$x[1,4]) < epsilon)),
#   isTRUE(is.logical((x[1,3]/x[1,4] - res01$x[1,3]/res01$x[1,4]) < epsilon)),
#   isTRUE(is.logical((x[1,3]/x[1,4] - res02$x[1,3]/res01$x[1,4]) < epsilon))
# ))){
#   stop("ratios are not preserved.")
# }
# 
# check1 <- function(x, w, dl){
#   check <- logical(ncol(x))
#   for(i in 1:ncol(x)){
#     check[i] <- any(x[w[,i],i] > dl[i])
#   }
#   if(any(check)){
#     res <- FALSE
#     stop("values are over detection limit")
#   } else {
#     res <- TRUE
#     message("imputed data passed check below detection limit")
#   }
#   invisible(res)
# }
# 
# if(all(!c(
#   check1(res1$x, w, dl=dl),
#   check1(res2$x, w, dl=dl),
#   check1(res3$x, w, dl=dl),
#   check1(res4$x, w, dl=dl),
#   check1(res01$x, w, dl=dl),
#   check1(res02$x, w, dl=dl)
#   ))){
#     stop("one method imputed above detection limit")
# }
# 
# ### quality
# require("matrixcalc")
# rdcm <- function(x, y){
#   ocov <- cov(isomLR(x))
#   rcov <- cov(isomLR(y))
#   return(frobenius.norm(ocov-rcov)/frobenius.norm(ocov))
# }
# 
# ced <- function(x, y, ni){
#   return(aDist(x, y)/ni)
# }
# 
# ni <- sum(x == 0)
# 
# ced(res01$x, xOrig, ni = ni)
# ced(res02$x, xOrig, ni = ni)
# ced(res01b$x, xOrig, ni = ni)
# ced(res02b$x, xOrig, ni = ni)
# ced(res1$x, xOrig, ni = ni)
# ced(res2$x, xOrig, ni = ni)
# ced(res3$x, xOrig, ni = ni)
# ced(res4$x, xOrig, ni = ni)
# rdcm(res01$x, xOrig)
# rdcm(res02$x, xOrig)
# rdcm(res01b$x, xOrig)
# rdcm(res02b$x, xOrig)
# rdcm(res1$x, xOrig)
# rdcm(res2$x, xOrig)
# rdcm(res3$x, xOrig)
# rdcm(res4$x, xOrig)
# 
# ## compare with zCompositions:
# require("zCompositions")
# resz1 <- multRepl(x, label = 0, dl = dl)
# zm1 <- ced(resz1, xOrig, ni = ni)
# zm1
# zm2 <- rdcm(resz1, xOrig)
# zm2
# zm1 > ced(res01$x, xOrig, ni = ni)
# zm1 > ced(res02$x, xOrig, ni = ni)
# zm2 > rdcm(res01$x, xOrig)
# zm2 > rdcm(res02$x, xOrig)
# 
# 
# ## HD data:
# set.seed(1234)
# x <- xOrig <- crnorm(50, rep(10,60), Sigma=sigGen(60,0.9))
# lim <- 0.01
# x[x < lim] <- 0
# w <- x==0
# dl <- rep(lim, ncol(x))
# 
# resHD01 <- imputeBDLs(x, dl=dl, method="pls", nComp="boot", verbose=TRUE, variation = FALSE, maxit=5)
# resHD02 <- imputeBDLs(x, dl=dl, method="pls", nComp=rep(5,ncol(x)), verbose=TRUE, , maxit=5, variation = FALSE)
# resHD01var <- imputeBDLs(x, dl=dl, method="lm", nComp="boot", verbose=TRUE, variation = TRUE, maxit=5)
# resHD01b <- imputeBDLs(x, dl=dl, method="pls", nComp="boot", verbose=TRUE, variation = FALSE, test=TRUE, maxit=5)
# resHD02b <- imputeBDLs(x, dl=dl, method="pls", nComp=rep(5,ncol(x)), verbose=TRUE, maxit=5, variation = FALSE, test=TRUE)
# resHD01bvar <- imputeBDLs(x, dl=dl, method="lm", nComp="boot", verbose=TRUE, variation = TRUE, test=TRUE, maxit=5)
# 
# 
# resHD1 <- impRZilr(x, dl=dl, method="pls", nComp="boot", verbose=TRUE, maxit=5)
# resHD2 <- impRZilr(x, dl=dl, method="pls", nComp=rep(5,ncol(x)), verbose=TRUE, maxit=5)
# 
# ni <- sum(x == 0)
# 
# ced(resHD01$x, xOrig, ni = ni)
# ced(resHD02$x, xOrig, ni = ni)
# ced(resHD01var$x, xOrig, ni = ni)
# ced(resHD01b$x, xOrig, ni = ni)
# ced(resHD02b$x, xOrig, ni = ni)
# ced(resHD01bvar$x, xOrig, ni = ni)
# ced(resHD1$x, xOrig, ni = ni)
# ced(resHD2$x, xOrig, ni = ni)
# 
# rdcm(resHD01$x, xOrig)
# rdcm(resHD02$x, xOrig)
# rdcm(resHD01var$x, xOrig)
# rdcm(resHD01b$x, xOrig)
# rdcm(resHD02b$x, xOrig)
# rdcm(resHD01bvar$x, xOrig)
# rdcm(resHD1$x, xOrig)
# rdcm(resHD2$x, xOrig)
# 
# ## compare with zCompositions:
# require("zCompositions")
# resz1 <- multRepl(x, label = 0, dl = dl)
# zm1 <- ced(resz1, xOrig, ni = ni)
# zm1
# zm2 <- rdcm(resz1, xOrig)
# zm2
# zm1 > ced(resHD01$x, xOrig, ni = ni)
# zm1 > ced(resHD02$x, xOrig, ni = ni)
# zm2 > rdcm(resHD01$x, xOrig)
# zm2 > rdcm(resHD02$x, xOrig)
# 
# 
# # 
# # 
# # data(arcticLake)
# # x <- arcticLake
# # ## generate rounded zeros artificially:
# # x[x[,1] < 10, 1] <- 0
# # xia <- impRZilr(x, dl=c(10,44,0), eps=0.01, method="MM")
# # xia$x
# 
# 
# #data(expenditures)
# #xOrig <- x <- expenditures
# 
# ## DL as negative values
# #x[x < 350] <- - 350
# 
# #impCoda2(x)
# 
# ## DL given:
# #impCoda2(xOrig, dl=c(0, 350, 350, 350, 350))
# 
# 
# #imp <- impCoda(x, method='roundedZero')
# #imp2 <- alrEM(x, pos=2, dl=rep(5,3))$xImp
# 
# 
