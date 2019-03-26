library(gpmap)


### Name: decompose_monotone
### Title: Decompose genotype-phenotype map(s) using monotone regression
### Aliases: decompose_monotone decompose_monotone_single

### ** Examples

data(GPmaps)

#Additive GP map is monotone so monoR2=1 and values.mono=values
decompose_monotone(A)

#Pure AxA epistasis map
decompose_monotone(AA)

#two-locus example in Cheverud & Routman (1995)
decompose_monotone(mouseweight)

#decompose four random 3-locus GP maps
set.seed(0)
randomGP <- rnorm(3^2*4)
dim(randomGP) <- c(9,4)
decompose_monotone(generate_gpmap(randomGP))




