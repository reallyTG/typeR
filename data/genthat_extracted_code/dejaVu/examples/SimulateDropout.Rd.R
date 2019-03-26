library(dejaVu)


### Name: SimulateDropout
### Title: Simulate subject dropout
### Aliases: SimulateDropout

### ** Examples

sim <- SimulateComplete(study.time=365,number.subjects=50,
                        event.rates=c(0.01,0.005),dispersions=0.25)
                        
sim.with.MCAR.dropout <- SimulateDropout(sim,
                      drop.mechanism = ConstantRateDrop(rate = 0.0025)) 
sim.with.MAR.dropout <- SimulateDropout(sim, 
                     drop.mechanism = LinearRateChangeDrop(
                                          starting.rate = 0.0025,
                                          rate.change = 0.0005))




