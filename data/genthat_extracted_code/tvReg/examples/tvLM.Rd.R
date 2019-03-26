library(tvReg)


### Name: tvLM
### Title: Time-Varying Coefficients Linear Models
### Aliases: tvLM tvlm-class tvlm
### Keywords: coefficients linear models, nonparametric regression
###   regression, statistics time time-varying varying

### ** Examples

## Simulate a linear process with time-varying coefficient
## as functions of scaled time.

tau <- seq(0, 1, length.out = 200)
beta <- data.frame(beta1 = sin(2 * pi * tau), beta2 = 2 * tau)
X1 <- rnorm(200)
X2 <- rchisq(200, df = 4)
error <- rt(200, df = 10)
y <- apply(cbind(X1, X2) * beta, 1, sum) + error
data <-data.frame(y = y, X1 = X1, X2 = X2)

## Estimate coefficients with lm and tvLM for comparison

coef.lm <- stats::lm(y ~ 0 + X1 + X2, data = data)$coef
model.tvlm <- tvLM(y ~ 0 + X1 + X2, data = data, bw = 0.2)

## Estimate coefficients of different realized variance models
data("RV")
##Bollerslev et al. (2016) SHARQ model
SHARQ <- lm (RVt ~ RVt_1_pos + RVt_1_neg + I(RVt_1_pos * RQt_1_sqrt) +
I(RVt_1_neg * RQt_1_sqrt) + RVt_1_5 + RVt_1_22, data = tail(RV, 2000))

#Casas et al. (2018) tvSHARQ model
tvSHARQ <- tvLM (RVt ~ RVt_1_pos + RVt_1_neg + RVt_1_5 + RVt_1_22, 
z = tail(RV$RQt_1_sqrt, 2000), data = tail(RV, 2000), bw = 0.002)

boxplot(data.frame(tvSHARQ = tvSHARQ$tvcoef[,2],
SHARQ = SHARQ$coef[2]+ SHARQ$coef[4] * tail(RV$RQt_1_sqrt, 2000)),
main = expression (RV[t-1]^{"+"}), outline = FALSE)
boxplot(data.frame(tvSHARQ = tvSHARQ$tvcoef[,3], 
SHARQ = SHARQ$coef[3]+ SHARQ$coef[5] * tail(RV$RQt_1_sqrt, 2000)),
main = expression (RV[t-1]^{"-"}), outline = FALSE)




