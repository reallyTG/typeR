library(VGAM)


### Name: prinia
### Title: Yellow-bellied Prinia
### Aliases: prinia
### Keywords: datasets

### ** Examples

head(prinia)
summary(prinia)
rowSums(prinia[, c("cap", "noncap")])  # 19s

#  Fit a positive-binomial distribution (M.h) to the data:
fit1 <- vglm(cbind(cap, noncap) ~ length + fat, posbinomial, data = prinia)

#  Fit another positive-binomial distribution (M.h) to the data:
#  The response input is suitable for posbernoulli.*-type functions.
fit2 <- vglm(cbind(y01, y02, y03, y04, y05, y06, y07, y08, y09, y10,
                   y11, y12, y13, y14, y15, y16, y17, y18, y19) ~
             length + fat, posbernoulli.b(drop.b = FALSE ~ 0), data = prinia)



