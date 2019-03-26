library(ade4)


### Name: PI2newick
### Title: Import data files from Phylogenetic Independance Package
### Aliases: PI2newick
### Keywords: manip

### ** Examples

x <- c(2.0266, 0.5832, 0.2460, 1.2963, 0.2460, 0.1565, -99.0000,
        -99.0000, 10.1000, -99.0000,  20.2000,  28.2000, -99.0000, 
        14.1000, 11.2000, -99.0000, 21.3000, 27.5000, 1.0000, 2.0000,
        -1.0000, 4.0000, -1.0000, -1.0000, 3.0000, -1.0000, -1.0000,
        5.0000, -1.0000, -1.0000, 0.0000, 0.0000, 0.0000, 0.0000,
        0.0000, 0.0000)
x <- matrix(x, nrow = 6)
x <- as.data.frame(x)
res <- PI2newick(x)
dotchart.phylog(newick2phylog(res$tre), res$trait)



