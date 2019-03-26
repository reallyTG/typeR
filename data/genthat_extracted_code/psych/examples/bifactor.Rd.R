library(psych)


### Name: Bechtoldt
### Title: Seven data sets showing a bifactor solution.
### Aliases: Bechtoldt.1 Bechtoldt.2 Bechtoldt Holzinger Holzinger.9 Reise
###   Thurstone Thurstone.33 Thurstone.9
### Keywords: datasets

### ** Examples


if(!require(GPArotation)) {message("I am sorry, to run omega requires GPArotation") 
        } else {
#holz <- omega(Holzinger,4, title = "14 ability tests from Holzinger-Swineford")
#bf <- omega(Reise,5,title="16 health items from Reise") 
#omega(Reise,5,labels=colnames(Reise),title="16 health items from Reise")
thur.om <- omega(Thurstone,title="9 variables from Thurstone") #compare with
thur.bf   <- fa(Thurstone,3,rotate="biquartimin")
factor.congruence(thur.om,thur.bf)
}



