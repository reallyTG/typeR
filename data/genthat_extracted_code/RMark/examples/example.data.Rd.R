library(RMark)


### Name: example.data
### Title: Simulated data from Cormack-Jolly-Seber model
### Aliases: example.data
### Keywords: datasets

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(example.data)
run.example=function()
{
PhiTime=list(formula=~time)
pTimec=list(formula=~time,fixed=list(time=7,value=1))
pTime=list(formula=~time)
PhiAge=list(formula=~age)
Phidot=list(formula=~1)
PhiweightTime=list(formula=~weight+time)
PhiTimeAge=list(formula=~time+age)
mod1=mark(example.data,groups=c("sex","age","region"),
                           initial.ages=c(0,1,2))
mod2=mark(example.data,model.parameters=list(p=pTimec,Phi=PhiTime),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
mod3=mark(example.data,model.parameters=list(Phi=Phidot,p=pTime),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
mod4=mark(example.data,model.parameters=list(Phi=PhiTime),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
mod5=mark(example.data,model.parameters=list(Phi=PhiTimeAge),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
mod6=mark(example.data,model.parameters=list(Phi=PhiAge,p=pTime),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
mod7=mark(example.data,model.parameters=list(p=pTime,Phi=PhiweightTime),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
mod8=mark(example.data,model.parameters=list(Phi=PhiTimeAge,p=pTime),
          groups=c("sex","age","region"),initial.ages=c(0,1,2))
return(collect.models())
}
example.results=run.example()
## End(No test)



