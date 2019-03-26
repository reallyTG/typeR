library(gaston)


### Name: set.stats
### Title: Basic statistics for a 'bed.matrix'
### Aliases: set.stats set.stats.ped set.stats.snps
### Keywords: Genetic Statistics

### ** Examples

# Disable auto set stats :
options(gaston.auto.set.stats = FALSE)

# Load data
data(TTN)
x <- as.bed.matrix(TTN.gen, TTN.fam, TTN.bim)
str(x@ped)
str(x@snps)

# Compute statistics
x <- set.stats(x)
str(x@ped)
str(x@snps)

# restore default behavior
options(gaston.auto.set.stats = TRUE)



