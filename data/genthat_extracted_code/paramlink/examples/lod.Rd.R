library(paramlink)


### Name: lod
### Title: Two-point LOD score
### Aliases: lod

### ** Examples


x = linkdat(toyped, model=1)
res = lod(x)
res_theta = lod(x, theta=c(0, 0.1, 0.2, 0.5))
res_max = lod(x, theta='max')
stopifnot(all(0.3 == round(c(res, res_theta['0',], res_max['LOD',]), 1)))

# bigger pedigree with several markers
y = linkdat(dominant)
y = setModel(y, model=1, penetrances=c(.001, .9, .99))
lod(y, markers=305:310)
lod(y, markers=305:310, theta='max')

# Example with pedigree with loops:
z = linkdat(twoloops, model=2) # fully penetrant autosomal recessive model.

# add SNP for which individuals 15 and 16 are homozygous for the rare allele.
m = marker(z, 15:16, c(1,1), alleles=1:2, afreq=c(0.001, 0.999))
z = addMarker(z, m)
res1 = lod(z)
# manual specification of loop breakers gives same result
res2 = lod(z, loop_breakers=c(8,12))

# making the marker triallelic and adding some genotypes.
z = modifyMarker(z, marker=1, ids=c(7,9,11,13), genotype=3, alleles=1:3, afreq=c(0.001, 0.499, 0.5))
plot(z, 1)
res3 = lod(z)

z = modifyMarker(z, marker=1, alleles=1:4, afreq=c(0.001, 0.499, 0.25, 0.25)) 
res4 = lod(z)

stopifnot(all(3 == round(c(res1, res2, res3, res4), 1)))




