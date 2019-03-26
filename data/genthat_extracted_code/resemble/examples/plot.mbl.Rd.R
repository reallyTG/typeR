library(resemble)


### Name: plot.mbl
### Title: Plot method for an object of class 'mbl'
### Aliases: plot.mbl

### ** Examples

## Not run: 
##D require(prospectr)
##D 
##D data(NIRsoil)
##D 
##D Xu <- NIRsoil$spc[!as.logical(NIRsoil$train),]
##D Yu <- NIRsoil$CEC[!as.logical(NIRsoil$train)]
##D Yr <- NIRsoil$CEC[as.logical(NIRsoil$train)]
##D Xr <- NIRsoil$spc[as.logical(NIRsoil$train),]
##D 
##D Xu <- Xu[!is.na(Yu),]
##D Yu <- Yu[!is.na(Yu)]
##D 
##D Xr <- Xr[!is.na(Yr),]
##D Yr <- Yr[!is.na(Yr)] 
##D 
##D ctrl <- mblControl(sm = "cor", ws = 51, 
##D                    pcSelection = list("cumvar", 0.999), 
##D                    valMethod = c("NNv"), 
##D                    scaled = TRUE, center = TRUE)
##D 
##D ex1 <- mbl(Yr = Yr, Xr = Xr, Yu = NULL, Xu = Xu,
##D            mblCtrl = ctrl,
##D            dissUsage = "none", 
##D            k = seq(30, 250, 30), 
##D            method = "wapls1",
##D            plsC = c(7, 20))
##D 
##D plot(ex1)
## End(Not run)



