library(kernplus)


### Name: kp.pwcurv
### Title: Predict Wind Power Output by Using a Multivariate Power Curve
### Aliases: kp.pwcurv

### ** Examples

head(windpw)


### Power curve estimation.

# By using a single input of wind speed.
pwcurv.est <- kp.pwcurv(windpw$y, windpw$V)

# By using wind speed and direction: id.dir needs to be set.
pwcurv.est <- kp.pwcurv(windpw$y, windpw[, c('V', 'D')], id.dir = 2)

# By using full covariates: confirm whether id.spd and id.dir are correctly specified.
pwcurv.est <- kp.pwcurv(windpw$y, windpw[, c('V', 'D', 'rho', 'I', 'Sb')], id.spd = 1, id.dir = 2)


### Wind power prediction.

# Suppose only 90% of data are available and use the rest 10% for prediction.
df.tr <- windpw[1:900, ]
df.ts <- windpw[901:1000, ]
id.cov <- c('V', 'D', 'rho', 'I', 'Sb')
pred <- kp.pwcurv(df.tr$y, df.tr[, id.cov], df.ts[, id.cov], id.dir = 2)


### Evaluation of wind power prediction based on 10-fold cross validation.

# Partition the given dataset into 10 folds.
index <- sample(1:nrow(windpw), nrow(windpw))
n.fold <- round(nrow(windpw) / 10)
ls.fold <- rep(list(c()), 10)
for(fold in 1:9) {
  ls.fold[[fold]] <- index[((fold-1)*n.fold+1):(fold*n.fold)]
}
ls.fold[[10]] <- index[(9*n.fold+1):nrow(windpw)]

# Predict wind power output.
pred.res <- rep(list(c()), 10)
id.cov <- c('V', 'D', 'rho', 'I', 'Sb')
for(k in 1:10) {
  id.fold <- ls.fold[[k]]
  df.tr <- windpw[-id.fold, ]
  df.ts <- windpw[id.fold, ]
  pred <- kp.pwcurv(df.tr$y, df.tr[, id.cov], df.ts[, id.cov], id.dir = 2)
  pred.res[[k]] <- list(obs = df.ts$y, pred)
}

# Calculate rmse and its mean and standard deviation.
rmse <- sapply(pred.res, function(res) with(res, sqrt(mean((obs - pred)^2))))
mean(rmse)
sd(rmse)



