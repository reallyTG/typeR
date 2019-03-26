library(ape)


### Name: CADM.global
### Title: Congruence among distance matrices
### Aliases: CADM CADM.global CADM.post
### Keywords: multivariate nonparametric

### ** Examples

# Examples 1 and 2: 5 genetic distance matrices computed from simulated DNA
# sequences representing 50 taxa having evolved along additive trees with
# identical evolutionary parameters (GTR+ Gamma + I). Distance matrices were
# computed from the DNA sequence matrices using a p distance corrected with the
# same parameters as those used to simulate the DNA sequences. See Campbell et
# al. (2009) for details.

# Example 1: five independent additive trees. Data provided by V. Campbell.

data(mat5Mrand)
res.global <- CADM.global(mat5Mrand, 5, 50)

# Example 2: three partly similar trees, two independent trees.
# Data provided by V. Campbell.

data(mat5M3ID)
res.global <- CADM.global(mat5M3ID, 5, 50)
res.post   <- CADM.post(mat5M3ID, 5, 50, mantel=TRUE)

# Example 3: three matrices respectively representing Serological
# (asymmetric), DNA hybridization (asymmetric) and Anatomical (symmetric)
# distances among 9 families. Data from Lapointe et al. (1999).

data(mat3)
res.global <- CADM.global(mat3, 3, 9, nperm=999)
res.post   <- CADM.post(mat3, 3, 9, nperm=999, mantel=TRUE)

# Example 4, showing how to bind two D matrices (cophenetic matrices
# in this example) into a file using rbind(), then run the global test.

a <- rtree(5)
b <- rtree(5)
A <- cophenetic(a)
B <- cophenetic(b)
x <- rownames(A)
B <- B[x, x]
M <- rbind(A, B)
CADM.global(M, 2, 5)



