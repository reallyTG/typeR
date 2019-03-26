library(lbreg)


### Name: relrisk
### Title: Regression Adjusted Relative Risks
### Aliases: relrisk

### ** Examples

require(lbreg)

# ungrouped data
# data preparation
data(PCS)
w <- PCS
w <- w[,-1]
w$race <- factor(w$race)
w$dpros <- factor(w$dpros)
w$dcaps <- factor(w$dcaps)

# log-binomial regression
fm <- lbreg(tumor ~ ., data=w)

# relative risks
relrisk(fm)
relrisk(fm, alpha=.10)

# grouped data 
require(lbreg)
data(Caesarian)
m1 <- lbreg( cbind(n1, n0) ~ RISK + NPLAN + ANTIB, data=Caesarian)
relrisk(m1)
relrisk(m1, dispersion=TRUE)





