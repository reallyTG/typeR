library(RPEXE.RPEXT)


### Name: gamllik
### Title: Log likelihood from the gamma distribution
### Aliases: gamllik

### ** Examples

time_die <- c(0.05,0.08,0.38,0.41,0.64)
ttot <- c(9.2,5.8,52.1,5.8,40.0)
deaths <- c(1,1,1,1,1)
structtime <- c(0.05,0.64)
structttot <- c(9.2, 40.0)
structdeaths = c(1, 5)
gamllik(structtime,structttot,structdeaths,time_die,ttot,deaths)



