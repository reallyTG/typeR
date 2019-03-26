library(wql)


### Name: ec2pss
### Title: Convert conductivity to salinity
### Aliases: ec2pss
### Keywords: manip utilities

### ** Examples


# Check values from Fofonoff and Millard (1983):
R = c(1, 1.2, 0.65) 
t = c(15, 20, 5)
p = c(0, 2000, 1500)
R2pss(R, t, p)  # 35.000 37.246 27.995
# Repeat calculation with equivalent conductivity values by setting 
# ec <- R * C(35, 15, 0):
ec = c(1, 1.2, 0.65) * 42.9140
ec2pss(ec, t, p)  # same results




