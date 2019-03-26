library(ggstatsplot)


### Name: bf_extractor
### Title: Convenience function to extract bayes factors from 'BayesFactor'
###   model object.
### Aliases: bf_extractor

### ** Examples

# getting only bayes factors
ggstatsplot::bf_extractor(
  BayesFactor::anovaBF(Sepal.Length ~ Species,
    data = iris,
    progress = FALSE
  )
)



