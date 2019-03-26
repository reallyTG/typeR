library(gglogo)


### Name: logo
### Title: Logo plot
### Aliases: logo

### ** Examples

data(sequences)
library(ggplot2)
library(RColorBrewer)
cols <- rep(brewer.pal(12, name="Paired"),22)
logo(sequences$peptide) + aes(fill=element) + scale_fill_manual(values=cols)



