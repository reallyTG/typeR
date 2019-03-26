library(rsm)


### Name: FO
### Title: Response-surface model components
### Aliases: FO TWI PQ SO PE
### Keywords: regression

### ** Examples

  ### See 'rsm' help for examples of FO, TWI, etc
  
  library(rsm)
  ### Test LOF for a regression model
  ChemReact.lm <- lm(Yield ~ Time*Temp, data = ChemReact1)
  PureError.lm <- update (ChemReact.lm, . ~ PE(Time,Temp))
  anova (ChemReact.lm, PureError.lm)



