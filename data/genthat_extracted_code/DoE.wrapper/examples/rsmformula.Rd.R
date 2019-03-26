library(DoE.wrapper)


### Name: rsmformula
### Title: Functions for supporting response surface analysis with package
###   rsm
### Aliases: rsmformula code.design decode.design
### Keywords: array design

### ** Examples

  ## an artificial example with random response
  ## purely for demonstrating how the functions work together with rsm
  plan <- ccd.design(5, ncenter=6, 
         factor.names = list(one=c(10,30),two=c(1,5),three=c(0.1,0.9),
                             four=c(2,4),five=c(-1,1)))
  set.seed(298)
  plan <- add.response(plan, rnorm(38))
  
  ## coding
  plan.c <- code.design(plan)
  plan.c
  decode.design(plan.c)
  
  ## first order analysis
     ## formulae needed for first order models:
    rsmformula(plan, degree=1)                ## coded
    rsmformula(plan, degree=1, coded=FALSE)   ## original units
    
    ## steepest ascent: steepness assessed in coded units, 
    ## results also presented in original units
    linmod1 <- rsm(rsmformula(plan, degree=1), data=plan.c)
    summary(linmod1)
    steepest(linmod1)
    
    ## steepest ascent: steepness assessed in original units!!! 
    ## this is different from the usual approach!!! 
    ## cf. explanation in Details section
    linmod1.original <- rsm(rsmformula(plan, degree=1, coded=FALSE), data=plan)
    summary(linmod1.original)
    steepest(linmod1.original)

  ## second order analysis (including quadratic, degree=1.5 would omit quadratic
    ## formulae needed for second order models:
    rsmformula(plan, degree=2)               ## coded
    rsmformula(plan, degree=2, coded=FALSE)  ## original units
       ## the formulae can also be constructed analogously to the FO formulae 
       ## by using SO instead of FO
       ## rsmformula returns the more detailed function because 
       ##     it can be more easily modified to omit one of the effects
    
    ## the stationary point is not affected by using coded or original units
    ##     neither is the decision about the nature of the stationary point
    ## a subsequent canonical path analysis will however be affected,
    ##     analogously to the steepest ascent (cf. Details section)
    
    ## analysis in coded units
    linmod2 <- rsm(rsmformula(plan, degree=2), data=plan.c)
    summary(linmod2)
    ## analysis in original units
    linmod2.original <- rsm(rsmformula(plan, degree=2, coded=FALSE), data=plan)
    summary(linmod2.original)
    ## the contour plot may be nicer when using original units
    contour(linmod2, form=~x1*x2)
    contour(linmod2.original, form=~one*two)
    ## the canonical path is usually more reasonable in coded units
    canonical.path(linmod2)            ## coded units
    canonical.path(linmod2.original)   ## original units
    
    ## analogous analysis without the special formula notation of function rsm
    linmod <- rsm(rnorm.38. ~ Block.ccd + (one + two + three + four + five)^2 + 
          I(one^2) + I(two^2) + I(three^2) + I(four^2) + I(five^2), data=plan)
    summary(linmod)
    contour(linmod, form=~one*two)  ## contour plot is possible
    ## steepest or canonical.path cannot be used, 
    ## because the model is a conventional lm
 
    ## contour will not work on the convenience model
    ## lm(plan), which is otherwise identical to linmod
    ## (it will neither work on lm(formula(plan), plan))
    ## or lm(rsmformula(plan), plan)
   


