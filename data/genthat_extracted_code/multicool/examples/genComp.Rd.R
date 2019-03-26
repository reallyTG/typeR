library(multicool)


### Name: genComp
### Title: Generate all, or a subset, of the integer partitions of an
###   integer n.
### Aliases: genComp
### Keywords: partitions

### ** Examples

## a small numeric example with all 11 partitions of 6
genComp(6)

## a small example with the integer partitions of 6 of length 3 with empty partitions added
genComp(6, 3, TRUE)

## a larger example - 627 partions of 20, but restricted to those of length 3 or smaller
genComp(20, 3)



