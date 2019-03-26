library(scdhlm)


### Name: effect_size_MB
### Title: Calculates HPS effect size
### Aliases: effect_size_MB

### ** Examples

data(Saddler)
with(subset(Saddler, measure=="writing quality"), effect_size_MB(outcome, treatment, case, time))

data(Laski)
with(Laski, effect_size_MB(outcome, treatment, case, time))




