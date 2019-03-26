library(LIM)


### Name: Linp
### Title: Solves a linear inverse model using linear programming.
### Aliases: Linp Linp.lim Linp.limfile Linp.character Linp.double
### Keywords: algebra array optimize

### ** Examples

  # the Blending example
  Linp(LIMBlending)

  # the E coli example: two functions to maximimise
  Linp(LIMEcoli)
 
  # E coli example, but only first function optimised..
  Linp(LIMEcoli, cost = -LIMEcoli$Profit[1,])

  # a foodweb example: need to specify the cost function
  # here just sum of absolute values of flows...
  Linp(LIMRigaAutumn, cost = (rep(1, LIMRigaAutumn$NUnknowns)))



