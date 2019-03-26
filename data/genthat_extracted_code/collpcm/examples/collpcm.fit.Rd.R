library(collpcm)


### Name: collpcm.fit
### Title: Fit a latent position cluster network model with model search
### Aliases: collpcm.fit
### Keywords: networks

### ** Examples


# load the Monks data
data(Monks)

# run the model printing run updates to screen
# this is an illustrative example (it should be run for much longer)
z <- collpcm.fit( Monks, G=3, d=2, 
control=list( verbose=TRUE, sample=2500, interval=1, burn=500 ) )

# plot of the collpcm object
plot( z )




