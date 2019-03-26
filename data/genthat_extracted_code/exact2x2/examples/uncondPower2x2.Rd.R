library(exact2x2)


### Name: uncondPower2x2
### Title: Calculate power or sample size for any 2x2 test.
### Aliases: Power2x2 uncondPower2x2 SS2x2
### Keywords: htest

### ** Examples

library(exact2x2)
Power2x2(3,4,.1,.9,0.025, pvalFunc=
  function(x1,n1,x2,n2){
      boschloo(x1,n1,x2,n2, alternative="greater", 
        or=1,tsmethod="central", midp=TRUE)$p.value
  }
)
## 
## Not run: 
##D SS2x2(.1,.9,0.025, n1start=5, pvalFunc=
##D            function(x1,n1,x2,n2){
##D              boschloo(x1,n1,x2,n2, alternative="greater", 
##D                       or=1,tsmethod="central", midp=TRUE)$p.value
##D            }
##D )
## End(Not run)



