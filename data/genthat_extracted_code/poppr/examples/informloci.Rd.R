library(poppr)


### Name: informloci
### Title: Remove all non-phylogentically informative loci
### Aliases: informloci

### ** Examples

# We will use a dummy data set to demonstrate how this detects uninformative
# loci using both MAF and a cutoff.

genos <- c("A/A", "A/B", "A/C", "B/B", "B/C", "C/C")

v <- sample(genos, 100, replace = TRUE)
w <- c(rep(genos[2], 99), genos[3])           # found by cutoff
x <- c(rep(genos[1], 98), genos[3], genos[2]) # found by MAF
y <- c(rep(genos[1], 99), genos[2])           # found by both
z <- sample(genos, 100, replace = TRUE)
dat <- df2genind(data.frame(v = v, w = w, x = x, y = y, z = z), sep = "/")

informloci(dat)

## Not run: 
##D # Ignore MAF
##D informloci(dat, MAF = 0)
##D 
##D # Ignore cutoff
##D informloci(dat, cutoff = 0)
##D 
##D # Real data
##D data(H3N2)
##D informloci(H3N2)
##D 
## End(Not run)



