library(EffectLiteR)


### Name: autoSelectSubset
### Title: Autoselect Subset for Aggregated Effects
### Aliases: autoSelectSubset

### ** Examples

m1 <- effectLite(y="dv", z=c("z1"), k=c("k1"), x="x", 
control="control", data=example01, fixed.cell=TRUE, fixed.z=TRUE)
newdata <- data.frame(k1=NA, z1=1)
agg.subset <- autoSelectSubset(m1, newdata)



