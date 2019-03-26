library(manipulate)


### Name: button
### Title: Create a button control
### Aliases: button

### ** Examples

## Not run: 
##D 
##D ## use a button to reset a random seed
##D manipulate(
##D   {
##D     if(resetSeed)
##D       set.seed(sample(1:1000))
##D 
##D     hist(rnorm(n=100, mean=0, sd=3), breaks=bins)
##D   },
##D   bins = slider(1, 20, step=1, initial =5, label="Bins"),
##D   resetSeed = button("Reset Seed")
##D )
##D 
## End(Not run)



