library(SoilR)


### Name: OnepModel
### Title: Implementation of a one pool model
### Aliases: OnepModel

### ** Examples

t_start=0 
t_end=10 
tn=50
timestep=(t_end-t_start)/tn 
t=seq(t_start,t_end,timestep) 
k=0.8
C0=100
In = 30

    
Ex=OnepModel(t,k,C0,In)
Ct=getC(Ex)
Rt=getReleaseFlux(Ex)
Rc=getAccumulatedRelease(Ex)

plot(
  t,
  Ct,
  type="l",
  ylab="Carbon stocks (arbitrary units)",
  xlab="Time (arbitrary units)",
  lwd=2
) 

plot(
  t,
  Rt,
  type="l",
  ylab="Carbon released (arbitrary units)",
  xlab="Time (arbitrary units)",
  lwd=2
) 

plot(
  t,
  Rc,
  type="l",
  ylab="Cummulative carbon released (arbitrary units)",
  xlab="Time (arbitrary units)",
  lwd=2
) 




