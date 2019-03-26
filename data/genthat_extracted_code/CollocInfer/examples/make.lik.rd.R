library(CollocInfer)


### Name: make.lik
### Title: Observation Process Distribution Function
### Aliases: make.lik make.SSElik make.multinorm pomp.dmeasure

### ** Examples


# Straightforward sum of squares:

lik = make.SSElik()
lik$more = make.id()

# Multivariate normal about an exponentiated state with constant variance

lik = make.multinorm()
lik$more = c(make.exp(),make.cvar())




