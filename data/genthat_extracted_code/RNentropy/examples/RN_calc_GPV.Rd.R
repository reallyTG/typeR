library(RNentropy)


### Name: RN_calc_GPV
### Title: RN_calc_GPV
### Aliases: RN_calc_GPV
### Keywords: RNentropy

### ** Examples

data("RN_Brain_Example_tpm")
GPV <- RN_calc_GPV(RN_Brain_Example_tpm)

## The function is currently defined as
function (X, bind = TRUE) 
{
    rnums <- sapply(X, is.numeric)
    GL_LPV <- apply(X[rnums], 1, ".RN_calc_GPV_row")
    if (bind) {
        GPV <- cbind(X, GL_LPV)
        return(GPV)
    }
    else {
        return(GL_LPV)
    }
  }



