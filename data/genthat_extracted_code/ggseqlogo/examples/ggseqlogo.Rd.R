library(ggseqlogo)


### Name: ggseqlogo
### Title: Quick sequence logo plot
### Aliases: ggseqlogo

### ** Examples

# Load sample data
data(ggseqlogo_sample)

# Plot a single DNA sequence logo
p1 = ggseqlogo( seqs_dna[[1]] )
print(p1)

# Plot multiple sequence logos at once
p2 = ggseqlogo( seqs_dna )
print(p2)



