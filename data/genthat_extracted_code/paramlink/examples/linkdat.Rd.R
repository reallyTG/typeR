library(paramlink)


### Name: linkdat
### Title: Linkdat objects
### Aliases: linkdat singleton print.linkdat summary.linkdat write.linkdat
###   subset.linkdat

### ** Examples


x = linkdat(toyped, model=1)
x
summary(x)

#### test read/write:
x = modifyMarker(x, 1, alleles=c('B','C'), afreq=c(.9, .1), chrom=2, name='SNP1', pos=123)
write.linkdat(x, prefix='toy')
y = linkdat('toy.ped', map='toy.map', dat='toy.dat', freq='toy.freq', model=1)
unlink(c('toy.ped', 'toy.map', 'toy.dat', 'toy.freq', 'toy.model'))
stopifnot(isTRUE(all.equal(x,y)))

#### test singletons:
w = singleton(id=3, sex=2)
T1 = all.equal(w, linkdat(ped=rbind(c(3,0,0,2,1))))
w = markerSim(w, N=5, alleles=2, afreq=c(0.1,.9))
T2 = all.equal(w, relabel(relabel(w, 10), 3))
T3 = all.equal(w, swapSex(swapSex(w, 3), 3))
T4 = all.equal(w, swapAff(swapAff(w, 3), 3))
stopifnot(T1, T2, T3, T4)

#### several ways of creating the same linkdat object:
alleles = c(157,160,163)
afreq = c(0.3, 0.3, 0.4)
gt10 = c(160, 160)
gt14 = c(160, 163)

z1 = relabel(addOffspring(nuclearPed(1), father=3, noffs=1, aff=2), 10:14)
z1 = addMarker(z1, marker(z1, 10, gt10, 14, gt14, alleles=alleles, afreq=afreq))
z1 = setModel(z1, 2)

z2 = addParents(relabel(nuclearPed(1), 12:14), 12, father=10, mother=11)
z2 = addMarker(z2, rbind(gt10, 0, 0, 0, gt14), alleles=alleles, afreq=afreq)
z2 = setModel(swapAff(z2, 14), 2)

z3 = linkdat(data.frame(ID=10:14, FID=c(0,0,10,0,12), MID=c(0,0,11,0,13), 
             SEX=c(1,2,1,2,1), AFF=c(1,1,1,1,2), 
             M=c('160/160', '0/0', '0/0', '0/0', '160/163')), model=2)
z3 = modifyMarker(z3, 1, alleles=alleles, afreq=afreq)

write.linkdat(z1, prefix='test')
z4 = linkdat('test.ped', map='test.map', dat='test.dat', freq='test.freq', 
             model=2)
z4 = modifyMarker(z4, 1, alleles=alleles, chrom=NA, pos=NA, name=NA)

write.linkdat(z1, prefix='test', merlin=TRUE)
z5 = linkdat('test.ped', map='test.map', dat='test.dat', freq='test.freq', 
             model=2)
z5 = modifyMarker(z5, 1, alleles=alleles, chrom=NA, pos=NA, name=NA)

stopifnot(isTRUE(all.equal(z1,z2)), isTRUE(all.equal(z1,z3)), 
          isTRUE(all.equal(z1,z4)), isTRUE(all.equal(z1,z5)))
unlink(c('test.ped', 'test.map', 'test.dat', 'test.freq', 'test.model'))




