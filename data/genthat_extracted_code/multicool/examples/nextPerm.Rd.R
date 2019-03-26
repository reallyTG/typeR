library(multicool)


### Name: nextPerm
### Title: Return the next permutation of the multiset
### Aliases: nextPerm

### ** Examples

x = c(1,1,2,2)
m1 = initMC(x)

for(i in 1:6){
  cat(paste(paste(nextPerm(m1),collapse=","),"\n"))
}

## an example with letters
x = letters[1:4]
m2 = initMC(x)
nextPerm(m2)
nextPerm(m2)
## and so on



