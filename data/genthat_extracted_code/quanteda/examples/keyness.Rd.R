library(quanteda)


### Name: keyness
### Title: Compute keyness (internal functions)
### Aliases: keyness keyness_chi2_dt keyness_chi2_stats keyness_exact
###   keyness_lr keyness_pmi
### Keywords: internal textstat

### ** Examples

mydfm <- dfm(c(d1 = "a a a b b c c c c c c d e f g h h",
               d2 = "a a b c c d d d d e f h"))
quanteda:::keyness_chi2_dt(mydfm)
quanteda:::keyness_chi2_stats(mydfm)
quanteda:::keyness_exact(mydfm)
quanteda:::keyness_lr(mydfm)
quanteda:::keyness_pmi(mydfm)



