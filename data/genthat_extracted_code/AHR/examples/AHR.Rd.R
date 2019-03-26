library(AHR)


### Name: AHR
### Title: AHR
### Aliases: AHR AHR-package

### ** Examples

T <- c(rexp(100, 1), rexp(100, 2))
C <- c(rexp(100, 1), rexp(100, 2))
Y <- pmin(T, C)
D <- T <= C
Z <- rep(c(0,1), c(100, 100))

## uses Kaplan-Meier estimator by default
fit <- avgHR(2, data.frame(Y=Y, D=D, Z=Z), formula=Surv(Y, D) ~ Z)
fit

## same as
## Not run: fit <- avgWKM(2, data.frame(Y=Y, D=D, Z=Z), formula=Surv(Y, D) ~ Z)

## use bootstrap to estimate covariance matrix
## Not run: 
##D fit <- avgWKM(2, data.frame(Y=Y, D=D, Z=Z), formula=Surv(Y, D) ~ Z, cov=FALSE,
##D                        bootstrap=10000)
## End(Not run)

## calculate restricted mean difference
rdm <- rmeanDiff.ahr(fit)
rdm

## ventilation status in intensive care unit patients dataset from etm package
library(etm)
data(sir.cont)
df <- sir.cont
df$Trt <- factor(rep(0, nrow(df)), levels=c(0, 1))
ids <- unique(df$id)
df$Trt[df$id %in% sample(ids, floor(length(ids)/2), FALSE)] <- 1

# transition matrix
tra <- matrix(FALSE, nrow=3, ncol=3)
tra[1, 2:3] <- TRUE
tra[2, c(1, 3)] <- TRUE

# NOTE: variance estimation not yet supported for Aalen-Johansen based avg. HR
sc.fit <- avgHR(2, method="aj", data=df, target="0 2", states=c("0", "1", "2"), transitions=tra,
                censoring="cens", cov=FALSE)
sc.fit




