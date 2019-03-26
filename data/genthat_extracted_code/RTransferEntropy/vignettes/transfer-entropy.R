## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 4
)

options(future.globals.maxSize = Inf)
library(ggplot2)
theme_set(theme_light())
plot_series <- function(x, y) {
  
  p1 <- ggplot(data.frame(x = c(NA, x[1:(length(x) - 1)]), y = y), aes(x, y)) +
    geom_smooth() +
    geom_point(alpha = 0.5, size = 0.5) +
    labs(x = expression(X[t - 1]), y = expression(Y[t])) +
    coord_fixed(1) +
    scale_x_continuous(limits = range(x)) +
    scale_y_continuous(limits = range(y))
  
  p2 <- ggplot(data.frame(x = x, y = y), aes(x, y)) +
    geom_smooth() +
    geom_point(alpha = 0.5, size = 0.5) +
    labs(x = expression(X[t]), y = expression(Y[t])) +
    coord_fixed(1) +
    scale_x_continuous(limits = range(x)) +
    scale_y_continuous(limits = range(y))
  
  p3 <- ggplot(data.frame(x = x, y = c(NA, y[1:(length(y) - 1)])), aes(x, y)) +
    geom_smooth() +
    geom_point(alpha = 0.5, size = 0.5) +
    labs(x = expression(X[t]), y = expression(Y[t - 1])) +
    coord_fixed(1) +
    scale_x_continuous(limits = range(x)) +
    scale_y_continuous(limits = range(y))
  
  p <- gridExtra::grid.arrange(p1, p2, p3, ncol = 3)
  return(invisible(p))
}

## ----load_packages, echo=F-----------------------------------------------
library(RTransferEntropy)

## ---- eval=F-------------------------------------------------------------
#  # Install from CRAN
#  install.packages('RTransferEntropy')
#  # Install development version from GitHub
#  # devtools::install_github("BZPaper/RTransferEntropy")
#  
#  # load the package
#  library(RTransferEntropy)

## ---- eval=F-------------------------------------------------------------
#  transfer_entropy(x, y,
#                   lx = 1, ly = 1, q = 0.1,
#                   entropy = c('Shannon', 'Renyi'), shuffles = 100,
#                   type = c('quantiles', 'bins', 'limits'),
#                   quantiles = c(5, 95), bins = NULL, limits = NULL,
#                   nboot = 300, burn = 50, quiet = FALSE, seed = NULL)

## ----gen_data1-----------------------------------------------------------
set.seed(12345)
n <- 2500
x <- rep(0, n + 1)
y <- rep(0, n + 1)

for (i in 2:(n + 1)) {
  x[i] <- 0.2 * x[i - 1] + rnorm(1, 0, 2)
  y[i] <- x[i - 1] + rnorm(1, 0, 2)
}

x <- x[-1]
y <- y[-1]

## ----plot_data_1, echo=F, message=FALSE, warning=FALSE-------------------
plot_series(x, y)

## ----te_1----------------------------------------------------------------
library(future)
# enable parallel processing for all future transfer_entropy calls
plan(multiprocess)
set.seed(12345)
shannon_te <- transfer_entropy(x, y)

## ----show_result_1, eval=T-----------------------------------------------
shannon_te

## ----smaller_functions---------------------------------------------------
# X->Y
calc_te(x, y)
calc_ete(x, y)

# and Y->X
calc_te(y, x)
calc_ete(y, x)

## ----gen_data_2, eval=T--------------------------------------------------
set.seed(12345)
n <- 2500
x <- rep(0, n + 200)
y <- rep(0, n + 200)

x[1] <- rnorm(1, 0, 1)
y[1] <- rnorm(1, 0, 1)

for (i in 2:(n + 200)) {
  x[i] <- 0.2 * x[i - 1] + rnorm(1, 0, 1)
  y[i] <- sqrt(abs(x[i - 1])) + rnorm(1, 0, 1)
}

x <- x[-(1:200)]
y <- y[-(1:200)]

## ----plot_data_2, echo=F, message=FALSE, warning=FALSE-------------------
plot_series(x, y)

## ----te_2, eval=T--------------------------------------------------------
shannon_te2 <- transfer_entropy(x, y)

shannon_te2

## ----var_comparison, message=FALSE, warning=FALSE------------------------
library(vars)
varfit <- VAR(cbind(x, y), p = 1, type = "const")
svf <- summary(varfit)

svf$varresult$y

## ----te_2a, eval=T-------------------------------------------------------
df <- data.frame(q1 = 5:25, q2 = 95:75)

df$ete <- apply(
  df, 1,
  function(el) calc_ete(x, y, quantiles = c(el[["q1"]], el[["q2"]]))
)

df$quantiles <- factor(sprintf("(%02.f, %02.f)", df$q1, df$q2))

ggplot(df, aes(x = quantiles, y = ete)) + 
  geom_point() +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(x = "Quantiles", y = "ETE (X->Y)")

## ----gen_data_3, eval=T--------------------------------------------------
set.seed(12345)

x <- rep(0, n + 200)
y <- rep(0, n + 200)

x[1] <- rnorm(1, 0, 1)
y[1] <- rnorm(1, 0, 1)

for (i in 2:(n + 200)) {
  x[i] <- 0.2 * x[i - 1] + rnorm(1, 0, 1)
  y[i] <- ifelse(
    abs(x[i - 1]) > 1.65,
    x[i - 1]  + rnorm(1, 0, 1),
    0.2 * x[i - 1] + rnorm(1, 0, 1)
  )
}

x <- x[-(1:200)]
y <- y[-(1:200)]

## ----plot_data_3, echo=F, message=FALSE, warning=FALSE-------------------
plot_series(x, y)

## ----te_renyi_3----------------------------------------------------------
set.seed(12345)
renyi_te <- transfer_entropy(x, y, entropy = "Renyi", q = 0.3)

renyi_te

## ----q_test--------------------------------------------------------------
qs <- c(seq(0.1, 0.9, 0.1), 0.99)

te <- sapply(qs, function(q) calc_te(x, y, entropy = "renyi", q = q))
names(te) <- sprintf("q = %.2f", qs)

te_shannon <- calc_te(x, y)
te_shannon

## ----plot_q_test, message=FALSE, warning=FALSE---------------------------
round(te, 4)

text_df <- data.frame(x = 0.25, 
                      y = te_shannon, 
                      lab = sprintf("Shannon's TE = %.4f", te_shannon))

ggplot(data.frame(x = qs, y = te), aes(x = x, y = y)) +
  geom_hline(yintercept = te_shannon, color = "red", linetype = "dashed") +
  geom_smooth(se = F, color = "black", size = 0.5) +
  theme_light() +
  labs(x = "Values for q", y = "Renyi's Transfer Entropy",
       title = "Renyi's Transfer Entropy for different Values of q") +
  geom_text(data = text_df,
            aes(label = lab), color = "red", nudge_y = 0.01)


## ----load_data, message=FALSE, warning=FALSE-----------------------------
library(data.table) # for data manipulation

res <- lapply(split(stocks, stocks$ticker), function(d) {
  te <- transfer_entropy(d$ret, d$sp500, shuffles = 50, nboot = 100, quiet = T)
  
  data.table(
    ticker = d$ticker[1],
    dir = c("X->Y", "Y->X"),
    coef(te)[1:2, 2:3]
  )
})

df <- rbindlist(res)

# order the ticker by the ete of X->Y
df[, ticker := factor(ticker, 
                      levels = unique(df$ticker)[order(df[dir == "X->Y"]$ete)])]

# rename the variable (xy/yx)
df[, dir := factor(dir, levels = c("X->Y", "Y->X"),
                   labels = c("Flow towards Market",
                              "Flow towards Stock"))]

ggplot(df, aes(x = ticker, y = ete)) + 
  facet_wrap(~dir) +
  geom_hline(yintercept = 0, color = "gray") +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(x = NULL, y = "Effective Transfer Entropy") +
  geom_errorbar(aes(ymin = ete - qnorm(0.95) * se,  
                    ymax = ete + qnorm(0.95) * se),  
                width = 0.25, col = "blue") +
  geom_point()

## ----density_plot_1------------------------------------------------------
# calculate the same ete with different quantiles
df2 <- stocks[, .(ete_xy = calc_ete(ret, sp500, quantiles = c(10, 90)),
                  ete_yx = calc_ete(sp500, ret, quantiles = c(10, 90))), 
              by = ticker]

# combine the quantiles into a single dt

df1 <- dcast(df[, .(dir, ticker, ete)], ticker ~ dir, value.var = "ete")
setnames(df1, c("ticker", "ete_xy", "ete_yx"))
dt <- rbindlist(list(
  df1[, quantiles := "(05, 95)"],
  df2[, quantiles := "(10, 90)"]
))

df_long2 <- melt(dt, id.vars = c("ticker", "quantiles"))

df_long2[, quantiles := factor(quantiles, levels = c("(05, 95)", "(10, 90)"))]
df_long2[, variable := factor(variable, levels = c("ete_xy", "ete_yx"),
                              labels = c("Flow towards Market",
                                         "Flow towards Stock"))]

ggplot(df_long2, aes(x = quantiles, y = value, color = ticker, group = ticker)) + 
  geom_line() + 
  facet_wrap(~variable) +
  labs(
    x = "Quantiles", 
    y = "Effective Transfer Entropy",
    title = "Change of ETE-Values for different Quantiles",
    color = "Ticker"
  )

## ----renyi_te------------------------------------------------------------
qs <- c(seq(0.1, 0.9, 0.1), 0.99)
d <- stocks[ticker == "AXP"]

q_list <- lapply(qs, function(q) {
  
  # transfer_entropy will give a warning as nboot < 100
  suppressWarnings({
    tefit <- transfer_entropy(d$ret, d$sp500, lx = 1, ly = 1, 
                              entropy = "Renyi", q = q, 
                              shuffles = 50, quantiles = c(10, 90), 
                              nboot = 20, quiet = T)
  })
  data.table(
    q   = q,
    dir = c("X->Y", "Y->X"),
    coef(tefit)[, 2:3]
  )
})
qdt <- rbindlist(q_list)

sh_dt <- data.table(
  dir = c("X->Y", "Y->X"),
  ete = c(calc_ete(d$ret, d$sp500), calc_ete(d$sp500, d$ret))
)
qdt[, pe := qnorm(0.95) * se]

ggplot(qdt, aes(x = q, y = ete)) +
  geom_hline(yintercept = 0, color = "darkgray") + 
  geom_hline(data = sh_dt, aes(yintercept = ete), linetype = "dashed",
             color = "red") +
  geom_point() +
  geom_errorbar(aes(ymin = ete - pe, ymax = ete + pe), 
                width = 0.25/10, col = "blue") +
  facet_wrap(~dir) +
  labs(x = "Values for q", y = "Renyi's Transfer Entropy",
       title = "Renyi's Transfer Entropy for different Values of q",
       subtitle = "For American Express (AXP, X) and the S&P 500 Index (Y)")

## ----future_details, eval = F--------------------------------------------
#  library(future)
#  
#  # enable parallelism
#  plan(multiprocess)
#  te <- transfer_entropy(x, y, nboot = 100)
#  
#  # execute sequential again
#  plan(sequential)
#  te <- transfer_entropy(x, y, nboot = 100)

## ----set_quiet-----------------------------------------------------------
set_quiet(TRUE)
te <- transfer_entropy(x, y, nboot = 0)

set_quiet(FALSE)
te <- transfer_entropy(x, y, nboot = 0)

