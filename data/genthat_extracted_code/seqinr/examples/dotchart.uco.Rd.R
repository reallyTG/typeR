library(seqinr)


### Name: dotchart.uco
### Title: Cleveland plot for codon usage tables
### Aliases: dotchart.uco
### Keywords: hplot

### ** Examples

# Load dataset:
data(ec999)
# Compute codon usage for all coding sequences:
ec999.uco <- lapply(ec999, uco, index="eff") 
# Put it in a dataframe:
df <- as.data.frame(lapply(ec999.uco, as.vector)) 
# Add codon names:
row.names(df) <- names(ec999.uco[[1]])
# Compute global codon usage:
global <- rowSums(df)
# Choose a title for the graph:
title <- "Codon usage in 999 E. coli coding sequences"
# Plot data:
dotchart.uco(global, main = title) 



