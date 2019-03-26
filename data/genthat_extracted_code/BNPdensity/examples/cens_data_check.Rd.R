library(BNPdensity)


### Name: cens_data_check
### Title: Censoring data check
### Aliases: cens_data_check
### Keywords: internal

### ** Examples

## The function is currently defined as
function (xleft, xright) 
{
    if (any(xright < xleft, na.rm = T)) 
        stop("in censored data, left bound not always smaller than right bound")
    if (any(mapply(FUN = function(xileft, xiright) {
        is.na(xileft) & is.na(xiright)
    }, xleft, xright))) 
        stop("in censored data, there is an NA NA")
  }



