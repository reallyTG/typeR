library(Rothermel)


### Name: gaRoth
### Title: Function to carry out optimization of fuel model by genetic
###   algorithms
### Aliases: gaRoth
### Keywords: model

### ** Examples

library (Rothermel)

# Observed site variables and ROS
data (firexp) 
m <- firexp [, 18:22]
u <- firexp [, "u"]
slope <- firexp [, "slope"]
obs <- firexp [, "ros"]
modeltype <- "S"

# GA optimization using minimization of Root mean square error ("rmse")
# Ranges for fuel model parameters after Ascoli et al. (2015)

ga.model <- gaRoth (m=m, u=u, slope=slope, obs=obs, modeltype=modeltype, 
            method="rmse", popSize=20, maxiter=5,
            w_1h = c(1.5,7.24),
            w_10h = c(0,0),
            w_100h = c(0,0), 
            w_Live_Herb = c(0,0),
            w_Live_Woody = c(2.9,10.4),
            s_1h = c(6640,10036),
            s_10h = c(0,0),
            s_100h = c(0,0),
            s_Live_Herb = c(0,0), 
            s_Live_Woody = c(8810,10560), 
            delta = c(19,70),
            mx.dead = c(25,50),
            h_1h = c(18719,19919),
            h_10h = c(0,0),
            h_100h = c(0,0), 
            h_Live_Herb = c(0,0), 
            h_Live_Woody = c(20000,22504)
            )

summary(ga.model)



