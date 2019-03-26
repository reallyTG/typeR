library(poppr)


### Name: fix_replen
### Title: Find and fix inconsistent repeat lengths
### Aliases: fix_replen

### ** Examples


data(Pram)
(Pram_replen <- setNames(c(3, 2, 4, 4, 4), locNames(Pram)))
fix_replen(Pram, Pram_replen)
# Let's start with an example of a tetranucleotide repeat motif and imagine
# that there are twenty alleles all 1 step apart:
(x <- 1:20L * 4L)
# These are the true lengths of the different alleles. Now, let's add the
# primer sequence to them. 
(PxP <- x + 21 + 21)
# Now we make sure that x / 4 is equal to 1:20, which we know each have
# 1 difference.
x/4
# Now, we divide the sequence with the primers by 4 and see what happens.
(PxPc <- PxP/4)
(PxPcr <- round(PxPc))
diff(PxPcr) # we expect all 1s

# Let's try that again by subtracting a tiny amount from 4
(PxPc <- PxP/(4 - 1e-5))
(PxPcr <- round(PxPc))
diff(PxPcr)



