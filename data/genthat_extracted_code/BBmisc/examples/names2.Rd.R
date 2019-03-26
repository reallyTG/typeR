library(BBmisc)


### Name: names2
### Title: Replacement for names which always returns a vector.
### Aliases: names2

### ** Examples

x = 1:3
names(x)
names2(x)
names(x[1:2]) = letters[1:2]
names(x)
names2(x)



