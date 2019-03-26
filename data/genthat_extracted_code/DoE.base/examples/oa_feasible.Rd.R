library(DoE.base)


### Name: oa_feasible
### Title: Function to Check Whether an Array of Specified Strength Might
###   Exist
### Aliases: oa_feasible
### Keywords: array design

### ** Examples

## strength 2 equal to resolution 3 is the default
## pure level examples (function checks criteria in the order listed here)
oa_feasible(51, rep(5,7))
   ## nruns not divisible by 5^2
oa_feasible(1024, rep(2,14), strength=7)
   ## violates Bierbrauer et al.s bound for 2-level
oa_feasible(6561, rep(3,11), strength=8)
   ## violates Bierbrauer's bound for pure level
oa_feasible(25, rep(5,7))
   ## violates Rao's bound for pure level
oa_feasible(256,rep(4,7), 4)
   ## violates Bush bound (checked for pure level only)
oa_feasible(54, rep(3,26))
   ## violates Bose/Bush bound (checked for pure level only)
oa_feasible(25, rep(5, 12), strength = 1)
   ## feasible; but do not try to optimize (5^12 integer variables!!!)
oa_feasible(243, rep(3,11), strength = 4)
   ## strength 4 design that strictly attains the Rao bound for pure level

## mixed level examples (function checks criteria in the order listed here)
oa_feasible(25, c(rep(5,6),4))
   ## too few df for main effects (special case of Rao's bound)
oa_feasible(100, c(rep(5,6),4), 5)
   ## violates Diestelkamps mixed level version of Bierbrauer's bound
               ## (also violates Rao's bound, but this is checked earlier)
oa_feasible(100, c(rep(5,7),4), 3)
   ## violates Rao's bound for mixed level, strength 3
oa_feasible(100, c(rep(5,7),4), 4)
   ## violates Rao's bound for mixed level, even strength
oa_feasible(100, c(rep(5,7),4), 5)
   ## violates Rao's bound for mixed level, general odd strength
oa_feasible(50, c(2,rep(5,12)))
   ## does not violate any bound, although the pure level portion
   ## violates the Bose/Bush bound
   ## for almost pure level: also check pure level portions!

oa_feasible(24, c(2,4,3,4))
   ## violates divisibility by the LCM of all products of pairs
oa_feasible(48, c(2,4,3,4,2))
   ## TRUE and indeed feasible



