## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", dev = "png", fig.width = 7, fig.height = 5, message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
library(sjPlot)
library(sjmisc)
library(sjlabelled)
library(ggplot2)
theme_set(theme_bw())
data(efc)
sjp.grpfrq(efc$e42dep, efc$c172code, geom.colors = "gs")

## ------------------------------------------------------------------------
# create binrary response
y <- ifelse(efc$neg_c_7 < median(na.omit(efc$neg_c_7)), 0, 1)

# create data frame for fitting model
df <- data.frame(
  y = to_factor(y),
  sex = to_factor(efc$c161sex),
  dep = to_factor(efc$e42dep),
  barthel = efc$barthtot,
  education = to_factor(efc$c172code)
)

# set variable label for response
set_label(df$y) <- "High Negative Impact"

# fit model
fit <- glm(y ~., data = df, family = binomial(link = "logit"))

# plot marginal effects
plot_model(
  fit, 
  type = "pred", 
  terms = c("barthel", "sex","dep"), 
  colors = "bw",
  ci.lvl = NA
)

## ------------------------------------------------------------------------
# plot coefficients
plot_model(fit, colors = "black")

