library(CB2)


### Name: plot_dotplot
### Title: A function to visualize dot plots for a gene.
### Aliases: plot_dotplot

### ** Examples

library(CB2)
data(Evers_CRISPRn_RT112)
plot_dotplot(get_CPM(Evers_CRISPRn_RT112$count), Evers_CRISPRn_RT112$design, "RPS7")




