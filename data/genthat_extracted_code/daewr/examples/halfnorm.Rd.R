library(daewr)


### Name: halfnorm
### Title: This function makes a half normal plot of the elements of the
###   vector called effects
### Aliases: halfnorm
### Keywords: hplot

### ** Examples

# Example Separate Normal plots of whole and split plot effects from an unreplicated split-plot 
data(plasma)
sol<-lm(y~A*B*C*D*E,data=plasma)
# get whole plot effects and split plot effects
effects<-coef(sol)
effects<-effects[c(2:32)]
Wpeffects<-effects[c(1:4, 6:11, 16:19, 26)]
Speffects<-effects[c(5,12:15,20:25,27:31)]

#make separate half normal plots
library(BsMD)
halfnorm(Wpeffects,names(Wpeffects),alpha=.10)
halfnorm(Speffects,names(Speffects),alpha=.05)
        


