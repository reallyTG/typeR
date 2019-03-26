library(smooth)


### Name: sim.es
### Title: Simulate Exponential Smoothing
### Aliases: sim.es
### Keywords: models nonlinear regression smooth ts univar

### ** Examples


# Create 40 observations of quarterly data using AAA model with errors from normal distribution
ETS.AAA <- sim.es(model="AAA",frequency=4,obs=40,randomizer="rnorm",mean=0,sd=100)

# Create 50 series of quarterly data using AAA model
# with 40 observations each with errors from normal distribution
ETS.AAA <- sim.es(model="AAA",frequency=4,obs=40,randomizer="rnorm",mean=0,sd=100,nsim=50)

# Create 50 series of quarterly data using AAdA model
# with 40 observations each with errors from normal distribution
# and smoothing parameters lying in the "admissible" range.
ETS.AAA <- sim.es(model="AAA",phi=0.9,frequency=4,obs=40,bounds="admissible",
                  randomizer="rnorm",mean=0,sd=100,nsim=50)

# Create 60 observations of monthly data using ANN model
# with errors from beta distribution
ETS.ANN <- sim.es(model="ANN",persistence=c(1.5),frequency=12,obs=60,
                  randomizer="rbeta",sshape1=1.5,sshape2=1.5)
plot(ETS.ANN$states)

# Create 60 observations of monthly data using MAM model
# with errors from uniform distribution
ETS.MAM <- sim.es(model="MAM",persistence=c(0.3,0.2,0.1),initial=c(2000,50),
           phi=0.8,frequency=12,obs=60,randomizer="runif",min=-0.5,max=0.5)

# Create 80 observations of quarterly data using MMM model
# with predefined initial values and errors from the normal distribution
ETS.MMM <- sim.es(model="MMM",persistence=c(0.1,0.1,0.1),initial=c(2000,1),
           initialSeason=c(1.1,1.05,0.9,.95),frequency=4,obs=80,mean=0,sd=0.01)

# Generate intermittent data using AAdN
iETS.AAdN <- sim.es("AAdN",frequency=1,obs=30,iprob=0.1,initial=c(3,0),phi=0.8)

# Generate iETS(MNN) with TSB style probabilities
pt <- sim.es("MNN",persistence=0.2,initial=0.5,obs=50,mean=0,sd=0.3)
iprob <- mean(rbeta(50,shape1=pt$states,shape2=1-pt$states))
iETS.MNN <- sim.es("MNN",frequency=12,persistence=0.2,initial=4,iprob=iprob,obs=50)




