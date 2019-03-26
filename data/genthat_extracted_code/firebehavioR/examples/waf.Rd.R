library(firebehavioR)


### Name: waf
### Title: Calculated wind adjustment factor
### Aliases: waf

### ** Examples

#Sheltered fuelbed with a 10 m tall forest with unknown crown ratio and canopy cover
waf(forestHt = 10, sheltered = 'y')
#Sheltered fuelbed with known high crown ratio and canopy cover
waf(forestHt = 10, cr = 40, cc = 40)
#Sheltered fuelbed with known low crown ratio and canopy cover
waf(fuelDepth = 1, forestHt = 10, cr = 10, cc = 10)
#Because cr and cc are low, the previous solution is equivalent to an unsheltered fuelbed
waf(fuelDepth = 1)



