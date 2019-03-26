library(compositions)


### Name: binary
### Title: Treating binary and g-adic numbers
### Aliases: binary bit bit.numeric bit.character bit<- bit<-.numeric
###   bit<-.character maxBit maxBit.numeric maxBit.character bitCount
###   gsi.orSum whichBits binary2logical unbinary gadic
### Keywords: logic

### ** Examples

(x<-unbinary("10101010"))
(y<-binary(x))
bit(x,1:3)
bit(y,0:3)
maxBit(x)
maxBit(y)
whichBits(x)
whichBits(y)
binary2logical(y)
bit(x) 
bit(y) 
gsi.orSum(y,1)
bitCount(x)
bitCount(y)
bit(x,2)<-1
x
bit(y,2)<-1
y




