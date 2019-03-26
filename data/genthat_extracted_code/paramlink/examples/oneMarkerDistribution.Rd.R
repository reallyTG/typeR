library(paramlink)


### Name: oneMarkerDistribution
### Title: Genotype probability distribution
### Aliases: oneMarkerDistribution

### ** Examples


x = nuclearPed(2)
x_aff = swapAff(x, c(1,3))
x_aff = setModel(x_aff, model=1) # dominant model

snp = marker(x, 1, c(1,1), 2, c(1,0), alleles=1:2, afreq=c(0.1, 0.9))
res1 = oneMarkerDistribution(x, ids=3:4, partialmarker=snp)
res2 = oneMarkerDistribution(x_aff, ids=3:4, partialmarker=snp, theta=0.5) 

# should give same result, since theta=0.5 implies that marker is independent of disease.
stopifnot(all.equal(res1, res2))

#### Different example for the same pedigree. A marker with 4 alleles:
m2 = marker(x, 3:4, c('C','D'), alleles=LETTERS[1:4])
oneMarkerDistribution(x, ids=1, partialmarker=m2)

# Same as above, but computing only the cases where individual 1 is heterozygous.
# (The numbers 5:10 refer to the 6 last rows of allGenotypes(4), 
# which contain the heterozygous genotypes.)
oneMarkerDistribution(x, ids=1, partialmarker=m2, grid.subset=matrix(5:10, ncol=1)) 

#### Expanding on the previous example: 
# Joint genotype probabilities of the parents, but including only the combinations 
# where the father is heterozygous and the mother is homozygous:
grid = expand.grid(5:10, 1:4)
oneMarkerDistribution(x, ids=1:2, partialmarker=m2, grid.subset=grid) 

#### Something else: 
# The genotype distribution of an individual whose half cousin is homozygous 
# for a rare allele.
y = halfCousinPed(degree=1)
snp = marker(y, 9, c('a','a'), alleles=c('a', 'b'), afreq=c(0.01, 0.99))
oneMarkerDistribution(y, ids=8, partialmarker=snp)

#### X-linked example:
z = linkdat(Xped, model=4) # X-linked recessive model
z2 = swapAff(z, 1:z$nInd, 1) # disease free version of the same pedigree

snpX = marker(z, c(5,15), c('A','A'), alleles=c('A', 'B'), chrom=23)

r1 = oneMarkerDistribution(z, ids=13, partialmarker=snpX, theta=0.5) # results: A - 0.8; B - 0.2
r2 = oneMarkerDistribution(z2, ids=13, partialmarker=snpX)          # should be same as above
r3 = oneMarkerDistribution(z, ids=13, partialmarker=snpX, theta=0) # results: A - 0.67; B - 0.33

stopifnot(all.equal(r1,r2), round(r1[1], 2)==0.8, round(r3[1], 2) == 0.67)




