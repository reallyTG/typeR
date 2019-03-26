library(OpenMx)


### Name: imxGentleResize
### Title: Resize an MxMatrix while preserving entries
### Aliases: imxGentleResize

### ** Examples

m1 <- mxMatrix(values=1:9, nrow=3, ncol=3,
               dimnames=list(paste0('r',1:3), paste0('c',1:3)))

imxGentleResize(m1, dimnames=list(paste0('r',c(1,3,5)),
                                  paste0('c',c(2,4,6))))



