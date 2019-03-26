library(sfsmisc)


### Name: funEnv
### Title: List-like Environment of Functions (and More)
### Aliases: funEnv
### Keywords: programming data

### ** Examples

ee <- funEnv(f = function(x) g(2*(x+1)),
             g = function(y) hh(y+1),
            hh = function(u) u^2,
          info = "Some Information (not a function)")
ls(ee) # here the same as  names(ee)
## Check that it works: i.e., that "f sees g" and "g sees hh":
stopifnot(all.equal(ee$f(pi), (2*pi+3)^2))
ee$f(0:4) # [1]  9  25  49  81 121



