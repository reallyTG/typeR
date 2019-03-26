library(vows)


### Name: plot.funkmeans
### Title: Plotting of k-means clustering results for massively parallel
###   smooths
### Aliases: plot.funkmeans

### ** Examples


data(test)
d4 = test$d4
x = test$x
semi.obj = semipar4d(d4, formula = ~sf(x), data = data.frame(x = x), lsp=-5:5)
myfdobj = extract.fd(semi.obj)

# Case 1: fd object is stored in funkmeans object...
fkmobj = funkmeans(myfdobj, ncomp = 8, centers = 6)
plot(fkmobj)

# Case 2: fd object is not stored...
fkmobj = funkmeans(myfdobj, ncomp = 8, centers = 6, store.fdobj=FALSE)
plot(fkmobj, myfdobj)



