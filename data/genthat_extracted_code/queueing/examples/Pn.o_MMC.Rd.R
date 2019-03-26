library(queueing)


### Name: Pn.o_MMC
### Title: Returns the probabilities of a M/M/c queueing model
### Aliases: Pn.o_MMC Qn.o_MMC
### Keywords: M/M/c

### ** Examples

## See example 10.9 in reference [Sixto2004] for more details.
## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## Build the model
o_mmc <- QueueingModel(i_mmc)

## Returns the probabilities
Pn(o_mmc)
Qn(o_mmc)



