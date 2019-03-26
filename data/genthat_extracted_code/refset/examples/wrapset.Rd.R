library(refset)


### Name: wrapset
### Title: Convenience function to create a parcel containing a refset.
### Aliases: wrapset

### ** Examples

dfr <- data.frame(a=1:5, b=1:5)
parcel <- wrapset(dfr, a<3, , drop=FALSE)
contents(parcel)




