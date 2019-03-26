library(queueing)


### Name: CheckInput.i_MMC
### Title: Checks the input params of a M/M/c queueing model
### Aliases: CheckInput.i_MMC
### Keywords: M/M/c

### ** Examples

## See example 10.9 in reference [Sixto2004] for more details.
## create input parameters
i_mmc <- NewInput.MMC(lambda=5, mu=10, c=2, n=0, method=0)

## check the parameters
CheckInput(i_mmc)




