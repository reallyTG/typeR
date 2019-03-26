library(phylosim)


### Name: getBaseFreqs.F84
### Title: Get the base frequency parameters
### Aliases: getBaseFreqs.F84 F84.getBaseFreqs getBaseFreqs,F84-method

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
 


