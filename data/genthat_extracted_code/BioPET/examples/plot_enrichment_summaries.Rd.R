library(BioPET)


### Name: plot_enrichment_summaries
### Title: Plotting Prognostic Enrichment Estimates
### Aliases: plot_enrichment_summaries

### ** Examples


data(dcaData)
# one marker
analysis.single.marker <- enrichment_analysis(Cancer ~ Marker1,
data=dcaData,
reduction.under.treatment=0.3,
cost.screening=100, cost.keeping=1000)
plot_enrichment_summaries(analysis.single.marker)

# two markers
analysis.two.markers <- enrichment_analysis(Cancer ~ Marker1 + Marker2,
data=dcaData,
reduction.under.treatment=0.3,
cost.screening=100,
cost.keeping=1000)
plot_enrichment_summaries(analysis.two.markers)



