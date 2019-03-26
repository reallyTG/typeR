library(respirometry)


### Name: goal_flush_pH
### Title: Calculate goal pH of a flush reservoir to achieve the post-flush
###   goal pCO2
### Aliases: goal_flush_pH

### ** Examples

# I want the respirometer to have a pCO2 = 1000 uatm. It currently has a pH of 7.6 and is 90 L.
# If I have a 200 L reservoir which will be drained completely, what do I want
# the pH of the reservoir to be?
goal_flush_pH(goal_pco2 = 1000, resp_pH = 7.6, resp_vol = 90, flush_vol = 200)




