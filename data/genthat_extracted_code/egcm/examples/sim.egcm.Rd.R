library(egcm)


### Name: sim.egcm
### Title: Generate simulated data from an Engle-Granger cointegration
###   model
### Aliases: sim.egcm

### ** Examples

# Generate a random pair of cointegrated vectors
cv1 <- rcoint(1000)
# Construct a cointegration model from them
e1 <- egcm(cv1)
# Simulate the model for an additional 1000 steps
cv2 <- sim.egcm(e1, 1000)
# Construct a cointegration model from the simulated data
e2 <- egcm(cv2)
# Compare the original model to the model obtained from simulation
e1
e2



