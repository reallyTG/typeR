## ------------------------------------------------------------------------
library("episheet")

## ---- message = F, fig.width = 6-----------------------------------------
episheet::pvalueplot(
  est1.ll = 0.7,
  est1.ul = 1.1,
  xlabel = "Odds ratio"
)

## ---- fig.width = 6------------------------------------------------------
episheet::pvalueplot(
  est1.ll = 0.8,
  est1.ul = 3.8,
  est2.ll = 1.2,
  est2.ul = 2,
  label1 = "Estimate 1",
  label2 = "Estimate 2",
  xlabel = "Relative Risk"
)

