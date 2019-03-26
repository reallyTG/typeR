library(interim)


### Name: cross
### Title: Scheduling interim analyses in clinical trials
### Aliases: cross

### ** Examples

x=recruitment(nc=Inf,ns=Inf,cw=4,sw=2,sf=0.3,tb=4,en=400)
y=treatment(r=x,du=26,dr=convertedRate(0.3,52,26))
z=treatment(r=x,du=52,dr=0.3)
trialCourse(r=x,t1=y,t2=z)
trialWeek(t=y,p=100)
cross(w=trialWeek(t=y,p=100),p=100)



