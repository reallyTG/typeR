library(Hmisc)


### Name: rcorr.cens
### Title: Rank Correlation for Censored Data
### Aliases: rcorr.cens rcorrcens rcorrcens.formula
### Keywords: survival nonparametric

### ** Examples

set.seed(1)
x <- round(rnorm(200))
y <- rnorm(200)
rcorr.cens(x, y, outx=TRUE)   # can correlate non-censored variables
library(survival)
age <- rnorm(400, 50, 10)
bp  <- rnorm(400,120, 15)
bp[1]  <- NA
d.time <- rexp(400)
cens   <- runif(400,.5,2)
death  <- d.time <= cens
d.time <- pmin(d.time, cens)
rcorr.cens(age, Surv(d.time, death))
r <- rcorrcens(Surv(d.time, death) ~ age + bp)
r
plot(r)

# Show typical 0.95 confidence limits for ROC areas for a sample size
# with 24 events and 62 non-events, for varying population ROC areas
# Repeat for 138 events and 102 non-events
set.seed(8)
par(mfrow=c(2,1))
for(i in 1:2) {
 n1 <- c(24,138)[i]
 n0 <- c(62,102)[i]
 y <- c(rep(0,n0), rep(1,n1))
 deltas <- seq(-3, 3, by=.25)
 C <- se <- deltas
 j <- 0
 for(d in deltas) {
  j <- j + 1
  x <- c(rnorm(n0, 0), rnorm(n1, d))
  w <- rcorr.cens(x, y)
  C[j]  <- w['C Index']
  se[j] <- w['S.D.']/2
 }
 low <- C-1.96*se; hi <- C+1.96*se
 print(cbind(C, low, hi))
 errbar(deltas, C, C+1.96*se, C-1.96*se,
        xlab='True Difference in Mean X',
        ylab='ROC Area and Approx. 0.95 CI')
 title(paste('n1=',n1,'  n0=',n0,sep=''))
 abline(h=.5, v=0, col='gray')
 true <- 1 - pnorm(0, deltas, sqrt(2))
 lines(deltas, true, col='blue')
}
par(mfrow=c(1,1))



