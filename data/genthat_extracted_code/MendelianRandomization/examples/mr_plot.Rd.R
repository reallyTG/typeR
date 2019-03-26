library(MendelianRandomization)


### Name: mr_plot
### Title: Draw a scatter plot of the genetic associations and/or causal
###   estimates
### Aliases: mr_plot mr_plot,MRInput-method mr_plot,MRAll-method

### ** Examples

mr_plot(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  line="egger", orientate = TRUE)
mr_plot(mr_input(bx = ldlc, bxse = ldlcse, by = chdlodds, byse = chdloddsse),
  line="ivw", interactive=FALSE) # produces a static graph
mr_plot(mr_allmethods(mr_input(bx = ldlc, bxse = ldlcse,
   by = chdlodds, byse = chdloddsse), method="all", iterations = 50))
  # iterations is set to 50 to reduce runtime for the mr_median method,
  # 10000 iterations are recommended in practice




