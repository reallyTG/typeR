library(coala)


### Name: locus
### Title: Loci
### Aliases: locus loci locus_single locus_averaged

### ** Examples

# A model with one locus of length 1005 bp:
coal_model(10) + locus_single(1005)
# This is equivalent to:
coal_model(10, 1, 1005)

# A model can contain multiple loci:
coal_model(5) + locus_single(100) + locus_single(200) + locus_single(300)
# Or more efficient with averaged length:
coal_model(5) + locus_averaged(3, 200)
# Or equivalently:
coal_model(5, 3, 200)

# Single and averaged loci can also be combined arbitrarily:
coal_model(15) + locus_averaged(10, 150) + locus_single(250)
coal_model(15, 10, 150) + locus_single(250) + locus_averaged(10, 350)



