library(mada)


### Name: rsSROC
### Title: Plot the Ruecker-Schumacher (2010) SROC curve
### Aliases: rsSROC

### ** Examples

## First Example
data(Dementia)
ROCellipse(Dementia)
rsSROC(Dementia, add = TRUE) # Add the RS-SROC to this plot

## Second Example
# Make a crowded plot and look at the coefficients
rs_Dementia <- rsSROC(Dementia, col = 3, lwd = 3, lty = 3, 
                      plotstudies = TRUE)
rs_Dementia$lambda
rs_Dementia$aa # intercepts of primary studies on logit ROC space
rs_Dementia$bb # slopes 



