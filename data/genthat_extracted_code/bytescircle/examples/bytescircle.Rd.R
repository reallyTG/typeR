library(bytescircle)


### Name: bytescircle
### Title: Statistics About Bytes Contained in a File as a Circle Plot
### Aliases: bytescircle

### ** Examples

 bytescircle( system.file("extdata", "gplv3.txt", package="bytescircle"), 
   ascii=TRUE, plot=1, output=2)

 # which bytes in this file have a sd greater than 2*sigma?
 BYTES=bytescircle( system.file("extdata", "gplv3.txt.gz", package="bytescircle"), plot=3, 
   col=c("gold","blueviolet")); 
 which(BYTES$deviation>2.0)-1 # -1, 'cause BYTES[1] corresponds to byte 0 

 # use a vector as input:
 BYTES=c(256:1); bytescircle(input=BYTES,output=0)




