library(paramlink)


### Name: mendelianCheck
### Title: Check for Mendelian errors
### Aliases: mendelianCheck

### ** Examples


x = nuclearPed(3)

# Adding a SNP with a mendelian error:
# Individual 3 has an allele 'c' not carried by either parents
m1 = marker(x, 1, c('a','a'), 2, c('a','b'), 3, c('a','c')) 

# Another erroneous marker: The siblings carry more than 4 different alleles.
m2 = marker(x, 3, c(1,2), 4, c(3,4), 5, c(1,5))

# Another marker with incosistent genotypes among the siblings:
m3 = marker(x, 3, c(1,1), 4, c(2,2), 5, c(3,3))

# Another marker with incosistent genotypes among the siblings:
m4 = marker(x, 3, c(1,1), 4, c(2,3), 5, c(1,4))

# A correct marker (all homozygous for allele 'A')
m5 = marker(x, 1:5, 'A')

# An empty marker
m6 = marker(x)

x = setMarkers(x, list(m1,m2,m3,m4,m5,m6))

# Finding the errors
err_index = mendelianCheck(x, remove=FALSE)
stopifnot(all.equal(err_index, 1:4))

x_remove = mendelianCheck(x, remove=TRUE)
stopifnot(x_remove$nMark == 2)




