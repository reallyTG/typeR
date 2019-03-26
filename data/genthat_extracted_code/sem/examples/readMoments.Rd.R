library(sem)


### Name: readMoments
### Title: Input a Covariance, Correlation, or Raw Moment Matrix
### Aliases: readMoments
### Keywords: manip

### ** Examples


R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
                "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"),
                text="
    .6247     
    .3269  .3669       
    .4216  .3275  .6404
    .2137  .2742  .1124  .0839
    .4105  .4043  .2903  .2598  .1839
    .3240  .4047  .3054  .2786  .0489  .2220
    .2930  .2407  .4105  .3607  .0186  .1861  .2707
    .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
    .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
")   
R.DHP

#the following will work only in an interactive sessions:
    ## Not run: 
##D R.DHP <- readMoments(diag=FALSE, names=c("ROccAsp", "REdAsp", "FOccAsp", 
##D                 "FEdAsp", "RParAsp", "RIQ", "RSES", "FSES", "FIQ", "FParAsp"))
##D     .6247     
##D     .3269  .3669       
##D     .4216  .3275  .6404
##D     .2137  .2742  .1124  .0839
##D     .4105  .4043  .2903  .2598  .1839
##D     .3240  .4047  .3054  .2786  .0489  .2220
##D     .2930  .2407  .4105  .3607  .0186  .1861  .2707
##D     .2995  .2863  .5191  .5007  .0782  .3355  .2302  .2950
##D     .0760  .0702  .2784  .1988  .1147  .1021  .0931 -.0438  .2087
##D     
##D R.DHP
##D     
## End(Not run)



