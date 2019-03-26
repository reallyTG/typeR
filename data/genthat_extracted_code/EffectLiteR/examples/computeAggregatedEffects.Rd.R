library(EffectLiteR)


### Name: computeAggregatedEffects
### Title: Compute Aggregated Effects
### Aliases: computeAggregatedEffects

### ** Examples

m1 <- effectLite(y="dv", z=c("z1"), k=c("k1"), x="x", 
control="control", data=example01, fixed.cell=TRUE, fixed.z=TRUE)
newdata <- data.frame(k1=NA, z1=1)
agg.subset <- autoSelectSubset(m1, newdata)
computeAggregatedEffects(m1, agg.subset)



