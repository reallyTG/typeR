library(NetComp)


### Name: matrix_threshold
### Title: Remove values from Matrix based on threshold
### Aliases: matrix_threshold

### ** Examples

 #using USArrest dataset
 arrestCor<-cor(t(USArrests))
 arrestCor.7<-matrix_threshold(arrestCor, threshold=0.7, minval=0, abs=TRUE, rm.na=FALSE)
 arrestCor[10:15,1:5]
 arrestCor.7[10:15,1:5]



