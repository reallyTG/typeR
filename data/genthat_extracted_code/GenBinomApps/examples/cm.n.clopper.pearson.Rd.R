library(GenBinomApps)


### Name: cm.n.clopper.pearson
### Title: Required Sample Size - Countermeasure Model
### Aliases: cm.n.clopper.pearson

### ** Examples

## target failure probability p=0.00001, 2 failures divided in 2 failure types k1=1, k2=1.
## 2 countermeasures with effectivities p1=0.5, p2=0.8
cm.n.clopper.pearson(0.00001,size=c(1,1),cm.effect=c(0.5,0.8))
# 365299



