library(BioPET)


### Name: enrichment_simulation
### Title: Prognostic Enrichment with Simulated Data
### Aliases: enrichment_simulation

### ** Examples

## three biomarkers with symmetric ROC curves
simulation.three.markers <- enrichment_simulation(baseline.event.rate=0.2,
reduction.under.treatment=0.3,
estimated.auc=c(0.72, 0.82, 0.85),
roc.type=c("symmetric", "symmetric", "symmetric"),
cost.screening=1,
cost.keeping=10,
simulation.sample.size=1e+5)
head(simulation.three.markers$estimates)




