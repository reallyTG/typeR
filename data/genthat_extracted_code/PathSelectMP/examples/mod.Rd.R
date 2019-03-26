library(PathSelectMP)


### Name: mod
### Title: Simple Modular arithmetic
### Aliases: mod
### Keywords: helper

### ** Examples

## Don't show: 
function (x, m) 
{
    t1 <- floor(x/m)
    return(x - t1 * m)
  }
## End(Don't show)
mod(10,3)



