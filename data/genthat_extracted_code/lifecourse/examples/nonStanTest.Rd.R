library(lifecourse)


### Name: nonStanTest
### Title: non standardization test
### Aliases: nonStanTest
### Keywords: lifecourse nonstandardization

### ** Examples


data(mydata) 
# obtaining the in-built data derived from BHPS data.
bbc = mydata
bbcseq = bbc[,2:14]   
# removing the first column which contains the ID for the persons involved.
balphabet =c("non-mover","mover within gb")   
#nll = nonStanTest(bbcseq,balphabet) 
# obtaining the null distribution and p values                            




