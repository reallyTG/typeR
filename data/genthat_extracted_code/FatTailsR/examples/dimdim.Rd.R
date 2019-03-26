library(FatTailsR)


### Name: dimdim
### Title: Length and Dimensions of Vector, Matrix, Array, Data.Frame, List
### Aliases: dimdim dimdim1 dimdimc

### ** Examples


require(timeSeries)

dimdim(NULL) 
dimdim(NA); dimdim(NaN); dimdim(Inf); dimdim(TRUE); dimdim(FALSE)
dimdim(11:39)
dimdim(LETTERS[1:8])
dimdim(matrix(1:60, ncol=5))
dimdim(extractData())
dimdim(as.data.frame(extractData()))
dimdim(data.frame(X=1:2, Y=1:4, Z=LETTERS[1:8]))
dimdim(array(1:240, c(8,6,5)))
dimdim(array(1:240, c(4,2,6,5)))
dimdim(getDSdata())
dimdim(zData)
dimdim(xData)
dimdim(tData)

dimdim1(matrix(1:60, ncol=5))
dimdimc(matrix(1:60, ncol=5))
dimdim1(tData)
dimdimc(tData)




