library(icenReg)


### Name: getFitEsts
### Title: Get Survival Curve Estimates from icenReg Model
### Aliases: getFitEsts

### ** Examples

simdata <- simIC_weib(n = 500, b1 = .3, b2 = -.3,
inspections = 6, inspectLength = 1)
fit <- ic_par(Surv(l, u, type = 'interval2') ~ x1 + x2,
             data = simdata)
new_data <- data.frame(x1 = c(1,2), x2 = c(-1,1))
rownames(new_data) <- c('grp1', 'grp2')

estQ <- getFitEsts(fit, new_data, p = c(.25, .75))

estP <- getFitEsts(fit, q = 400)



