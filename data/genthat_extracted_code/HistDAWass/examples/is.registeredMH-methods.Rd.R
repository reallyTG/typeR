library(HistDAWass)


### Name: is.registeredMH
### Title: Method is.registeredMH
### Aliases: is.registeredMH is.registeredMH,MatH-method
### Keywords: distribution

### ** Examples


##---- initialize three distributionH objects mydist1 and mydist2
 mydist1=new("distributionH",c(1,2,3),c(0, 0.4, 1))
 mydist2=new("distributionH",c(7,8,10,15),c(0, 0.2, 0.7, 1))
 mydist3=new("distributionH",c(9,11,20),c(0, 0.8, 1))
 ## create a MatH object
 MyMAT=new("MatH",nrows=1,ncols=3,ListOfDist=c(mydist1,mydist2,mydist3), 1,3)
 is.registeredMH(MyMAT)
 ## [1] FALSE #the distributions do not share the same cdf 
 ## Hint: check with str(MyMAT)
 
 ## register the two distributions
 MATregistered=registerMH(MyMAT)
 is.registeredMH(MATregistered)
 ## TRUE #the distributions share the same cdf
 ## Hint: check with str(MATregistered)




