library(solrad)


### Name: LST
### Title: Local Standard Time
### Aliases: LST
### Keywords: LST

### ** Examples


#Calculating  local standard time for two consecutive days

DOY <- seq(0, 2, .05)

lst <- LST(DOY)

plot(DOY, lst)




