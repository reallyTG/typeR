library(UsingR)


### Name: Split.zoo
### Title: Add split method for zoo objects
### Aliases: Split.zoo
### Keywords: misc

### ** Examples

if(require(zoo)) {
split.zoo = Split.zoo ## make generic
x = zoo(1:30,1:30)
f = sample(letters[1:5],30, replace=TRUE)
split(x,f)
}



