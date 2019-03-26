library(rSFA)


### Name: sfaStep
### Title: Update a step of the SFA algorithm.
### Aliases: sfaStep

### ** Examples

## Suppose you have divided your training data into two chunks,
   ## DATA1 and DATA2. Let the number of input dimensions be N. To apply
   ## SFA on them write:
   ## Not run: 
##D    sfaList = sfa2Create(N,xpDim(N))
##D    sfaList = sfaStep(sfaList, DATA1, "preprocessing")
##D    sfaList = sfaStep(sfaList, DATA2)
##D    sfaList = sfaStep(sfaList, DATA1, "expansion")
##D    sfaList = sfaStep(sfaList, DATA2)
##D    sfaList = sfaStep(sfaList, NULL, "sfa")
##D    output1 = sfaExecute(sfaList, DATA1)
##D    output2 = sfaExecute(sfaList, DATA2)
##D    
## End(Not run)



