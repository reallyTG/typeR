## ------------------------------------------------------------------------
costs <- matrix(c(1.5, NA ,NA ,1 ,0 , NA, 5, -1, 1), 
                nrow = 3)
print(costs)

## ------------------------------------------------------------------------
library("RcppDynProg")
soln <- solve_interval_partition(costs, nrow(costs))
print(soln)

## ------------------------------------------------------------------------
lapply(
  seq_len(length(soln)-1),
  function(i) {
    soln[i]:(soln[i+1]-1)
  })

## ----r1, fig.height = 6, fig.width = 8, fig.align = "center", echo=FALSE----
plot <- requireNamespace("ggplot2", quietly = TRUE)
if(plot) {
  suppressPackageStartupMessages(library("ggplot2"))
}

set.seed(2018)
g <- 100
d <- data.frame(
  x = 0.05*(1:(3*g))) # ordered in x
d$y_ideal <- sin((0.3*d$x)^2)
d$y_observed <- d$y_ideal + 0.25*rnorm(length(d$y_ideal))

if(plot) {
  plt1 <- ggplot(data= d, aes(x = x)) + 
    geom_line(aes(y = y_ideal), linetype=2) +
    geom_point(aes(y = y_observed)) +
    ylab("y") +
    ggtitle("example data", 
            subtitle = "dots: observed values, dashed line: unobserved ideal values")
  print(plt1)
}

## ----rg1, fig.height = 6, fig.width = 8, fig.align = "center", echo=FALSE----
x_cuts <- solve_for_partition(d$x, d$y_observed, penalty = 1)
d$group <- as.character(
  findInterval(d$x, x_cuts[x_cuts$what=="left", "x"]))
d$group <- ifelse(d$group==2, "interval", "not interval")
colors <- c("interval" = "darkblue", "not interval" = "lightgray")
good_interval_indexes <- c(min(which(d$group=="interval")), max(which(d$group=="interval")))
m <- lm(y_observed ~ x, data = d[d$group == "interval", ])
if(plot) {
  pltg <- ggplot(data= d, aes(x = x)) + 
    geom_line(aes(y = y_ideal), linetype=2) +
    geom_point(aes(y = y_observed, color = group)) +
    geom_abline(intercept = coef(m)["(Intercept)"], slope = coef(m)["x"], color="blue") +
    ylab("y") +
    ggtitle("an example good interval") + 
    theme(legend.position = "none") +
    scale_color_manual(values = colors)
  print(pltg)
}
interval_len <- sum(d$group=="interval")
d$group <- NULL

## ----rg2, fig.height = 6, fig.width = 8, fig.align = "center"------------
print(good_interval_indexes) # interval 
print(1 + good_interval_indexes[2] - good_interval_indexes[1]) # width
fit <- lm(y_observed ~ x, 
          data = d[good_interval_indexes[1]:good_interval_indexes[2], ])
sum(fit$residuals^2) # cost for interval

## ----rb1, fig.height = 6, fig.width = 8, fig.align = "center", echo=FALSE----
d$group <- "not interval"
start <- 120
d$group[(good_interval_indexes[1]:good_interval_indexes[2]) + 
          round((good_interval_indexes[2]-good_interval_indexes[1])/2)] <- "interval"
bad_interval_indexes <- c(min(which(d$group=="interval")), max(which(d$group=="interval")))
m <- lm(y_observed ~ x, data = d[d$group == "interval", ])
if(plot) {
  pltb <- ggplot(data= d, aes(x = x)) + 
    geom_line(aes(y = y_ideal), linetype=2) +
    geom_point(aes(y = y_observed, color = group)) +
    geom_abline(intercept = coef(m)["(Intercept)"], slope = coef(m)["x"], color="blue") +
    ylab("y") +
    ggtitle("an example bad interval") + 
    theme(legend.position = "none") +
    scale_color_manual(values = colors)
  print(pltb)
}
d$group <- NULL

## ----rb2, fig.height = 6, fig.width = 8, fig.align = "center"------------
print(bad_interval_indexes) # interval
print(1 + bad_interval_indexes[2] - bad_interval_indexes[1]) # width
fit <- lm(y_observed ~ x, 
          data = d[bad_interval_indexes[1]:bad_interval_indexes[2], ])
sum(fit$residuals^2) # cost for interval

## ----r2, fig.height = 6, fig.width = 8, fig.align = "center"-------------
x_cuts <- solve_for_partition(d$x, d$y_observed, penalty = 1)
print(x_cuts)

d$estimate <- approx(x_cuts$x, x_cuts$pred, 
                     xout = d$x, 
                     method = "linear", rule = 2)$y
d$group <- as.character(
  findInterval(d$x, x_cuts[x_cuts$what=="left", "x"]))

if(plot) {
  plt2 <- ggplot(data= d, aes(x = x)) + 
    geom_line(aes(y = y_ideal), linetype=2) +
    geom_point(aes(y = y_observed, color = group)) +
    geom_line(aes(y = estimate, color = group)) +
    ylab("y") +
    ggtitle("RcppDynProg piecewise linear estimate",
            subtitle = "dots: observed values, segments: observed group means, dashed line: unobserved true values") + 
    theme(legend.position = "none") +
    scale_color_brewer(palette = "Dark2")
  print(plt2)
}

