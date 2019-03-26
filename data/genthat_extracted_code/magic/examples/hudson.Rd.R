library(magic)


### Name: hudson
### Title: Pandiagonal magic squares due to Hudson
### Aliases: hudson
### Keywords: array

### ** Examples

hudson(n=11)
magicplot(hudson(n=11))
is.associative(hudson(n=13))
hudson(a=(2*1:13)%%13 ,  b=(8*1:13)%%13)
all(replicate(10,is.magic(hudson(a=sample(13),b=sample(13)))))



