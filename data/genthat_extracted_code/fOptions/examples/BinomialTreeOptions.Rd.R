library(fOptions)


### Name: BinomialTreeOptions
### Title: Binomial Tree Option Model
### Aliases: BinomialTreeOptions CRRBinomialTreeOption JRBinomialTreeOption
###   TIANBinomialTreeOption BinomialTreeOption BinomialTreePlot
### Keywords: math

### ** Examples

## Cox-Ross-Rubinstein Binomial Tree Option Model:
   # Example 14.1 from Hull's Book:
   CRRBinomialTreeOption(TypeFlag = "pa", S = 50, X = 50, 
     Time = 5/12, r = 0.1, b = 0.1, sigma = 0.4, n = 5)
   # Example 3.1.1 from Haug's Book:
    CRRBinomialTreeOption(TypeFlag = "pa", S = 100, X = 95, 
        Time = 0.5, r = 0.08, b = 0.08, sigma = 0.3, n = 5)
   # A European Call - Compare with Black Scholes: 
   CRRBinomialTreeOption(TypeFlag = "ce", S = 100, X = 100, 
     Time = 1, r = 0.1, b = 0.1, sigma = 0.25, n = 50)
   GBSOption(TypeFlag = "c", S = 100, X = 100, 
     Time = 1, r = 0.1, b = 0.1, sigma = 0.25)@price
     
## CRR - JR - TIAN Model Comparison:  
   # Hull's Example as Function of "n":
   par(mfrow = c(2, 1), cex = 0.7)
   steps = 50
   CRROptionValue =  JROptionValue = TIANOptionValue = 
     rep(NA, times = steps)
   for (n in 3:steps) { 
     CRROptionValue[n] = CRRBinomialTreeOption(TypeFlag = "pa", S = 50, 
       X = 50, Time = 0.4167, r = 0.1, b = 0.1, sigma = 0.4, n = n)@price
     JROptionValue[n] = JRBinomialTreeOption(TypeFlag = "pa", S = 50, 
       X = 50, Time = 0.4167, r = 0.1, b = 0.1, sigma = 0.4, n = n)@price 
     TIANOptionValue[n] = TIANBinomialTreeOption(TypeFlag = "pa", S = 50, 
       X = 50, Time = 0.4167, r = 0.1, b = 0.1, sigma = 0.4, n = n)@price 
   }           
   plot(CRROptionValue[3:steps], type = "l", col = "red", ylab = "Option Value")
   lines(JROptionValue[3:steps], col = "green")
   lines(TIANOptionValue[3:steps], col = "blue")
   # Add Result from BAW Approximation:
   BAWValue =  BAWAmericanApproxOption(TypeFlag = "p", S = 50, X = 50, 
     Time = 0.4167, r = 0.1, b = 0.1, sigma = 0.4)@price
   abline(h = BAWValue, lty = 3)
   title(main = "Convergence")
   data.frame(CRROptionValue, JROptionValue, TIANOptionValue)
   
## Plot CRR Option Tree:
   # Again Hull's Example:
   CRRTree = BinomialTreeOption(TypeFlag = "pa", S = 50, X = 50, 
     Time = 0.4167, r = 0.1, b = 0.1, sigma = 0.4, n = 5)
   BinomialTreePlot(CRRTree, dy = 1, cex = 0.8, ylim = c(-6, 7),
     xlab = "n", ylab = "Option Value")
   title(main = "Option Tree")




