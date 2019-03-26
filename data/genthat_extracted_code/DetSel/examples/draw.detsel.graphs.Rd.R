library(DetSel)


### Name: draw.detsel.graphs
### Title: Plot Graphical Outputs
### Aliases: draw.detsel.graphs

### ** Examples

## This is to generate an example file in the working directory.
make.example.files()

## This will read an input file named 'data.dat' that contains co-dominant markers,
## and a maximum allele frequency of 0.99 will be applied (i.e., by removing 
## marker loci in the observed and simulated datasets that have an allele with
## frequency larger than 0.99).
read.data(infile = 'data.dat',dominance = FALSE,maf = 0.99)

## The following command line executes the simulations:
run.detsel(example = TRUE)

## This compute empirical P-values, assuming a range of values from -1 to 1
## in both dimensions, a grid of 50 x 50 bins, and a smoothing parameter m = 3
## in both dimensions.
compute.p.values(x.range = c(-1,1),y.range = c(-1,1),n.bins = c(50,50),m = c(3,3))

## This plots (on the screen) the 99% confidence regions corresponding to the
## pair of populations 1 and 2, using a 50 x 50 2-dimensions array.
draw.detsel.graphs(i = 1,j = 2,n.bins = c(50,50),alpha = 0.01,pdf = FALSE) 



