library(VDAP)


### Name: QCon
### Title: Subsetting for VDAP function QCKd
### Aliases: QCon
### Keywords: ~subset ~sub-function

### ** Examples

## The function is currently defined as
function(File1,ColSet){

    Sig <- File1[,min(ColSet)]                  ##Column Calls
    Sig2 <- File1[,max(ColSet)]
    FVari1 <- File1[Sig/Sig2 > 0.5 & Sig/Sig2 < 2.0,]
    FVari1 <- na.omit(FVari1)
    return(FVari1)
    }



