library(PPCI)


### Name: success_ratio
### Title: Evaluate External Valifity os a Binary Partition
### Aliases: success_ratio
### Keywords: file

### ** Examples

## load optidigits dataset
data(optidigits)

## generate a binary partition using minimum normalised cut hyperplane
sol <- ncuth(optidigits$x)

## evaluate using success ratio
success_ratio(sol$cluster, optidigits$c)



