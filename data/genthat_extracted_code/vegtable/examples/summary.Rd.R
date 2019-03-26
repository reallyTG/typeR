library(vegtable)


### Name: summary
### Title: Summary method for vegtable objects.
### Aliases: summary summary,vegtable-method summary,coverconvert-method
###   summary,shaker-method
### Keywords: methods

### ** Examples

library(vegtable)

## Summary for 'vegtable' objects
data(Wetlands)
summary(Wetlands_veg)

## Summary for 'coverconvert' objects
data(braun_blanquet)
summary(braun_blanquet)

## Summary for 'shaker' objects (alone and with companion)
summary(Wetlands)
summary(Wetlands, Wetlands_veg)



