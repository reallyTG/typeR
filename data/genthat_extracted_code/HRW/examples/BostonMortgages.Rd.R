library(HRW)


### Name: BostonMortgages
### Title: Mortgage applications in Boston
### Aliases: BostonMortgages

### ** Examples

library(HRW) ; data(BostonMortgages)
fit <- glm(deny ~ black + dir + lvr + pbcr + self + single + as.factor(ccs),
                  family = binomial,data = BostonMortgages)
summary(fit)



