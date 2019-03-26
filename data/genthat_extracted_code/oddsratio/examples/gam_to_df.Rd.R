library(oddsratio)


### Name: gam_to_df
### Title: Converts a fitted GAM model into a tidy data frame
### Aliases: gam_to_df
### Keywords: internal

### ** Examples

# load data (Source: ?mgcv::gam)
library(mgcv)
n <- 200
sig <- 2
dat <- gamSim(1, n = n, scale = sig, verbose = FALSE)
dat$x4 <- as.factor(c(rep("A", 50), rep("B", 50), rep("C", 50),
                    rep("D", 50)))
fit_gam <- gam(y ~ s(x0) + s(I(x1^2)) + s(x2) +
               offset(x3) + x4, data = dat) # fit model

tmp <- gam_to_df(fit_gam, "x2")



