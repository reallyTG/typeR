library(oddsratio)


### Name: or_gam
### Title: Calculate odds ratios of Generalized Additive (Mixed) Models
### Aliases: or_gam

### ** Examples

# load data (Source: ?mgcv::gam) and fit model
library(mgcv)
fit_gam <- gam(y ~ s(x0) + s(I(x1^2)) + s(x2) +
               offset(x3) + x4, data = data_gam) # fit model

# Calculate OR for specific increment step of continuous variable
or_gam(data = data_gam, model = fit_gam, pred = "x2",
       values = c(0.099, 0.198))

## Calculate OR for change of indicator variable
or_gam(data = data_gam, model = fit_gam, pred = "x4",
       values = c("B", "D"))

## Calculate ORs for percentage increments of predictor distribution
## (here: 20%)
or_gam(data = data_gam, model = fit_gam, pred = "x2",
       percentage = 20, slice = TRUE)




