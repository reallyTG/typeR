library(jtools)


### Name: summ.svyglm
### Title: Complex survey regression summaries with options
### Aliases: summ.svyglm j_summ.svyglm

### ** Examples

if (requireNamespace("survey")) {
  library(survey)
  data(api)
  dstrat <- svydesign(id = ~1, strata =~ stype, weights =~ pw,
                      data = apistrat, fpc =~ fpc)
  regmodel <- svyglm(api00 ~ ell * meals, design = dstrat)

  summ(regmodel)
}



