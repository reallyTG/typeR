library(optiscale)


### Name: os.plot
### Title: Graph of optimal scaling transformation
### Aliases: os.plot

### ** Examples

  ###   x1 is vector of qualitative data
  ###   x2 is vector of quantitative values
            x1 <- c(1,1,1,1,2,2,2,3,3,3,3,3,3)     
            x2 <- c(3,2,2,2,1,2,3,4,5,2,6,6,4)     
  ###   Optimal scaling, specifying that x1
  ###   is ordinal-discrete
     op.scaled <- opscale(x.qual=x1, x.quant=x2,   
                  level=2, process=1)              
  ###   Plot of optimal scaling transformation
     os.plot(op.scaled$qual, op.scaled$os)         



