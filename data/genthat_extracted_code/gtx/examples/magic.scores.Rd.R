library(gtx)


### Name: magic.scores
### Title: Genetic risk scores for glucose/insulin traits.
### Aliases: magic.scores
### Keywords: datasets

### ** Examples

data(magic.scores)
with(subset(magic.scores, score = "FG2010"),
  grs.plot(beta_FG, beta_TG, se_TG, text = locus))



