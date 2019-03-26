library(EcoGenetics)


### Name: aue.sort
### Title: Ordering the content of cells in a matrix. Ordering alleles in a
###   genetic matrix.
### Aliases: aue.sort

### ** Examples


## Not run: 
##D 
##D # Example 1----------------------
##D 
##D geno <- c(12, 52, 62, 45, 54, 21)
##D geno <- matrix(geno, 3, 2)
##D 
##D # ordering the data
##D aue.sort(geno, ploidy = 2)
##D 
##D # decreasing sort order
##D aue.sort(geno, ploidy = 2, decreasing = TRUE)
##D 
##D 
##D # Example 2----------------------
##D 
##D geno2 <- c(123456, 524556, 629359, 459459, 543950, 219405)
##D geno2 <- matrix(geno2, 3, 2)
##D 
##D # ordering the data as diploid
##D aue.sort(geno2, ploidy = 2)  # the data is ordered using blocks of 3 characters
##D 
##D # ordering the data as triploid
##D aue.sort(geno2, ploidy = 3)  # the data is ordered using blocks of 2 characters
##D 
##D # error: the ploidy and the number of characters are not congruent
##D aue.sort(geno2, ploidy = 5) 
##D 
##D # error: the ploidy and the number of characters are not congruent
##D aue.sort(geno2, ploidy = 5)
##D 
##D 
##D # Example 3----------------------
##D 
##D # any character data
##D generic <- c("aldk", "kdbf", "ndnd", "ndkd")
##D generic <- matrix(generic, 2, 2)
##D aue.sort(generic, ploidy = 2) 
##D aue.sort(generic, ploidy = 4)
##D 
## End(Not run)




