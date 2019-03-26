library(fishmethods)


### Name: growth
### Title: Fitting Growth Curves to Length- or Weight-at-Age Data
### Aliases: growth
### Keywords: misc

### ** Examples

data(pinfish)
growth(intype=1,unit=1,size=pinfish$sl,age=pinfish$age,
        calctype=1,wgtby=1,error=1,Sinf=200,K=0.3,t0=-1)



