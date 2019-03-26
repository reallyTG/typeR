library(paramlink)


### Name: markers
### Title: Marker functions
### Aliases: markers marker addMarker setMarkers modifyMarker getMarkers
###   removeMarkers swapGenotypes modifyMarkerMatrix

### ** Examples


x = linkdat(toyped)
x = removeMarkers(x, 1) # removing the only marker.
x

# Creating and adding a SNP marker with alleles 'a' and 'b', for which 
# individual 1 is heterozygous, individuals 2 and 4 are homozygous for the 
# 'b' allele, and individual 3 has a missing genotype.
m1 = marker(x, 1, c('a','b'), c(2,4), c('b','b')) 
x = addMarker(x, m1)

# A rare SNP for which both children are heterozygous.
# The 'alleles' argument can be skipped, but is recommended to ensure 
# correct order of the frequencies. 
m2 = marker(x, 3:4, 1:2, alleles=1:2, afreq=c(0.99, 0.01))
x = addMarker(x, m2)

# Modifying the second marker:
# Making it triallelic, and adding a genotype to the father.
x = modifyMarker(x, marker=2, alleles=1:3, ids=1, genotype=2:3)

# Adding an empty SNP (all genotypes are missing):
x = addMarker(x, 0, alleles=c('A', 'B'))

# Similar shortcut for creating a marker for which all 
# pedigree members are homozygous for an allele (say 'b'):
x = addMarker(x, 'b') 
# Alternative: m = marker(x, 'b'); addMarker(x, m)





