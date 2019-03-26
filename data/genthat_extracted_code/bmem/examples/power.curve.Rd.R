library(bmem)


### Name: power.curve
### Title: Generate a power curve
### Aliases: power.curve

### ** Examples

## Not run: 
##D ex2model<-'
##D  ept ~ start(.4)*hvltt + b*hvltt + start(0)*age + start(0)*edu + start(2)*R
##D  hvltt ~ start(-.35)*age + a*age + c*edu + start(.5)*edu
##D  R ~ start(-.06)*age + start(.2)*edu
##D  R =~ 1*ws + start(.8)*ls + start(.5)*lt
##D  age ~~ start(30)*age
##D  edu ~~ start(8)*edu
##D  age ~~ start(-2.8)*edu
##D  hvltt ~~ start(23)*hvltt
##D  R ~~ start(14)*R
##D  ws ~~ start(3)*ws
##D  ls ~~ start(3)*ls
##D  lt ~~ start(3)*lt
##D  ept ~~ start(3)*ept 
##D '
##D 
##D indirect<-'ind1 := a*b + c*b'
##D 
##D nobs <- seq(100, 2000, by=200)
##D 
##D power.curve(model=ex2model, indirect=indirect, nobs=nobs, 
##D type='boot', parallel='multicore', ncore=60, ci='percent', 
##D boot.type='simple', interactive=F)
## End(Not run)



