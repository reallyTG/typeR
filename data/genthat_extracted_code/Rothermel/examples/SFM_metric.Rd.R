library(Rothermel)


### Name: SFM_metric
### Title: Standard fuel models (Albini 1976, Scott & Burgan 2005)
### Aliases: SFM_metric
### Keywords: datasets

### ** Examples

data(SFM_metric)

# ROS using Standard fuel models and Moisture scenarios
data (scenarios, SFM_metric)
modeltype <- SFM_metric ["GR1", "Fuel_Model_Type"]
w <- SFM_metric ["GR1", 2:6]
s <- SFM_metric ["GR1", 7:11]
delta <- SFM_metric ["GR1", "Fuel_Bed_Depth"]
mx.dead <- SFM_metric ["GR1", "Mx_dead"]
h <- SFM_metric ["GR1", 14:18]
m <- scenarios ["D2L2", 1:5]
u <- 8
slope <- 0

a <- ros (modeltype, w, s, delta, mx.dead, h, m, u, slope)
a



