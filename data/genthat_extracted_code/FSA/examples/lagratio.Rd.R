library(FSA)


### Name: lagratio
### Title: Ratio of lagged observations.
### Aliases: lagratio
### Keywords: manip

### ** Examples

## Backward lagged ratios
# no recursion
lagratio(1:10,1)
lagratio(1:10,2)
# with recursion
lagratio(1:10,1,2)
lagratio(1:10,2,2)

## Forward lagged ratios
# no recursion
lagratio(10:1,1,direction="forward")
lagratio(10:1,2,direction="forward")
# with recursion
lagratio(10:1,1,2,direction="forward")
lagratio(10:1,2,2,direction="forward")




