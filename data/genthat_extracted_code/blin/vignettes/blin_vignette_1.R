## ---- echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE----------------
library("blin")

## ---- fig.show='hold'----------------------------------------------------
data("forum")
Z <- array(0, c(dim(forum), dim(forum)[3]))
for(i in 1:dim(forum)[3]){  # fit a separate intercept for each week
  Z[,,i,i] <- 1
}

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
fit1 <- blin_mle(forum, Z, lag=1, calcses=TRUE)    # full BLIN model 
summary(fit1)   # summary
plot(fit1)

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
lags <- 1:2
R2 <- matrix(0, length(lags), 3)  ;  colnames(R2) <- c("full", "reduced_rank", "sparse")
for(i in 1:length(lags)){
  fit <- blin_mle(forum, Z, lag=lags[i])
  R2[i,1] <- fit$R2
  fit <- blin_mle(forum, Z, lag=lags[i], rankA=5, rankB=5, type="reduced_rank")
  R2[i,2] <- fit$R2
  fit <- blin_mle(forum, Z, lag=lags[i], type="sparse")
  R2[i,3] <- fit$R2
}
print(R2)

## ---- echo=TRUE, fig.show='hold'-----------------------------------------
Xreg <- build_design(forum, X=Z, lag=1)   # design matrix for lag=1
dim(Xreg)

