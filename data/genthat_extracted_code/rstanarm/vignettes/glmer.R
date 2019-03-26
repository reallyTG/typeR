params <-
list(EVAL = FALSE)

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require(knitr))
opts_chunk$set(
  comment=NA, 
  message = FALSE, 
  warning = FALSE, 
  eval = params$EVAL,
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
)

## ---- results = "hide"---------------------------------------------------
#  library(rstanarm)
#  data(roaches)
#  roaches$roach1 <- roaches$roach1 / 100
#  roaches$log_exposure2 <- log(roaches$exposure2)
#  post <- stan_gamm4(
#    y ~ s(roach1) + treatment + log_exposure2,
#    random = ~(1 | senior),
#    data = roaches,
#    family = neg_binomial_2,
#    QR = TRUE,
#    chains = CHAINS,
#    cores = CORES,
#    seed = SEED
#  )

## ------------------------------------------------------------------------
#  plot_nonlinear(post)

## ------------------------------------------------------------------------
#  data("Orange", package = "datasets")
#  Orange$age <- Orange$age / 100
#  Orange$circumference <- Orange$circumference / 100

## ---- warning=TRUE-------------------------------------------------------
#  startvec <- c(Asym = 2, xmid = 7.25, scal = 3.5)
#  library(lme4)
#  nm1 <- nlmer(circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
#               data = Orange, start = startvec)
#  summary(nm1)

## ---- echo = FALSE-------------------------------------------------------
#  grep("^SS[[:lower:]]+", ls("package:stats"), value = TRUE)

## ---- results = "hide"---------------------------------------------------
#  post1 <- stan_nlmer(circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree,
#                      data = Orange, chains = CHAINS, cores = CORES, seed = SEED,
#                      init_r = 0.5)

## ------------------------------------------------------------------------
#  post1

## ------------------------------------------------------------------------
#  plot(post1, regex_pars = "^[b]")

## ------------------------------------------------------------------------
#  nd <- data.frame(age = 1:20, Tree = factor("6", levels = 1:6))
#  PPD <- posterior_predict(post1, newdata = nd)
#  PPD_df <- data.frame(age = as.factor(rep(1:20, each = nrow(PPD))),
#                       circumference = c(PPD))
#  ggplot(PPD_df, aes(age, circumference)) + geom_boxplot()

## ---- eval = FALSE-------------------------------------------------------
#  post3 <- stan_nlmer(conc ~ SSfol(Dose, Time, lKe, lKa, lCl) ~
#                      (0 + lKe + lKa + lCl | Subject), data = Theoph,
#                      chains = CHAINS, cores = CORES, seed = SEED,
#                      QR = TRUE, init_r = 0.25, adapt_delta = 0.999)
#  pairs(post3, regex_pars = "^l")
#  pairs(post3, regex_pars = "igma")

