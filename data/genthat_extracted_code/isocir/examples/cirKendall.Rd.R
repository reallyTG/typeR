library(isocir)


### Name: cirKendall
### Title: Circular Kendall's Tau
### Aliases: cirKendall
### Keywords: circular isotonic order

### ** Examples


data(cirgenes)
cirKendall(cirgenes[1,],cirgenes[2,])
# Even with missing values:
cirKendall(cirgenes[1,],cirgenes[8,])



