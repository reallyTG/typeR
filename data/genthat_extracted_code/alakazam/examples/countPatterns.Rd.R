library(alakazam)


### Name: countPatterns
### Title: Count sequence patterns
### Aliases: countPatterns

### ** Examples

seq <- c("TGTCAACAGGCTAACAGTTTCCGGACGTTC",
         "TGTCAGCAATATTATATTGCTCCCTTCACTTTC",
         "TGTCAAAAGTATAACAGTGCCCCCTGGACGTTC")
patterns <- c("A", "V", "[LI]")
names(patterns) <- c("ARG", "VAL", "ISO_LEU")
countPatterns(seq, patterns, nt=TRUE, trim=TRUE, label="CDR3")
            



