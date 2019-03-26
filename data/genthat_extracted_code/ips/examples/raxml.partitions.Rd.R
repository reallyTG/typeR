library(ips)


### Name: raxml.partitions
### Title: Partition scheme for RAxML
### Aliases: raxml.partitions

### ** Examples

## bark beetle sequences
data(ips.cox1)
data(ips.16S)
data(ips.28S)

## Note the same order of individual
## alignments in both functions:
## ----------------------------
raxml.partitions(cox1 = ips.cox1, 
                 r16S = ips.16S, 
                 r28S = ips.28S)

cbind(ips.cox1, ips.16S, ips.28S,
  fill.with.gaps = TRUE)



