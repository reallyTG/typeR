library(Data2LD)


### Name: fdascript
### Title: Positions of the tip of a pen in centimeters while writing in
###   cursive script the letters "fda" twenty times.
### Aliases: fdascript
### Keywords: datasets

### ** Examples

#  load the first record
fdascriptX <- fdascript[,1,1]
fdascriptY <- fdascript[,1,2]
#  Define the observation times in 100ths of a second
centisec <- seq(0,2.3,len=1401)*100
#  plot the script
plot(fdascriptX, fdascriptY, type="l")



