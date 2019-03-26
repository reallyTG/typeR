library(heemod)


### Name: define_spline_survival
### Title: Define a Restricted Cubic Spline Survival Distribution
### Aliases: define_spline_survival

### ** Examples


define_spline_survival(
  scale = "hazard", 
  gamma = c(-18.3122, 2.7511, 0.2292), 
  knots=c(4.276666, 6.470800, 7.806289)
)
define_spline_survival(
  scale = "odds", 
  gamma = c(-18.5809, 2.7973, 0.2035), 
  knots=c(4.276666, 6.470800, 7.806289)
)




