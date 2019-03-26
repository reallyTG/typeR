## ----set-options, echo = FALSE-------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", dev = "png", fig.width = 7, fig.height = 5, message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
set.seed(5)

data <- data.frame(
  outcome = rbinom(100, 1, 0.5),
  var1 = rbinom(100, 1, 0.1),
  var2 = rnorm(100, 10, 7)
)

m <- glm(
  outcome ~ var1 * var2, 
  data = data, 
  family = binomial(link = "logit")
)

## ----eval=FALSE----------------------------------------------------------
#  use data.dta, clear
#  quietly logit outcome c.var1##c.var2
#  quietly margins, at(var2 = (-8(0.5)28) var1 = (0 1))
#  marginsplot

## ----out.width="100%", echo=FALSE----------------------------------------
knitr::include_graphics("vignette-stata-1.png", dpi = 72)

## ------------------------------------------------------------------------
library(ggeffects)
ggpredict(m, c("var2", "var1")) %>% plot()

## ------------------------------------------------------------------------
library(survey)
set.seed(123)

df1 <- data.frame(
  id = seq(1, 100, by = 1),
  gender = as.factor(rbinom(n = 100, size = 1, prob = 0.50)),
  working = as.factor(rbinom(n = 100, size = 1, prob = 0.40)),
  income  = sample(0:100000, 100),
  pweight = sample(50:500, 100, replace = TRUE)
)
  
des <- svydesign(
  id = ~id,
  weights = ~pweight,
  data = df1
)

m <- svyglm(
  gender ~ working * income,
  family = quasibinomial(),
  data = df1,
  design = des
)

## ------------------------------------------------------------------------
ggpredict(m, terms = c("working [0, 1]", "income [100, 1000, 10000]"))

## ------------------------------------------------------------------------
newdata <- data.frame(
  working = as.factor(c(0, 1, 0, 1, 0, 1)),
  income = c(100, 100, 1000, 1000, 10000, 10000)
)

prdat <-
  predict(
    m,
    newdata = newdata,
    type = "response",
    se.fit = TRUE
  )

pr <- as.vector(prdat)

# almost match STATA output, but computation is imprecise
cbind(
  est = pr, 
  lower = pr - qnorm(.975) * sqrt(attr(prdat, "var")),
  upper = pr + qnorm(.975) * sqrt(attr(prdat, "var"))
)

## ------------------------------------------------------------------------
prdat <-
  predict(
    m,
    newdata = newdata,
    type = "link",
    se.fit = TRUE
  )

linv <- sjstats::link_inverse(m)

# more precise approach, matches the output from ggpredict()
pr <- as.vector(prdat)
cbind(
  est = linv(pr), 
  lower = linv(pr - qnorm(.975) * sqrt(attr(prdat, "var"))),
  upper = linv(pr + qnorm(.975) * sqrt(attr(prdat, "var")))
)

