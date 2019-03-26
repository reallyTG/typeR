library(phyclust)


### Name: gen.seq
### Title: Generate Sequences Given a Rooted Tree.
### Aliases: gen.seq.HKY gen.seq.SNP
### Keywords: simulation

### ** Examples

library(phyclust, quiet = TRUE)

# Generate a tree
set.seed(1234)
ret.ms <- ms(nsam = 5, nreps = 1, opts = "-T")
tree.ms <- read.tree(text = ret.ms[3])

# Generate nucleotide sequences
anc.HKY <- rep(0:3, 3)
pi.HKY <- c(0.2, 0.2, 0.3, 0.3)
kappa <- 1.1
L <- length(anc.HKY)
set.seed(1234)
paste(nid2code(anc.HKY, lower.case = FALSE), collapse = "")
(HKY.1 <- gen.seq.HKY(tree.ms, pi.HKY, kappa, L, anc.seq = anc.HKY))

# evolve 5 times longer
(HKY.2 <- gen.seq.HKY(tree.ms, pi.HKY, kappa, L,
                      rate.scale = 5, anc.seq = anc.HKY))

# Generate SNP sequences
anc.SNP <- rep(0:1, 6)
pi.SNP <- c(0.4, 0.6)
L <- length(anc.SNP)
set.seed(1234)
paste(sid2snp(anc.SNP), collapse = "")
(SNP.1 <- gen.seq.SNP(tree.ms, pi.SNP, L, anc.seq = anc.SNP))

# evolve 5 times longer
(SNP.2 <- gen.seq.SNP(tree.ms, pi.SNP, L, rate.scale = 5,
                      anc.seq = anc.SNP))



