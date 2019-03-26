library(evoper)


### Name: abm.saa
### Title: abm.saa
### Aliases: abm.saa

### ** Examples

## Not run: 
##D  f<- PlainFunction$new(f0.rosenbrock2)
##D 
##D  f$Parameter(name="x1",min=-100,max=100)
##D  f$Parameter(name="x2",min=-100,max=100)
##D 
##D  extremize("saa", f)
## End(Not run)

## Not run: 
##D  ## A Repast defined function
##D  f<- RepastFunction$new("/usr/models/BactoSim(HaldaneEngine-1.0)","ds::Output",300)
##D 
##D  ## or a plain function
##D 
##D  f1<- function(x1,x2,x3,x4) {
##D    10 * (x1 - 1)^2 + 20 * (x2 - 2)^2 + 30 * (x3 - 3)^2 + 40 * (x4 - 4)^2
##D  }
##D 
##D  f<- PlainFunction$new(f1)
##D 
##D  f$addFactor(name="cyclePoint",min=0,max=90)
##D  f$addFactor(name="conjugationCost",min=0,max=100)
##D  f$addFactor(name="pilusExpressionCost",min=0,max=100)
##D  f$addFactor(name="gamma0",min=1,max=10)
##D 
##D  abm.saa(f, 100, 1,  100, 0.75)
## End(Not run)




