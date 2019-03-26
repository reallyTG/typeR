library(cheddar)


### Name: Intervality
### Title: Food web Intervality
### Aliases: Intervality MinimiseSumDietGaps SumDietGaps
###   MinimiseSumConsumerGaps SumConsumerGaps
### Keywords: utilities

### ** Examples

data(TL84)
# Perform 5 independent optimisations
res <- MinimiseSumDietGaps(TL84, n=5)

# Compare the original, ordered by body mass and minimised predation matrices
par(mfrow=c(1,3))
PlotPredationMatrix(TL84, main=paste('Sum diet gap', SumDietGaps(TL84)))
TL84.by.M <- OrderCommunity(TL84, 'M')
PlotPredationMatrix(TL84.by.M, 
                    main=paste('Sum diet gap', SumDietGaps(TL84.by.M)))
PlotPredationMatrix(res$reordered, main=paste('Sum diet gap', res$sum.gaps))

# The same comparison but retaining the original column ordering
par(mfrow=c(1,3))
PlotPredationMatrix(TL84)
PlotPredationMatrix(TL84, resource.order=NP(TL84.by.M, 'node'))
PlotPredationMatrix(TL84, resource.order=res$order)



