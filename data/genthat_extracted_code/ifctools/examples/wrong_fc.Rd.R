library(ifctools)


### Name: wrong_fc
### Title: Check Italian fiscal codes
### Aliases: wrong_fc

### ** Examples


fc <- c(NA, "qWeASd34D12h 221M   ", " 12312312312 ")
wrong_fc(fc)
fc <- gsub(" ","", toupper(fc))
wrong_fc(fc)




