library(DLMtool)


### Name: makeMeanMP
### Title: Create an MP that averages the results of multiple MPs
### Aliases: makeMeanMP

### ** Examples

## Not run: 
##D MeanMP <- makeMeanMP(c("AvC", "DCAC"))
##D MSE <- runMSE(DLMtool::testOM, MPs=c("AvC", "DCAC", "MeanMP"))
##D Tplot2(MSE)
##D 
##D MeanMP <- makeMeanMP(c("matlenlim", "matlenlim2")) 
##D Data <- DLMtool::SimulatedData
##D matlenlim(1, Data)
##D matlenlim2(1, Data)
##D MeanMP(1, Data)
## End(Not run)



