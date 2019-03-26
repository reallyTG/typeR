library(sparr)


### Name: bivariate.density
### Title: Bivariate kernel density/intensity estimation
### Aliases: bivariate.density bivden

### ** Examples


data(chorley) # Chorley-Ribble data from package 'spatstat'

# Fixed bandwidth kernel density; uniform edge correction
chden1 <- bivariate.density(chorley,h0=1.5) 

# Fixed bandwidth kernel density; diggle edge correction; coarser resolution
chden2 <- bivariate.density(chorley,h0=1.5,edge="diggle",resolution=64) 

## No test: 
# Adaptive smoothing; uniform edge correction
chden3 <- bivariate.density(chorley,h0=1.5,hp=1,adapt=TRUE)

# Adaptive smoothing; uniform edge correction; partitioning approximation
chden4 <- bivariate.density(chorley,h0=1.5,hp=1,adapt=TRUE,davies.baddeley=0.025)
 
par(mfrow=c(2,2))
plot(chden1);plot(chden2);plot(chden3);plot(chden4)  
## End(No test)




