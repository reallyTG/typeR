library(respirometry)


### Name: co2_rate
### Title: Calculate CO2 to add to a respirometer intake flow
### Aliases: co2_rate

### ** Examples

# I want the respirometer to have a pCO2 = 1000 uatm. How much CO2 per minute do I need
# to add to the intake flow if the ambient pH is 8.1 and it is flowing at 3 LPM?
co2_rate(goal_pco2 = 1000, init_pH = 8.1, flow_rate = 3)




