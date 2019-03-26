library(BMS)


### Name: bma-class
### Title: Class "bma"
### Aliases: bma-class
### Keywords: classes

### ** Examples

 data(datafls)
 mm=bms(datafls)
 #show posterior model size
 print(mm$info$msize/mm$info$cumsumweights)
 #is the same number as in
 summary(mm)
 



