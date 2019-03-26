library(qtl)


### Name: sim.cross
### Title: Simulate a QTL experiment
### Aliases: sim.cross
### Keywords: datagen

### ** Examples

# simulate a genetic map
map <- sim.map()


### simulate 250 intercross individuals with 2 QTLs
fake <- sim.cross(map, type="f2", n.ind=250,
                  model = rbind(c(1,45,1,1),c(5,20,0.5,-0.5)))


### simulate 100 backcross individuals with 3 QTL
# a 10-cM map model after the mouse
data(map10)

fakebc <- sim.cross(map10, type="bc", n.ind=100,
                    model=rbind(c(1,45,1), c(5,20,1), c(5,50,1)))


### simulate 8-way RIL by sibling mating
# get lengths from the above 10-cM map
L <- ceiling(sapply(map10, max))

# simulate a 1 cM map
themap <- sim.map(L, n.mar=L+1, eq.spacing=TRUE)

# simulate founder genotypes
pg <- simFounderSnps(themap, "8")

# simulate the 8-way RIL by sib mating (256 lines)
ril <- sim.cross(themap, n.ind=256, type="ri8sib", founderGeno=pg)



