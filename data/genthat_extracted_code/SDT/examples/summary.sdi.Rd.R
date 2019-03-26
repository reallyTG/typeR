library(SDT)


### Name: summary.sdi
### Title: Summary Method for Objects of Class sdi
### Aliases: summary.sdi
### Keywords: methods univar

### ** Examples

## attach dataset to search path (for using variable names)
attach(learning_motivation)

## original and adjusted index summary
summary(sdi(intrinsic, identified, introjected, external, compute.adjusted = FALSE))
summary(sdi(intrinsic, identified, introjected, external))



