library(ChainLadder)


### Name: QuantileIFRS17
### Title: Quantile estimation for the IFRS 17 Risk Adjustment
### Aliases: QuantileIFRS17

### ** Examples


QuantileIFRS17(MCL=list(M1=MackChainLadder(RAA, est.sigma = "Mack"), 
         M2=MackChainLadder(GenIns/1000, est.sigma = "Mack")), 
         Correlation=matrix(c(1,0.3, 0.3, 1), ncol=2), 
         RiskMargin = 20000)



