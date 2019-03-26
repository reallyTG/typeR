library(WVPlots)


### Name: plot_fit_trajectory
### Title: Plot the trajectory of a model fit.
### Aliases: plot_fit_trajectory

### ** Examples


d <- data.frame(
  epoch    = c(1,         2,         3,         4,         5),
  val_loss = c(0.3769818, 0.2996994, 0.2963943, 0.2779052, 0.2842501),
  val_acc  = c(0.8722000, 0.8895000, 0.8822000, 0.8899000, 0.8861000),
  loss     = c(0.5067290, 0.3002033, 0.2165675, 0.1738829, 0.1410933),
  acc      = c(0.7852000, 0.9040000, 0.9303333, 0.9428000, 0.9545333) )

cT <- data.frame(
  measure =    c("minus binary cross entropy", "accuracy"),
  training =   c("loss",                       "acc"),
  validation = c("val_loss",                   "val_acc"),
  stringsAsFactors = FALSE)

plt <- plot_fit_trajectory(
  d,
  column_description = cT,
  needs_flip = "minus binary cross entropy",
  title = "model performance by epoch, dataset, and measure",
  epoch_name = "epoch",
  pick_metric = "minus binary cross entropy",
  discount_rate = 0.1)

suppressWarnings(print(plt)) # too few points for loess




