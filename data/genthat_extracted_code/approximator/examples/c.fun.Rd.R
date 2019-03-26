library(approximator)


### Name: c.fun
### Title: Correlations between points in parameter space
### Aliases: c_fun c.fun cdash.fun
### Keywords: math

### ** Examples

data(toyapps)

x <- latin.hypercube(4,3)
rownames(x) <- c("ash" , "elm" , "oak", "pine")
xdash <- latin.hypercube(7,3)
rownames(xdash) <- c("cod","bream","skate","sole","eel","crab","squid")

cdash.fun(x=x,xdash=xdash, D1=D1.toy, basis=basis.toy,subsets=subsets.toy, hpa=hpa.toy)

# Now add a point whose top-level value is known:
x <- rbind(x,D1.toy[subsets.toy[[4]][1],])

cdash.fun(x=x,xdash=xdash, D1=D1.toy, basis=basis.toy,subsets=subsets.toy, hpa=hpa.toy)
# Observe how the bottom row is zero (up to rounding error)



