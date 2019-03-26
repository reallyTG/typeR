## ----message = F---------------------------------------------------------
set.seed(20171011)
library(tidyverse)
library(ciTools)
library(broom)

## ------------------------------------------------------------------------
tb <- tibble(
  x = runif(30, -1, 1),
  n = rbinom(30, 6, .8)
  ) %>%
  mutate(y = rbinom(30, n, (exp(x)/(1 + exp(x)))))

## ------------------------------------------------------------------------
tb

## ------------------------------------------------------------------------
glm(y/n ~ x, data = tb, family = "binomial", weights = n) %>% tidy()

## ------------------------------------------------------------------------
tbProb <- mutate(tb, prob = y/n)
tbProb
glm(prob ~ x, data = tbProb, family = "binomial", weights = n) %>% tidy()

## ----echo = F------------------------------------------------------------
get_box <- function(myRow){
    tibble(x = rep(myRow$x, myRow$n),
           y = c(rep(1, myRow$y), rep(0, myRow$n - myRow$y)))
}

out <- NULL
for(i in 1:nrow(tb)){
  out <- bind_rows(out, get_box(tb[i,]))
}

tbTall <- out

## ------------------------------------------------------------------------
tbTall
glm(y ~ x, data = tbTall, family = "binomial") %>% tidy()

## ----echo = F------------------------------------------------------------
fit <- glm(y/n ~ x, data = tb, family = "binomial", weights = n)

## ------------------------------------------------------------------------
add_quantile(tb, fit, p = 0.9)

