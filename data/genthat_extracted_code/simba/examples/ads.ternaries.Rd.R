library(simba)


### Encoding: UTF-8

### Name: ads.ternaries
### Title: Artificial data-set for studying the mathematical behavior of
###   asymmetric similarity coefficients
### Aliases: ads.ternaries
### Keywords: datasets

### ** Examples

data(ads.ternaries)
library(plotrix)
##take any index you want to study, see the help for sim() for available 
##asymmetric indices or the names of the data.frame:
names(ads.ternaries)

##make a tmp from the index you want to study (we perform a transformation 
##to obtain values between 0 and 1). if you want another index, 
##just change the name in the next line:
tmp <- ads.ternaries$mountford
tmp <- (tmp-min(tmp))/max(tmp)
triax.plot(ads.ternaries[,c(2,3,1)], main="mountford", 
col.symbols=grey(seq(0.1,1,0.1))[floor((tmp*100)/5)+1], pch=16)

##don't wonder: mountford is strange, just try another one:
##this time with rainbow-colors
tmp <- ads.ternaries$soerensen
tmp <- (tmp-min(tmp))/max(tmp)
triax.plot(ads.ternaries[,c(2,3,1)], main="sørensen", 
col.symbols=rainbow(10)[floor((tmp*100)/10)+1], pch=16)

##and an interesting shape: routledge in greyscale...
tmp <- ads.ternaries$routledge
tmp <- (tmp-min(tmp))/max(tmp)
triax.plot(ads.ternaries[,c(2,3,1)], main="routledge", 
col.symbols=grey(seq(0.1,1,0.1))[floor((tmp*100)/5)+1], pch=16)




