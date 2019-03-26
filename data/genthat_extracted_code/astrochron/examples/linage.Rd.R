library(astrochron)


### Name: linage
### Title: Tune stratigraphic series to an astronomical target using
###   graphical interface
### Aliases: linage

### ** Examples

## No test: 
# Check to see if this is an interactive R session, for compliance with CRAN standards.
# YOU CAN SKIP THE FOLLOWING LINE IF YOU ARE USING AN INTERACTIVE SESSION.
if(interactive()) {

# generate example series with 3 precession terms and noise using function 'cycles'
# then convert from time to space using sedimentation rate that increases from 1 to 7 cm/ka
ex=sedRamp(cycles(start=1,end=400, dt=2,noisevar=.00005),srstart=0.01,srend=0.07)

# create astronomical target series
targ=cycles(start=1,end=400,dt=2)

## manually tune
tuned=linage(ex,targ)

## should you need to flip the direction of the astronomical target series, use function 'cb':
tuned=linage(ex,cb(targ[1]*-1,targ[2]))

}

## End(No test)



