library(fuzzyreg)


### Name: bats
### Title: Temperature Data of Hibernating Bats and Climate at Site
### Aliases: bats
### Keywords: datasets

### ** Examples

data(bats)
# remove outlier
dat <- bats[!(bats$MAST < 0 & bats$temperature > 7), ]
fit <- fuzzylm(temperature ~ MAST, data = dat, method = "plrls", h = 0.01, k1 = 5)
plot(fit, res = 30, col = "orange")



