library(alakazam)


### Name: countGenes
### Title: Tabulates V(D)J allele, gene or family usage.
### Aliases: countGenes

### ** Examples

# Without copy numbers
genes <- countGenes(ExampleDb, gene="V_CALL", groups="SAMPLE", mode="family")
genes <- countGenes(ExampleDb, gene="V_CALL", groups="SAMPLE", mode="gene")
genes <- countGenes(ExampleDb, gene="V_CALL", groups="SAMPLE", mode="allele")

# With copy numbers and multiple groups
genes <- countGenes(ExampleDb, gene="V_CALL", groups=c("SAMPLE", "ISOTYPE"), 
                    copy="DUPCOUNT", mode="family")

# Count by clone
genes <- countGenes(ExampleDb, gene="V_CALL", groups=c("SAMPLE", "ISOTYPE"), 
                    clone="CLONE", mode="family")

# Count absent genes 
genes <- countGenes(ExampleDb, gene="V_CALL", groups="SAMPLE", 
                    mode="allele", fill=TRUE)




