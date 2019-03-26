library(npregfast)


### Name: frfast
### Title: Fitting nonparametric models
### Aliases: frfast

### ** Examples

library(npregfast)
data(barnacle)

# Nonparametric regression without interactions
fit <- frfast(DW ~ RC, data = barnacle, nboot = 100, smooth = "kernel") 
fit
summary(fit)

# using  splines
#fit <- frfast(DW ~ s(RC), data = barnacle, nboot = 100, 
#smooth = "splines", cluster = TRUE, ncores = 2) 
#fit
#summary(fit)


# Change the number of binning nodes and bootstrap replicates
fit <- frfast(DW ~ RC, data = barnacle, kbin = 200,
               nboot = 100, smooth = "kernel")

# Nonparametric regression with interactions
fit2 <- frfast(DW ~ RC : F, data = barnacle, nboot = 100)
fit2
summary(fit2)

# using  splines
#fit2 <- frfast(DW ~ s(RC, by = F), data = barnacle,
#               nboot = 100, smooth = "splines", cluster = TRUE, ncores = 2)
#fit2
#summary(fit2)


# Allometric model
fit3 <- frfast(DW ~ RC, data = barnacle, model = "allo", nboot = 100)
summary(fit3)

# fit4 <- frfast(DW ~ RC : F, data = barnacle, model = "allo", nboot = 100)
# summary(fit4)




