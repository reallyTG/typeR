library(RichR)


### Name: Enrichment
### Title: Enrichment
### Aliases: Enrichment

### ** Examples

data('g2d')

g2d_clean = g2d$clean

# The user can choose a particular disorder, or use the whole disease set to compare to

g2d_ASD = subset(g2d_clean, g2d_clean$Disease %in% c('AUTISM'))
Enrichment(Background = g2d_clean$Gene.symbol,
Genes2Dis = g2d_ASD,
Genes = g2d_ASD$Gene.symbol[1:100])






