## ---- message=FALSE, warning=FALSE---------------------------------------
library(learningCurve)
library(tibble)
library(ggplot2)

## ---- collapse=TRUE------------------------------------------------------
unit_curve(t = 100, m = 1, n = 125, r = .85)

## ---- collapse=TRUE------------------------------------------------------
rates <- c(.80, .825, .85, .875, .90)

unit_curve(t = 100, m = 1, n = 125, r = rates)

## ---- echo=FALSE---------------------------------------------------------

product_data <- tibble(Product = c("Product A", "Product B", "Product C"),
                   `Learning Rate` = c(.83, .92, .87),
                   `Unit M` = c(1, 20, 10),
                   `Unit M Time` = c(100, 120, 90),
                   `Unit N` = c(80, 150, 175),
                   `Unit N Time` = "?")

## ---- collapse=TRUE------------------------------------------------------
product_data

## ---- collapse=TRUE------------------------------------------------------
unit_curve(t = product_data$`Unit M Time`, n = product_data$`Unit N`, 
           m = product_data$`Unit M`, r = product_data$`Learning Rate`)

## ---- fig.align='center', fig.height=3, fig.width=4----------------------
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "u")

## ---- collapse=TRUE------------------------------------------------------
unit_cum_exact(t = 100, n = 125, r = .85)

## ---- collapse=TRUE------------------------------------------------------
unit_cum_appx(t = 100, n = 125, r = .85)

## ---- collapse=TRUE------------------------------------------------------
# exact cumulative predicted value
unit_cum_exact(t = 100, n = 1000000, r = .85)

# approximate cumulative predicted value
unit_cum_appx(t = 100, n = 1000000, r = .85)

# computational time for exact cumulative prediction
system.time(unit_cum_exact(t = 100, n = 1000000, r = .85))

# computational time for approximate cumulative prediction
system.time(unit_cum_appx(t = 100, n = 1000000, r = .85))

## ---- fig.align='center', fig.height=3, fig.width=4----------------------
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "u", level = "c")

## ---- collapse=TRUE------------------------------------------------------
unit_midpoint(m = 201, n = 500, r = .75)

## ---- collapse=TRUE------------------------------------------------------
unit_block_summary(t = 125, m = 201, n = 500, r = .75)

## ---- fig.align='center', fig.height=3, fig.width=4----------------------
plot_block_summary(t = 125, m = 201, n = 500, r = .75)

## ---- collapse=TRUE------------------------------------------------------
ca_unit(t = 100, m = 1, n = 125, r = .85)

## ---- fig.align='center', fig.height=3, fig.width=4----------------------
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "ca", level = "u")

## ---- collapse=TRUE------------------------------------------------------
ca_block(t = 100, m = 1, n = 125, r = .85)

## ---- fig.align='center', fig.height=3, fig.width=4----------------------
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "ca", level = "c")

## ---- fig.align='center', fig.height=3, fig.width=7----------------------
plot_unit_curve(t = 100, m = 1, n = 25, r = .85, model = "both", level = "c")

## ---- collapse=TRUE------------------------------------------------------
# per unit time (or cost) differences
delta(t = 100, m = 1, n = 25, r = .85, level = "u")

# total time (or cost) difference
sum(delta(t = 100, m = 1, n = 25, r = .85, level = "u"))

# cumulative time (or cost) differences
delta(t = 100, m = 1, n = 25, r = .85, level = "c")

## ---- eval=FALSE---------------------------------------------------------
#  # left plot - per unit differences
#  plot_delta(t = 100, m = 1, n = 25, r = .85, level = "u")
#  
#  # right plot - cumulative differences
#  plot_delta(t = 100, m = 1, n = 25, r = .85, level = "c")

## ---- echo=FALSE, fig.align='center', fig.height=3, fig.width=8, warning=FALSE, message=FALSE----
library(gridExtra)

# left plot - per unit differences
p1 <- plot_delta(t = 100, m = 1, n = 25, r = .85, level = "u") +
  ggtitle("Per Unit Differences") +
  ylab("Difference in Time") +
  xlab("Production Unit")

# right plot - cumulative differences
p2 <- plot_delta(t = 100, m = 1, n = 25, r = .85, level = "c") +
  ggtitle("Cumulative Differences") +
  ylab("Difference in Time") +
  xlab("Production Unit")

grid.arrange(p1, p2, ncol = 2)

## ---- collapse=TRUE------------------------------------------------------
cum_error(n = 250, r1 = .85, r2 = .87)

## ---- collapse=TRUE------------------------------------------------------
1 - ca_unit(100, 250, .85) / ca_unit(100, 250, .87)

## ---- collapse=TRUE------------------------------------------------------
first_unit_hours <- c(70, 45, 25) 
dept_rates <- c(.85, .87, .80)

agg_curve(t = first_unit_hours, r = dept_rates, n = 300)

## ---- collapse=TRUE------------------------------------------------------
# initial estimate of first unit hours
first_unit_hours_before <- c(70, 45, 25)

# adjusted estimate of first unit hours
first_unit_hours_after <- c(70, 45, 30)

dept_rates <- c(.85, .87, .80)

# total hours with initial estimate
first_prediction <- agg_curve(t = first_unit_hours_before, r = dept_rates, n = 300)
first_prediction

# total hours with adjusted estimate
second_prediction <- agg_curve(t = first_unit_hours_after, r = dept_rates, n = 300)
second_prediction

# total hour impact due to change
second_prediction - first_prediction

## ---- collapse=TRUE------------------------------------------------------
rates <- c(.80, .85, .90)

natural_slope(rates)

## ---- collapse=TRUE------------------------------------------------------
slopes <- c(-.19, -.22, -.25)

lc_rate(slopes)

## ---- collapse=TRUE------------------------------------------------------
natural_slope_est(T = 8250, t = 80, n = 250)

## ---- collapse=TRUE------------------------------------------------------
lc_rate_est(T = 8250, t = 80, n = 250)

## ---- fig.align='center', fig.height=4, fig.width=7----------------------
subtitle <- "The difference in cumulative hours produced by the Crawford and Wright model when the first unit \nis estimated to take 100 hours, the expected learning rate is 85%, and total units produced is 25 is \nestimated to be 305 hours."

plot_unit_curve(t = 100, m = 1, n = 25, r = .85, model = "both", level = "c") +
  ggtitle("Differences in Predicted Values", 
          subtitle = subtitle) +
  xlab("Units Produced") +
  scale_y_continuous("Cumulative Hours", labels = scales::comma) +
  annotate("text") +
  annotate("text", x = 15, y = 1250, label = "Crawford's model", 
           color = "#F8766D", size = 3, hjust = 0) +
  annotate("text", x = 15, y = 700, label = "Wright's model", 
           color = "#00BFC4", size = 3, hjust = 0) +
  theme(legend.position = "none")
  
  

