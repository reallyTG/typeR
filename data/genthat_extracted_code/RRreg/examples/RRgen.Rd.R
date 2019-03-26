library(RRreg)


### Name: RRgen
### Title: Generate randomized response data
### Aliases: RRgen

### ** Examples

# Generate responses of 1000 people according to Warner's model,
# every participant complies to the RR procedure
genData <- RRgen(n=1000, pi.true=.3, model="Warner", p=.7)
colMeans(genData)

# use Kuk's model with two decks of cards, 
# p gives the proportions of red cards for carriers/noncarriers
genData <- RRgen(n=1000, pi.true=.4, model="Kuk", p=c(.4,.7))
colMeans(genData)

# Stochastic Lie Detector (SLD):
# Only 80% of carriers answer according to the RR procedure
genData <- RRgen(n=1000, pi.true=.2, model="SLD", p=c(.2,.8),
                 complyRates=c(.8,1),sysBias=c(0,0))
colMeans(genData)



