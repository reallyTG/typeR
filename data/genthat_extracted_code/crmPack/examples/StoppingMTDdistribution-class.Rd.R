library(crmPack)


### Name: StoppingMTDdistribution-class
### Title: Stop based on MTD distribution
### Aliases: StoppingMTDdistribution-class .StoppingMTDdistribution
### Keywords: classes

### ** Examples


# As example, here is the rule for: 
#   stopping the study if there is at least 0.9 probability that MTD > 0.5*next_dose.
#   Here MTD is defined as the dose for which prob(DLE)=0.33

myStopping <- StoppingMTDdistribution(target = 0.33,
                                      thresh = 0.5,
                                      prob = 0.9)




