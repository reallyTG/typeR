library(optiscale)


### Name: stress
### Title: Stress coefficients for 'opscale'
### Aliases: stress calc.stress

### ** Examples

  ###   x1 is vector of qualitative data
  ###   x2 is vector of quantitative values
            x1 <- c(1,1,1,1,2,2,2,3,3,3,3,3,3)     
            x2 <- c(3,2,2,2,1,2,3,4,5,2,6,6,4)     
  ###   Optimal scaling, specifying that x1
  ###   is ordinal-discrete, optimally scaled 
  ###   values are not rescaled
     op.scaled <- opscale(x.qual=x1, x.quant=x2,   
                  level=2, process=1,
                  rescale=FALSE)              
  ###  Calculate stress coefficients
    stress(op.scaled)
  ###   Same results can be obtained with:
    calc.stress(op.scaled$quant, op.scaled$os)                               



