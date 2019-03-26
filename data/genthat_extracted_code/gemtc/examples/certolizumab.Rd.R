library(gemtc)


### Name: certolizumab
### Title: Certolizumab Pegol (CZP) for Rheumatoid Arthritis
### Aliases: certolizumab

### ** Examples

# Run RE regression model with informative heterogeneity prior

regressor <- list(coefficient='shared',
                  variable='diseaseDuration',
                  control='Placebo')

# sd ~ half-Normal(mean=0, sd=0.32)
hy.prior <- mtc.hy.prior(type="std.dev", distr="dhnorm", 0, 9.77)

model <- mtc.model(certolizumab,
                   type="regression",
                   regressor=regressor,
                   hy.prior=hy.prior)

## Not run: 
##D result <- mtc.run(model)
## End(Not run)



