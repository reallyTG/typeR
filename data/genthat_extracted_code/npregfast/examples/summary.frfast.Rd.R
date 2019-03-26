library(npregfast)


### Name: summary.frfast
### Title: Summarizing fits of 'frfast' class
### Aliases: summary.frfast print.frfast

### ** Examples

library(npregfast)
data(barnacle)

# Nonparametric regression without interactions
fit <- frfast(DW ~ RC, data = barnacle, nboot = 100) 
fit
summary(fit)

# Nonparametric regression with interactions
fit2 <- frfast(DW ~ RC : F, data = barnacle, nboot = 100)
fit2
summary(fit2)

# Allometric model
fit3 <- frfast(DW ~ RC, data = barnacle, model = "allo", nboot = 100)
fit3
summary(fit3)




