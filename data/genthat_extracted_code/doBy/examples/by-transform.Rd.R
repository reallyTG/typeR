library(doBy)


### Name: by-transform
### Title: Function to make groupwise transformations
### Aliases: by-transform transformBy
### Keywords: univar

### ** Examples

 
data(dietox)
transformBy(~Pig, data=dietox, minW=min(Weight), maxW=max(Weight), 
    gain=diff(range(Weight)))




