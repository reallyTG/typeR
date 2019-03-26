## ---- echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE----------------
# library("knitcitations")
library("netregR")
# cleanbib()
# options("citation_format" = "pandoc")

## ---- fig.show='hold'----------------------------------------------------
data("wolf")
# list of data with named response Y:
vlist <- list(wolf$wolf_age_diff, wolf$wolf_same_sex, Y=wolf$wolf)   
# process inputs that adds intercept by default and treats as directed network by default
r <- inputs_lmnet(vlist)

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
# Fit OLS by default, with exchangeable errors
X <- r$X  ;  colnames(X) <- c("Intercept", "age_diff", "same_sex")
fit <- lmnet(r$Y, X) 
summary(fit)     # print summary
plot(fit)   # examine residual plots

# Typical OLS fit:
summary(lm(r$Y ~ X - 1))

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
# Showing multiple ways to obtain the same standard error estimates
range(vnet(e=resid(fit), X=model.matrix(fit))$vhat - vcov(fit))
range(vnet(fit=fit)$vhat - vcov(fit))

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
# Fit GLS
fitgls <- lmnet(r$Y, X, reweight=T) 
cat("Converged?:", fitgls$converged, "\nNumber of iterations:", fitgls$nit)

## ---- echo=FALSE, results='asis'-----------------------------------------
coeftable <- cbind(coef(lm(r$Y ~ X - 1)), coef(fitgls))
colnames(coeftable) <- c("OLS", "GLS")
knitr::kable(round(coeftable, 4), caption="Coefficients for OLS and GLS fits of complete, directed data.")

## ---- echo=TRUE, results='asis'------------------------------------------
# exchangeable standard errors:
see <- sqrt(diag( vcov(fitgls) ))
# dyadic clustering standard errors:
sedc <- sqrt(diag( vnet(fit=fitgls, type="dyadic clustering")$vhat )) 

## ---- echo=FALSE---------------------------------------------------------
setable <- data.frame( "exchangeable"=see, "dyadic_clustering"=sedc )
knitr::kable(round(setable, 4), caption="Standard errors of GLS coefficient estimates based on complete, directed data.")

## ---- fig.show='hold'----------------------------------------------------
# list of data with symmetrized response Y:
wolf_undir <- .5*(wolf$wolf + t(wolf$wolf))
vlist <- list(abs(wolf$wolf_age_diff), wolf$wolf_same_sex, Y=wolf_undir)   
# process inputs that adds intercept by default and treats as directed network by default
ru <- inputs_lmnet(vlist, directed=F)
X <- ru$X  ;  colnames(X) <- c("Intercept", "abs_age_diff", "same_sex")
fit <- lmnet(ru$Y, X, directed=F, reweight=T) 
summary(fit)     # print summary

## ---- fig.show='hold'----------------------------------------------------
Y <- wolf$wolf   # response
Y[which(wolf_undir == 0)] <- NA   # place omissionns in NA
r <- inputs_lmnet(list(wolf$wolf_age_diff, wolf$wolf_same_sex, Y=Y))   
X <- r$X  ;  colnames(X) <- c("Intercept", "abs_age_diff", "same_sex")
# fit <- lmnet(r$Y, X)  # returns an error!

scramble <- sample(1:nrow(X))   # random reordering
fit <- lmnet(r$Y, X, nodes=r$nodes, reweight=T)
fit1 <- lmnet(r$Y[scramble], X[scramble,], nodes=r$nodes[scramble,], reweight=T)
range(coef(fit) - coef(fit1))   # same coefficient entries, e.g.
summary(fit)     # print summary

## ---- fig.show='hold'----------------------------------------------------
data("interactions")   # load social interactions data set
# process data into input format
temp <- inputs_lmnet(Xlist=list(Y=interactions$interactions, X1=interactions$xbinary,
                     X2=interactions$xabs), directed = TRUE, add_intercept=TRUE, 
                     time_intercept = TRUE)  
# OLS with independence in third dimension
fit1 <- lmnet(temp$Y, temp$X, directed=TRUE, tmax=5, 
              nodes=temp$nodes, reweight=FALSE,  type="ind")
# OLS with exchangeability in third dimension
fit2 <- lmnet(temp$Y, temp$X, directed=TRUE, tmax=5, 
              nodes=temp$nodes, reweight=FALSE,  type="exch")  
# GLS with exchangeability in third dimension
fit3 <- lmnet(temp$Y, temp$X, directed=TRUE, tmax=5, 
              nodes=temp$nodes, reweight=TRUE,  type="ind")
# GLS with exchangeability in third dimension
fit4 <- lmnet(temp$Y, temp$X, directed=TRUE, tmax=5, 
              nodes=temp$nodes, reweight=TRUE,  type="exch")

## ---- echo=FALSE---------------------------------------------------------
timetable <- round(cbind(coef(fit1), coef(fit2), coef(fit3), coef(fit4)), 4)
signifs <- cbind( summary(fit1)$coef[,4] < .05, 
summary(fit2)$coef[,4] < .05,
summary(fit3)$coef[,4] < .05,
summary(fit4)$coef[,4] < .05)
signif_coefs <- rep("*", length(signifs))
signif_coefs[!signifs] <- ""
esttable <- matrix(paste0(timetable, signif_coefs), ncol=ncol(timetable))
rownames(esttable) <- c(paste0("intercept ", c("school", "friends", "family", "significant others",  "popular culture")), "xbinary", "xabs")
colnames(esttable) <- c("OLS/ind", "OLS/exch", "GLS/ind", "GLS/exch")
knitr::kable(esttable, caption="Estimated coefficients for the multiple network observation. `*' indicates a p-value less than 0.05.")

## ---- fig.show='hold'----------------------------------------------------
n <- 10
phi1 <- rphi(n, seed=1)    # 6 parameters of random positive definite matrix
phi2 <- rphi(n, seed=1, phi6=T)   # with nonzero 6th parameter

O1 <- build_exchangeable_matrix(n, phi1)   # exchangeable matrix from parameters
min(eigen(O1)$values) > 0   # positive definite?

p1 <- invert_exchangeable_matrix(n, phi1)  # 6 parameters of interted matrix
p2 <- invert_exchangeable_matrix(n, phi2) 

I1 <- O1 %*% build_exchangeable_matrix(n, p1)
range(I1 - diag(nrow(I1)))   # inverse works

I2 <- build_exchangeable_matrix(n, phi2) %*% build_exchangeable_matrix(n, p2)
range(I2 - diag(nrow(I2))) # inverse works

