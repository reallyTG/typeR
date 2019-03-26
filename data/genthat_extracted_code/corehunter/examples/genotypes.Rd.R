library(corehunter)


### Name: genotypes
### Title: Create Core Hunter genotype data from data frame, matrix or
###   file.
### Aliases: genotypes

### ** Examples

# create from data frame or matrix

# default format
geno.data <- data.frame(
 NAME = c("Alice", "Bob", "Carol", "Dave", "Eve"),
 M1.1 = c(1,2,1,2,1),
 M1.2 = c(3,2,2,3,1),
 M2.1 = c("B","C","D","B",NA),
 M2.2 = c("B","A","D","B",NA),
 M3.1 = c("a1","a1","a2","a2","a1"),
 M3.2 = c("a1","a2","a2","a1","a1"),
 M4.1 = c(NA,"+","+","+","-"),
 M4.2 = c(NA,"-","+","-","-"),
 row.names = paste("g", 1:5, sep = "-")
)
geno <- genotypes(geno.data, format = "default")

# biparental (e.g. SNP)
geno.data <- matrix(
 sample(c(0,1,2), replace = TRUE, size = 1000),
 nrow = 10, ncol = 100
)
rownames(geno.data) <- paste("g", 1:10, sep = "-")
colnames(geno.data) <- paste("m", 1:100, sep = "-")
geno <- genotypes(geno.data, format = "biparental")

# frequencies
geno.data <- matrix(
 c(0.0, 0.3, 0.7, 0.5, 0.5, 0.0, 1.0,
   0.4, 0.0, 0.6, 0.1, 0.9, 0.0, 1.0,
   0.3, 0.3, 0.4, 1.0, 0.0, 0.6, 0.4),
 byrow = TRUE, nrow = 3, ncol = 7
)
rownames(geno.data) <- paste("g", 1:3, sep = "-")
colnames(geno.data) <- c("M1", "M1", "M1", "M2", "M2", "M3", "M3")
alleles <- c("M1-a", "M1-b", "M1-c", "M2-a", "M2-b", "M3-a", "M3-b")
geno <- genotypes(geno.data, alleles, format = "frequency")

# read from file

# default format
geno.file <- system.file("extdata", "genotypes.csv", package = "corehunter")
geno <- genotypes(file = geno.file, format = "default")

# biparental (e.g. SNP)
geno.file <- system.file("extdata", "genotypes-biparental.csv", package = "corehunter")
geno <- genotypes(file = geno.file, format = "biparental")

# frequencies
geno.file <- system.file("extdata", "genotypes-frequency.csv", package = "corehunter")
geno <- genotypes(file = geno.file, format = "frequency")




