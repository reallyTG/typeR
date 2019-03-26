library(MonoPhy)


### Name: PlotMonophyly
### Title: Plot output of AssessMonophyly
### Aliases: PlotMonophyly

### ** Examples

data(Ericactree)
solution <- AssessMonophyly(Ericactree)

PlotMonophyly(solution=solution, tree=Ericactree, plot.type='monophyly', ladderize=TRUE,
mono.colour='PRGn')
PlotMonophyly(solution=solution, tree=Ericactree, plot.type='taxonomy', ladderize=TRUE)

# especially for larger phylogenies it is recommended to print the plot to a pdf file instead of
#plotting, for easier inspection
PlotMonophyly(solution=solution, tree=Ericactree, plot.type='monoVStax', ladderize=TRUE,
PDF=TRUE, mono.colour='PRGn', PDF_filename='MonoTaxplot.pdf')
PlotMonophyly(solution=solution, tree=Ericactree, plot.type='taxonomy', ladderize=TRUE,
PDF=TRUE, PDF_filename='Taxplot.pdf')



