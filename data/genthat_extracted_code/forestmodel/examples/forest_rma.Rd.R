library(forestmodel)


### Name: forest_rma
### Title: Generate a forest plot from a meta-analysis
### Aliases: forest_rma

### ** Examples

if (require("metafor")) {
  data("dat.bcg")
  dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
  model <- rma(yi, vi, data = dat)

  print(forest_rma(model, study_labels = paste(dat.bcg$author, dat.bcg$year),
    trans = exp))

  print(forest_rma(model, panels = forest_panels(Study = ~study,
    N = ~n, ~vline, `Log Relative Risk` = ~forest(line_x = 0),
    ~spacer(space = 0.10),
    ~sprintf("%0.3f (%0.3f, %0.3f)", estimate, conf.low, conf.high)),
    study_labels = paste(dat.bcg$author, dat.bcg$year),
    trans = exp))

}



