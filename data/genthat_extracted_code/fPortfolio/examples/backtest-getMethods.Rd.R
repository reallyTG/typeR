library(fPortfolio)


### Name: backtest-getMethods
### Title: Portfolio Backtest Extractors
### Aliases: getWindows getWindowsFun getWindowsParams getWindowsHorizon
###   getStrategy getStrategyFun getStrategyParams getSmoother
###   getSmootherFun getSmootherParams getSmootherLambda
###   getSmootherDoubleSmoothing getSmootherInitialWeights getSmootherSkip
### Keywords: models

### ** Examples

## portfolioBacktest Specification -
   backtestSpec = portfolioBacktest()
   backtestSpec
    
## Extract Windows Information -  	
   getWindows(backtestSpec) 
   getWindowsFun(backtestSpec) 
   getWindowsParams(backtestSpec) 
   getWindowsHorizon(backtestSpec) 
   
## Extract Strategy Information - 
   getStrategy(backtestSpec) 
   getStrategyFun(backtestSpec) 
   getStrategyParams(backtestSpec) 
   
## Extract Smoother Information - 
   getSmoother(backtestSpec) 
   getSmootherFun(backtestSpec) 
   getSmootherParams(backtestSpec) 						
   getSmootherLambda(backtestSpec) 
   getSmootherDoubleSmoothing(backtestSpec) 
   getSmootherInitialWeights(backtestSpec) 
   getSmootherSkip(backtestSpec) 



