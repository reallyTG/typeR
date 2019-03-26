## ---- echo = FALSE-------------------------------------------------------
library(MLZ); data(Goosefish)

## ---- eval = FALSE-------------------------------------------------------
#  library(MLZ)
#  class?MLZ_data
#  data(Goosefish)
#  Goosefish@vbLinf

## ---- message = FALSE----------------------------------------------------
data(SilkSnapper)
new.dataset <- new("MLZ_data", Year = 1983:2013, Len_df = SilkSnapper, length.units = "mm")

## ---- eval = FALSE, message = FALSE--------------------------------------
#  bin_length(SilkSnapper)

## ---- fig.height = 5, fig.width = 6, message = FALSE---------------------
plot(new.dataset)

## ---- message = FALSE, echo = FALSE--------------------------------------
new.dataset@Lc <- 310
new.dataset <- calc_ML(new.dataset)

## ---- eval = FALSE-------------------------------------------------------
#  new.dataset@Lc <- 310
#  new.dataset <- calc_ML(new.dataset)
#  
#  new.dataset@MeanLength
#  new.dataset@ss

## ---- eval = FALSE-------------------------------------------------------
#  summary(new.dataset)

## ---- eval = FALSE-------------------------------------------------------
#  est <- ML(Goosefish, ncp = 2)

## ---- echo = FALSE-------------------------------------------------------
est <- ML(Goosefish, ncp = 2, figure = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  plot(est)

## ---- echo = FALSE, fig.width = 5----------------------------------------
par(mar = c(4, 4, 0.5, 0.5))
plot(est, residuals = FALSE)

## ------------------------------------------------------------------------
summary(est)

## ---- eval = FALSE-------------------------------------------------------
#  model1 <- ML(Goosefish, ncp = 0)
#  model2 <- ML(Goosefish, ncp = 1)
#  model3 <- ML(Goosefish, ncp = 2)

## ---- echo = FALSE-------------------------------------------------------
model1 <- ML(Goosefish, ncp = 0, figure = FALSE)
model2 <- ML(Goosefish, ncp = 1, figure = FALSE)
model3 <- ML(Goosefish, ncp = 2, figure = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  compare_models(list(model1, model2, model3))

## ---- fig.width = 5, echo = FALSE----------------------------------------
par(mar = c(2,4,1,1))
compare_models(list(model1, model2, model3))

## ---- eval = FALSE-------------------------------------------------------
#  modal_length(new.dataset, breaks = seq(80, 830, 10))

## ---- message = FALSE, echo = FALSE, fig.width = 5-----------------------
par(mar = c(4,4,1,1))
new.dataset2 <- new.dataset
new.dataset2@Lc <- numeric(0)
z = modal_length(new.dataset2, breaks = seq(80, 830, 10))

## ---- echo = FALSE, fig.width = 4.5--------------------------------------
par(mar = c(4, 4, 0.5, 0.5))
zz <- profile_ML(Goosefish, ncp = 1)

## ---- echo = FALSE, fig.height = 4, fig.width = 5------------------------
par(mar = c(4, 4, 1.5, 0.5))
zz <- profile_ML(Goosefish, ncp = 2, color = FALSE)

## ---- echo = FALSE-------------------------------------------------------
data(MuttonSnapper)

## ------------------------------------------------------------------------
data(PRSnapper)
typeof(PRSnapper)

## ---- eval = FALSE-------------------------------------------------------
#  MLmulti(PRSnapper, ncp = 1, model = "MSM1")

## ---- eval = FALSE-------------------------------------------------------
#  res <- MLmulti(PRSnapper, ncp = 1, model = "MSM1")
#  names(res@opt$par)

## ---- eval = FALSE-------------------------------------------------------
#  data(Nephrops)
#  Nephrops@Effort
#  Nephrops@vbt0 <- 0
#  MLeffort(Nephrops, start = list(q = 0.1, M = 0.2), n_age = 24)

## ---- echo = FALSE-------------------------------------------------------
data(Nephrops)

## ---- eval = FALSE-------------------------------------------------------
#  MLeffort(Nephrops, start = list(q = 0.1, M = 0.3), n_age = 24, n_season = 1, obs_season = 1, timing = 0.5)

## ---- eval = FALSE-------------------------------------------------------
#  Nephrops@M <- 0.3
#  MLeffort(Nephrops, start = list(q = 0.1), n_age = 24, estimate.M = FALSE)

