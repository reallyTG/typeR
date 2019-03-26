library(phylosim)


### Name: setBaseFreqs.F84
### Title: Set the base frequency parameters
### Aliases: setBaseFreqs.F84 F84.setBaseFreqs setBaseFreqs,F84-method

### ** Examples

       # construct object
       p<-F84()
       # set/get base frequency parameters
       setBaseFreqs(p,c(2,1,2,1)/6)
       getBaseFreqs(p)
       # set/get base frequency parameters via virtual field
       p$baseFreqs<-c(4,4,1,1)/10
       p$baseFreqs
       # get object summary
       summary(p)
 


