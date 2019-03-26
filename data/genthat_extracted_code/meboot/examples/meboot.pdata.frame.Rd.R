library(meboot)


### Name: meboot.pdata.frame
### Title: Maximum Entropy Bootstrap for Panel Time Series Data
### Aliases: meboot.pdata.frame
### Keywords: ts

### ** Examples

    ## Ensemble for a panel of series of stock prices  
    data("ullwan")
    out <- meboot(ullwan, reps=99, colsubj=2, coldata=4)
  


