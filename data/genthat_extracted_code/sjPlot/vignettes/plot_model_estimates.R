## ----echo = FALSE--------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", dev = "png", fig.width = 7, fig.height = 5, message = FALSE, warning = FALSE)

## ----results='hide'------------------------------------------------------
library(sjPlot)
library(sjlabelled)
library(sjmisc)
library(ggplot2)

data(efc)
theme_set(theme_sjplot())

## ----results='hide'------------------------------------------------------
# create binary response
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
m1 <- glm(y ~., data = df, family = binomial(link = "logit"))

## ------------------------------------------------------------------------
plot_model(m1)

## ------------------------------------------------------------------------
plot_model(m1, vline.color = "red")

## ------------------------------------------------------------------------
plot_model(m1, sort.est = TRUE)

## ------------------------------------------------------------------------
summary(m1)

## ------------------------------------------------------------------------
plot_model(m1, order.terms = c(6, 7, 1, 2, 3, 4, 5))

## ------------------------------------------------------------------------
plot_model(m1, transform = NULL)
plot_model(m1, transform = "plogis")

## ------------------------------------------------------------------------
plot_model(m1, show.values = TRUE, value.offset = .3)

## ------------------------------------------------------------------------
data(iris)
m2 <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Species, data = iris)

# variable names as labels, but made "human readable"
# separating dots are removed
plot_model(m2)
# to use variable names even for labelled data
plot_model(m1, axis.labels = "", title = "my own title")

## ------------------------------------------------------------------------
# keep only coefficients sex2, dep2 and dep3
plot_model(m1, terms = c("sex2", "dep2", "dep3"))
# remove coefficients sex2, dep2 and dep3
plot_model(m1, rm.terms = c("sex2", "dep2", "dep3"))

## ------------------------------------------------------------------------
plot_model(m2, type = "std")

## ----results='hide'------------------------------------------------------
if (require("rstanarm", quietly = TRUE)) {
  # make sure we apply a nice theme
  library(ggplot2)
  theme_set(theme_sjplot())
  
  data(mtcars)
  m <- stan_glm(mpg ~ wt + am + cyl + gear, data = mtcars, chains = 1)
  
  # default model
  plot_model(m)
  # same model, with mean point estimate, dot-style for point estimate
  # and different inner/outer probabilities of the HDI
  plot_model(
    m, 
    bpe = "mean",
    bpe.style = "dot",
    prob.inner = .4,
    prob.outer = .8
  )
}

## ------------------------------------------------------------------------
plot_model(
  m1, 
  colors = "Accent", 
  show.values = TRUE,
  value.offset = .4,
  value.size = 4,
  dot.size = 3,
  line.size = 1.5,
  vline.color = "blue",
  width = 1.5
)

