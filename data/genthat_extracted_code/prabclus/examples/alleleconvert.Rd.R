library(prabclus)


### Name: alleleconvert
### Title: Format conversion for codominant marker data
### Aliases: alleleconvert
### Keywords: manip

### ** Examples

  data(tetragonula)
# This uses example data file Heterotrigona_indoFO.dat
  str(alleleconvert(strmatrix=tetragonula))
  strucmatrix <-
    cbind(c("I1","I1","I2","I2","I3","I3"),
    c("122","144","122","122","144","144"),c("0","0","21","33","35","44"))
  alleleconvert(strmatrix=strucmatrix,format.in="structure",
    format.out="prabclus",orig.nachar="0",firstcolname=TRUE)
  alleleconvert(strmatrix=strucmatrix,format.in="structure",
    format.out="structurama",orig.nachar="0",new.nachar="-9",firstcolname=TRUE)



