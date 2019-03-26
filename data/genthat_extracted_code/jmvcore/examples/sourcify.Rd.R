library(jmvcore)


### Name: sourcify
### Title: Converts basic R object into their source representation
### Aliases: sourcify

### ** Examples


sourcify(NULL)

# 'NULL'

sourcify(c(1,2,3))

# 'c(1,2,3)'

l <- list(a=7)
l[['b']] <- 3
l[['c']] <- list(d=3, e=4)
sourcify(l)

# 'list(
#      a=7,
#      b=3,
#      c=list(
#          d=3,
#          e=4))'




