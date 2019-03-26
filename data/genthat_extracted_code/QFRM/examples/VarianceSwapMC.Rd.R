library(QFRM)


### Name: VarianceSwapMC
### Title: VarianceSwap option valuation via Monte Carlo (MC) simulation.
### Aliases: VarianceSwapMC

### ** Examples

(o = VarianceSwapMC())$PxMC #Price = ~0.0245

 (o = VarianceSwapMC(NPaths = 5))$PxMC # Price = ~0.0245

 (o = VarianceSwapMC(var=0.4))$PxMC # Price = ~-0.1565



