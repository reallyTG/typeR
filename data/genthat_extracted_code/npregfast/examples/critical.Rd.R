library(npregfast)


### Name: critical
### Title: Critical points of the regression function
### Aliases: critical

### ** Examples

library(npregfast)
data(barnacle)

fit <- frfast(DW ~ RC, data = barnacle) # without interactions
critical(fit)
critical(fit, der = 0)
critical(fit, der = 1)
critical(fit, der = 2)

# fit2 <- frfast(DW ~ RC : F, data = barnacle) # with interactions
# critical(fit2)
# critical(fit2, der = 0)
# critical(fit2, der = 1)
# critical(fit2, der = 2)




