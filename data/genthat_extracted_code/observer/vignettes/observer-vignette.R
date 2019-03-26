## ---- echo = FALSE, message = FALSE, warning = FALSE---------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(dplyr)
library(tibble)
library(observer)

## ------------------------------------------------------------------------
df <- ggplot2::diamonds %>% 
  mutate(depth2 = 100*2*z/(x+y)) %>% 
  observe_if(x > 0, 
             y > 0, 
             z > 0, 
             abs(depth-depth2) < 1)

obs(df)

## ------------------------------------------------------------------------
inspect(df, 4)

## ------------------------------------------------------------------------
## Write your predicates first
p <- c(~ x > 0, ~ y > 0, ~ z > 0, 
       ~ abs(depth-depth2) < 1)

## Make observations
df %>% 
  observe_if_(.dots = p) %>% 
  obs()

