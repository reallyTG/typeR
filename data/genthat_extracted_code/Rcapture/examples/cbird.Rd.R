library(Rcapture)


### Name: cbird
### Title: Catbird Site Occupancy Data
### Aliases: cbird
### Keywords: datasets

### ** Examples

data(cbird)
desc <- descriptive(cbird, dfreq = TRUE, dtype = "nbcap", t = 11)
plot(desc)
   # The heterogeneity graph is mildly convex, mostly because of 
   # 2 sites where catbirds have been seen six times.

closedp.0(cbird, dfreq = TRUE, dtype = "nbcap", t = 11)
   # The residuals are OK. The occupancy rate (N/50) estimate 
   # varies between 40.6% for M0 and 49.4% for Mh Gamma.
   # One could also try fitting M0 removing the 2 unusual sites:
closedp.0(cbird, dfreq = TRUE, dtype = "nbcap", t = 11, t0 = 5)
   # M0 fits very well and the occupancy rate estimate is 42.6%.



