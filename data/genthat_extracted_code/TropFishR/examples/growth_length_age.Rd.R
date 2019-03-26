library(TropFishR)


### Name: growth_length_age
### Title: Estimation of growth parameter using length-at-age data
### Aliases: growth_length_age

### ** Examples

# synthetical length at age data
dat <- list(age = rep(1:7,each = 5),
   length = c(rnorm(5,25.7,0.9),rnorm(5,36,1.2),rnorm(5,42.9,1.5),rnorm(5,47.5,2),
   rnorm(5,50.7,0.4),rnorm(5,52.8,0.5),rnorm(5,54.2,0.7)))
growth_length_age(dat, method = "GullandHolt")

# Bertalaffy plot
growth_length_age(dat, method = "BertalanffyPlot", Linf_est = 50)

# non linear least squares method
output <- growth_length_age(param = dat, method = "LSM",
     Linf_init = 30, CI = TRUE, age_plot=NULL)
summary(output$mod)




