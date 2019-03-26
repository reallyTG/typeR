library(CLME)


### Name: resid_boot
### Title: Obtain Residual Bootstrap
### Aliases: resid_boot

### ** Examples

data( rat.blood )
boot_sample <- resid_boot(mcv ~ time + temp + sex + (1|id), nsim = 10, 
                          data = rat.blood, null.resids = TRUE  )




