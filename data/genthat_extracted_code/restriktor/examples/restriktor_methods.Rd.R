library(restriktor)


### Name: restriktor-methods
### Title: Methods for restriktor
### Aliases: restriktor-methods print.restriktor summary.restriktor
###   print.summary.restriktor coef.restriktor model.matrix.restriktor
###   logLik.restriktor

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
  fit.con <- restriktor(fit.lm, constraints = ' GroupActive  < GroupPassive; 
                                                GroupPassive < GroupNo ')
  
  summary(fit.con)



