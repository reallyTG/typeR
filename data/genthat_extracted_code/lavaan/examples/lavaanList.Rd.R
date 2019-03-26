library(lavaan)


### Name: lavaanList
### Title: Fit List of Latent Variable Models
### Aliases: lavaanList semList cfaList

### ** Examples

# The Holzinger and Swineford (1939) example
HS.model <- ' visual  =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

# a data generating function
generateData <- function() simulateData(HS.model, sample.nobs = 100)

set.seed(1234)
fit <- semList(HS.model, dataFunction = generateData, ndat = 5,
               store.slots = "partable")

# show parameter estimates, per dataset
coef(fit)



