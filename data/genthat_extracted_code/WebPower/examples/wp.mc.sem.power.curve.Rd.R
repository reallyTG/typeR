library(WebPower)


### Name: wp.mc.sem.power.curve
### Title: Statistical Power Curve for Structural Equation Modeling /
###   Mediation based on Monte Carlo Simulation
### Aliases: wp.mc.sem.power.curve

### ** Examples

## Not run: 
##D #To specify the model
##D ex2model ="
##D 		ept ~ start(0.4)*hvltt + b*hvltt + start(0)*age + start(0)*edu + start(2)*R
##D 		hvltt ~ start(-0.35)*age + a*age +c*edu + start(0.5)*edu
##D 		R ~ start(-0.06)*age + start(0.2)*edu
##D 		R =~ 1*ws + start(0.8)*ls + start(0.5)*lt
##D 		age ~~ start(30)*age
##D 		edu ~~ start(8)*edu
##D 		age ~~ start(-2.8)*edu
##D 		hvltt ~~ start(23)*hvltt
##D 		R ~~ start(14)*R
##D 		ws ~~ start(3)*ws
##D 		ls ~~ start(3)*ls
##D 		lt ~~ start(3)*lt
##D 		ept ~~ start(3)*ept
##D 	"
##D #To specify the indirect effects
##D indirect = "ind1 := a*b + c*b" 
##D nobs <- seq(100, 2000, by =200)
##D #To calculate power curve:
##D power.curve = wp.mc.sem.power.curve(model=ex2model, indirect=indirect,
##D                               nobs=nobs, type='boot', parallel="muticore")
## End(Not run)




