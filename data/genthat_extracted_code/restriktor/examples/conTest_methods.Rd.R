library(restriktor)


### Name: conTest-methods
### Title: Methods for conTest
### Aliases: conTest-methods iht-methods print.conTest

### ** Examples

  # unrestricted linear model for ages (in months) at which an 
  # infant starts to walk alone.
  
  # prepare data
  DATA <- subset(ZelazoKolb1972, Group != "Control")
  
  # fit unrestricted linear model
  fit.lm <- lm(Age ~ -1 + Group, data = DATA)
  
  # restricted linear model with restrictions that the walking 
  # exercises would not have a negative effect of increasing the 
  # mean age at which a child starts to walk. 
  fit.con <- restriktor(fit.lm, constraints = "GroupActive  < GroupPassive; 
                                               GroupPassive < GroupNo")
  
  conTest(fit.con)



