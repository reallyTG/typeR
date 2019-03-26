library(cdfquantreg)


### Name: residuals.cdfqr
### Title: Register method for cdfqr object functions
### Aliases: residuals.cdfqr

### ** Examples

data(cdfqrExampleData)
fit <- cdfquantreg(crc99 ~ vert | confl, 't2','t2', data = JurorData)

residuals(fit, "pearson")



