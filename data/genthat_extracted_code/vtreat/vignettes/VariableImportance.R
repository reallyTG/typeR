## ------------------------------------------------------------------------
set.seed(1999)
d <- data.frame(x = seq(0, 15, by = 0.25))
d$y_ideal <- sin(d$x)
d$x_noise <- d$x[sample.int(nrow(d), nrow(d), replace = FALSE)]
d$y <- d$y_ideal + 0.5*rnorm(nrow(d))
dim(d)

## ------------------------------------------------------------------------
cfe <- vtreat::mkCrossFrameNExperiment(
  d, 
  varlist = c("x", "x_noise"), 
  outcomename = "y")

sf <- cfe$treatments$scoreFrame
knitr::kable(sf[, c("varName", "rsq", "sig")])

## ------------------------------------------------------------------------
vf = vtreat::value_variables_N(
  d, 
  varlist = c("x", "x_noise"),
  outcomename = "y")
rownames(vf) <- NULL

knitr::kable(vf[, c("var", "rsq", "sig")])

