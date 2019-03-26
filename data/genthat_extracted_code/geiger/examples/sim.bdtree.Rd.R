library(geiger)


### Name: sim.bdtree
### Title: birth-death tree simulator
### Aliases: sim.bdtree
### Keywords: arith graphs

### ** Examples


# Pure-birth tree
p1 <- sim.bdtree(b=0.1, d=0, stop="time", t=20)
plot(p1)

# Birth-death tree with extinct taxa
# The extinct flag prevents trees with no survivors

p2 <- sim.bdtree(b=0.2, d=0.05, stop="time", t=20, extinct=FALSE)
plot(p2)

# Previous tree with extinct taxa removed
p3 <- drop.extinct(p2)




