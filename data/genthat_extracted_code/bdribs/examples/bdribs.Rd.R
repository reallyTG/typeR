library(bdribs)


### Name: bdribs
### Title: bdribs (Bayesian Detection of Risk using Inference on Blinded
###   Safety data)
### Aliases: bdribs

### ** Examples

## Sample calls
    #run 1: simple case with a fixed background rate of 0.45 per 100 pyr.
    bdribs(y=5,pyr=500, bg.rate=0.0045,k=2)

    #run 2: same as run 1; here bg.rate gets computed as bg.events/bg.pyr
    bdribs(y=5,pyr=500, bg.events = 18, bg.pyr = 4000, k=2)

    # run3: when inf.type = 2, uses a Gamma distribution for del0; e.g. here Gamma(18, 4000)
    bdribs(y=5,pyr=500, bg.events = 18, bg.pyr = 4000, k=2, inf.type = 2)

    #run4: similar to run1, but instead of default p~u(0,1) using p~beta(.5,.5)
    bdribs(y=5,pyr=500, , bg.rate=0.0045,k=2, p.params=list(a=.5,b=.5))

    #run5: similar to run1, but instead of default p ~ beta(.5,.5) using r ~ lognormal(mu=0,sd=2)
    bdribs(y=5,pyr=500, , bg.rate=0.0045,k=2, p.params= NULL, r.params=list(mu=0,sd=2))




