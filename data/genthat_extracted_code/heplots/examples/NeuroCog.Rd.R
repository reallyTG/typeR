library(heplots)


### Name: NeuroCog
### Title: Neurocognitive Measures in Psychiatric Groups
### Aliases: NeuroCog
### Keywords: datasets

### ** Examples

data(NeuroCog)
NC.mlm <- lm(cbind( Speed, Attention, Memory, Verbal, Visual, ProbSolv) ~ Dx,
               data=NeuroCog)
Anova(NC.mlm)

# test contrasts
contrasts(NeuroCog$Dx)
print(linearHypothesis(NC.mlm, "Dx1"), SSP=FALSE)
print(linearHypothesis(NC.mlm, "Dx2"), SSP=FALSE)

# pairwise HE plots
pairs(NC.mlm, var.cex=1.5)

# canonical discriminant analysis
if (require(candisc)) {
  NC.can <- candisc(NC.mlm)
  NC.can
  
  plot(NC.can, ellipse=TRUE, rev.axes=c(TRUE,FALSE), pch=c(7,9,10))
}




