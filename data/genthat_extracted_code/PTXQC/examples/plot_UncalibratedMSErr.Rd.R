library(PTXQC)


### Name: plot_UncalibratedMSErr
### Title: A boxplot of uncalibrated mass errors for each Raw file.
### Aliases: plot_UncalibratedMSErr

### ** Examples

  n = c(150, 1000, 1000, 1000)
  data = data.frame(fc.raw.file = repEach(letters[4:1], n),
                    uncalibrated.mass.error..ppm. = c(rnorm(n[1], 13, 2.4),
                                                      rnorm(n[2], 4, 0.5),
                                                      rnorm(n[3], 3, 0.7),
                                                      rnorm(n[4], 4.5, 0.8)))
  stats = data.frame(fc.raw.file = letters[4:1],
                     sd = c(2.4, 0.5, 0.7, 0.8),
                     outOfCal = c(TRUE, FALSE, FALSE, FALSE))           
  plot_UncalibratedMSErr(data, MQBug_raw_files = letters[1],
                         stats, y_lim = c(-20,20), 15, "subtitle")




