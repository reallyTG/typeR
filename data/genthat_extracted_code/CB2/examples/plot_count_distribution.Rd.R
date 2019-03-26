library(CB2)


### Name: plot_count_distribution
### Title: A function to plot read count distribution.
### Aliases: plot_count_distribution

### ** Examples

library(CB2)
data(Evers_CRISPRn_RT112)
cpm <- get_CPM(Evers_CRISPRn_RT112$count)
plot_count_distribution(cpm, Evers_CRISPRn_RT112$design)




