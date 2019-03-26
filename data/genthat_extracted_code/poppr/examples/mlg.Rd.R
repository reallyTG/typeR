library(poppr)


### Name: mlg
### Title: Create counts, vectors, and matrices of multilocus genotypes.
### Aliases: mlg mlg.table mlg.vector mlg.crosspop mlg.id

### ** Examples


# Load the data set
data(Aeut)

# Investigate the number of multilocus genotypes.
amlg <- mlg(Aeut)
amlg # 119

# show the multilocus genotype vector 
avec <- mlg.vector(Aeut)
avec 

# Get a table
atab <- mlg.table(Aeut, color = TRUE)
atab

# See where multilocus genotypes cross populations
acrs <- mlg.crosspop(Aeut) # MLG.59: (2 inds) Athena Mt. Vernon

# See which individuals belong to each MLG
aid <- mlg.id(Aeut)
aid["59"] # individuals 159 and 57

## Not run: 
##D 
##D # For the mlg.table, you can also choose to display the number of MLGs across
##D # populations in the background
##D 
##D mlg.table(Aeut, background = TRUE)
##D mlg.table(Aeut, background = TRUE, color = TRUE)
##D 
##D # A simple example. 10 individuals, 5 genotypes.
##D mat1 <- matrix(ncol=5, 25:1)
##D mat1 <- rbind(mat1, mat1)
##D mat <- matrix(nrow=10, ncol=5, paste(mat1,mat1,sep="/"))
##D mat.gid <- df2genind(mat, sep="/")
##D mlg(mat.gid)
##D mlg.vector(mat.gid)
##D mlg.table(mat.gid)
##D 
##D # Now for a more complicated example.
##D # Data set of 1903 samples of the H3N2 flu virus genotyped at 125 SNP loci.
##D data(H3N2)
##D mlg(H3N2, quiet = FALSE)
##D 
##D H.vec <- mlg.vector(H3N2)
##D 
##D # Changing the population vector to indicate the years of each epidemic.
##D pop(H3N2) <- other(H3N2)$x$country
##D H.tab <- mlg.table(H3N2, plot = FALSE, total = TRUE)
##D 
##D # Show which genotypes exist accross populations in the entire dataset.
##D res <- mlg.crosspop(H3N2, quiet = FALSE)
##D 
##D # Let's say we want to visualize the multilocus genotype distribution for the
##D # USA and Russia
##D mlg.table(H3N2, sublist = c("USA", "Russia"), bar=TRUE)
##D 
##D # An exercise in subsetting the output of mlg.table and mlg.vector.
##D # First, get the indices of each MLG duplicated across populations.
##D inds <- mlg.crosspop(H3N2, quiet = FALSE, indexreturn = TRUE)
##D 
##D # Since the columns of the table from mlg.table are equal to the number of
##D # MLGs, we can subset with just the columns.
##D H.sub <- H.tab[, inds]
##D 
##D # We can also do the same by using the mlgsub flag.
##D H.sub <- mlg.table(H3N2, mlgsub = inds)
##D 
##D # We can subset the original data set using the output of mlg.vector to
##D # analyze only the MLGs that are duplicated across populations. 
##D new.H <- H3N2[H.vec %in% inds, ]
##D 
## End(Not run)



