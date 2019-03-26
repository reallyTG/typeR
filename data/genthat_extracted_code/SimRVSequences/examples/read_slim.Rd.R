library(SimRVSequences)


### Name: read_slim
### Title: Import SLiM data to R
### Aliases: read_slim

### ** Examples

# Specify the URL of the example output data simulated by SLiM.
file_url <-
'https://raw.githubusercontent.com/cnieuwoudt/Example--SLiMSim/master/example_SLIMout.txt'
s_out <- read_slim(file_url)

summary(s_out)


# As seen above, read_slim returns two items.  The first is a sparse matrix
# named Haplotypes, which contains the haplotypes for each indiviual in the
# simulation.  The second item is a data set named Mutations, which catalogs
# the mutations in the Haplotypes matrix.

# View the first 5 lines of the mutation data
head(s_out$Mutations, n = 5)

# view the first 20 mutations on the first 10 haplotypes
s_out$Haplotypes[1:10, 1:20]



