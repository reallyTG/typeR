## ---- include=FALSE, echo=FALSE------------------------------------------
library(knitr)
opts_chunk$set(fig.path = 'figure1/', fig.align = 'center', 
               fig.show = 'hold', fig.width = 7, fig.height = 4)
options(warnPartialMatchArgs = FALSE)

## ------------------------------------------------------------------------
library(ggplot2)
library(gginnards)
library(tibble)

## ------------------------------------------------------------------------
set.seed(4321)
# generate artificial data
x <- 1:100
y <- (x + x^2 + x^3) + rnorm(length(x), mean = 0, sd = mean(x^3) / 4)
my.data <- data.frame(x, 
                      y, 
                      group = c("A", "B"), 
                      y2 = y * c(0.5, 2),
                      block = c("a", "a", "b", "b"))

## ------------------------------------------------------------------------
old_theme <- theme_set(theme_bw())

## ------------------------------------------------------------------------
class(ggplot())

## ------------------------------------------------------------------------
ggplot()

## ------------------------------------------------------------------------
str(ggplot())

## ------------------------------------------------------------------------
str(ggplot(data = my.data, aes(x, y, colour = group)))

## ------------------------------------------------------------------------
summary(ggplot(data = my.data, aes(x, y, colour = group)) +
          geom_point())

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_null()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  stat_debug_group()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_group()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_panel()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  stat_debug_group()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  stat_debug_panel()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, shape = group)) + 
  geom_point() + 
  stat_debug_group()

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  geom_debug(summary.fun = head)

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  stat_smooth(method = "lm", geom = "debug")

## ------------------------------------------------------------------------
ggplot(my.data, aes(group, y, colour = group)) + 
  geom_point(colour = "black") + 
  stat_summary(fun.data = "mean_se") +
  stat_summary(fun.data = "mean_se", geom = "debug")

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  stat_debug_group(summary.fun = head, summary.fun.args = list(n = 3))

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  stat_debug_group(summary.fun = nrow) +
  facet_wrap(~block)

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  stat_debug_panel(summary.fun = nrow) +
  facet_wrap(~block)

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, shape = group)) + 
  geom_point() + 
  stat_debug_group(geom = "label", vjust = c(-0.5,1.5))

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_group(summary.fun = as_tibble)

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_group(summary.fun = summary)

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_group(summary.fun = head)

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_group(summary.fun = head, summary.fun.args = list(n = 3))

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y)) + 
  geom_point() + 
  stat_debug_group(summary.fun = nrow)

## ---- eval=FALSE---------------------------------------------------------
#  ggplot(my.data, aes(x, y)) +
#    geom_point() +
#    stat_debug_group(summary.fun = function(x) {x})

## ------------------------------------------------------------------------
pipe_assign <- function(value, name, pos = .GlobalEnv, ...) {
  assign(x = name, value = value, inherits = FALSE, pos = pos, ...)
}

ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  geom_debug(summary.fun = pipe_assign, 
             summary.fun.args = list(name = "debug_data"),
             print.fun = NULL)

debug_data

## ------------------------------------------------------------------------
ggplot(my.data, aes(x, y, colour = group)) + 
  geom_point() + 
  geom_debug(summary.fun = NULL)

