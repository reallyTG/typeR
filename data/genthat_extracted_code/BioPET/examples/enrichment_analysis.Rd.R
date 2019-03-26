library(BioPET)


### Name: enrichment_analysis
### Title: Prognostic Enrichment with Real Data
### Aliases: enrichment_analysis

### ** Examples

data(dcaData)

## using a single biomarker in the dataset
analysis.single.marker <- enrichment_analysis(Cancer ~ Marker1,
data=dcaData,
reduction.under.treatment=0.3,
cost.screening=100,
cost.keeping=1000)
head(analysis.single.marker$estimates)
head(analysis.single.marker$bootstrap.CIs)

## combining two biomarkers in the dataset
analysis.two.markers <- enrichment_analysis(Cancer ~ Marker1 + Marker2,
data=dcaData,
reduction.under.treatment=0.3,
cost.screening=100,
cost.keeping=1000)
head(analysis.two.markers$estimates)
head(analysis.two.markers$bootstrap.CIs)



