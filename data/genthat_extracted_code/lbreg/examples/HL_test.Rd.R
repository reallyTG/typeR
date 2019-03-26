library(lbreg)


### Name: HL_test
### Title: Hosmer-Lemeshow Goodness of Fit Test
### Aliases: HL_test

### ** Examples

require(lbreg)

# data preparation
data(PCS)
w <- PCS
w <- w[,-1]
w$race <- factor(w$race)
w$dpros <- factor(w$dpros)
w$dcaps <- factor(w$dcaps)

fm <- lbreg(tumor ~ ., data=w)

HL_test(fm)



