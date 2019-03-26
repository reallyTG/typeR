library(polySegratio)


### Name: polySegratio-package
### Title: Segregation Ratios for Autoployploids
### Aliases: polySegratio-package polySegratio
### Keywords: package manip

### ** Examples


## expected segregation proportions heterogeneous parents
expected.segRatio(4)
expected.segRatio("Tetraploid")
expected.segRatio("Octa")

## expected segregation proportions homogeneous parents
expected.segRatio("Octa",type="heter")

## generate dominant markers for autotetraploids
a1 <- sim.autoMarkers(4,c(0.8,0.2))
print(a1)
plot(a1)

## generate crosses for different parental types
p2 <- sim.autoCross(4, dose.proportion=list(p01=c(0.7,0.3),
                     p10=c(0.7,0.3),p11=c(0.6,0.2,0.2)))
print(p2)
plot(p2)

## simulate and test some markers, printing out a summary table of
## no.s of correct marker dosages 

a <- sim.autoMarkers(ploidy = 8, c(0.7,0.2,0.09,0.01),
                     type="hetero", n.markers=500,n.individuals=100)
a <- addMissing(a, 0.07)  # make seven percent missing at random
at <- test.segRatio(a$seg.ratios, ploidy=8, type.parents="het",
                      method="bin")
print(addmargins(table(a$true.doses$dosage, at$dosage, exclude=NULL)))




