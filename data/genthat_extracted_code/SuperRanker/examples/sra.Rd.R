library(SuperRanker)


### Name: sra
### Title: Compute the sequential rank agreement
### Aliases: sra sra.default sra.matrix sra.list

### ** Examples


mlist <- matrix(cbind(1:8,c(1,2,3,5,6,7,4,8),c(1,5,3,4,2,8,7,6)),ncol=3)
sra(mlist)

mlist <- matrix(cbind(1:8,c(1,2,3,5,6,7,4,8),c(1,5,3,4,2,8,7,6)),ncol=3)
sra(mlist, nitems=20, B=10)

alist <- list(a=1:8,b=sample(1:8),c=sample(1:8))
sra(alist)

blist <- list(x1=letters,x2=sample(letters),x3=sample(letters))
sra(blist)

## censored lists are either too short
clist <- list(x1=c("a","b","c","d","e","f","g","h"),
              x2=c("h","c","f","g","b"),
              x3=c("d","e","a"))
set.seed(17)
sra(clist,na.strings="z",B=10)

## or use a special code for missing elements
Clist <- list(x1=c("a","b","c","d","e","f","g","h"),
              x2=c("h","c","f","g","b","z","z","z"),
              x3=c("d","e","a","z","z","z","z","z"))
set.seed(17)
sra(Clist,na.strings="z",B=10)




