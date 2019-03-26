library(intubate)


### Name: graphics
### Title: Interfaces for graphics package for data science pipelines.
### Aliases: ntbt_boxplot ntbt_cdplot ntbt_coplot ntbt_mosaicplot
###   ntbt_pairs ntbt_plot ntbt_spineplot ntbt_sunflowerplot
###   ntbt_stripchart ntbt_text
### Keywords: intubate magrittr graphics boxplot cdplot coplot mosaicplot
###   pairs plot spineplot sunflowerplot stripchart text

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D 
##D ## boxplot
##D ## Original function to interface
##D boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
##D 
##D boxplot(len ~ dose, data = ToothGrowth,
##D         boxwex = 0.25, at = 1:3 - 0.2,
##D         subset = supp == "VC", col = "yellow",
##D         main = "Guinea Pigs' Tooth Growth",
##D         xlab = "Vitamin C dose mg",
##D         ylab = "tooth length",
##D         xlim = c(0.5, 3.5), ylim = c(0, 35), yaxs = "i")
##D boxplot(len ~ dose, data = ToothGrowth, add = TRUE,
##D         boxwex = 0.25, at = 1:3 + 0.2,
##D         subset = supp == "OJ", col = "orange")
##D legend(2, 9, c("Ascorbic acid", "Orange juice"),
##D        fill = c("yellow", "orange"))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_boxplot(data = InsectSprays, count ~ spray, col = "lightgray")
##D 
##D ntbt_boxplot(data = ToothGrowth, len ~ dose,
##D              boxwex = 0.25, at = 1:3 - 0.2,
##D              subset = supp == "VC", col = "yellow",
##D              main = "Guinea Pigs' Tooth Growth",
##D              xlab = "Vitamin C dose mg",
##D              ylab = "tooth length",
##D              xlim = c(0.5, 3.5), ylim = c(0, 35), yaxs = "i")
##D ntbt_boxplot(data = ToothGrowth, len ~ dose,
##D              add = TRUE,
##D              boxwex = 0.25, at = 1:3 + 0.2,
##D              subset = supp == "OJ", col = "orange")
##D legend(2, 9, c("Ascorbic acid", "Orange juice"),
##D        fill = c("yellow", "orange"))
##D 
##D ## so it can be used easily in a pipeline.
##D InsectSprays %>%
##D   ntbt_boxplot(count ~ spray, col = "lightgray")
##D 
##D ToothGrowth %T>%  ## Note the tee operator.
##D   ntbt_boxplot(len ~ dose,
##D                boxwex = 0.25, at = 1:3 - 0.2,
##D                subset = supp == "VC", col = "yellow",
##D                main = "Guinea Pigs' Tooth Growth",
##D                xlab = "Vitamin C dose mg",
##D                ylab = "tooth length",
##D                xlim = c(0.5, 3.5), ylim = c(0, 35),
##D                yaxs = "i") %>%
##D   ntbt_boxplot(len ~ dose,
##D                add = TRUE,
##D                boxwex = 0.25, at = 1:3 + 0.2,
##D                subset = supp == "OJ", col = "orange")
##D legend(2, 9, c("Ascorbic acid", "Orange juice"),
##D        fill = c("yellow", "orange"))
##D 
##D ## cdplot
##D ## NASA space shuttle o-ring failures
##D oring <- data.frame(
##D   fail = factor(c(2, 2, 2, 2, 1, 1, 1, 1,
##D                   1, 1, 2, 1, 2, 1, 1, 1,
##D                   1, 2, 1, 1, 1, 1, 1),
##D                levels = 1:2, labels = c("no", "yes")),
##D   temperature = c(53, 57, 58, 63, 66, 67, 67, 67,
##D                  68, 69, 70, 70, 70, 70, 72, 73,
##D                  75, 75, 76, 76, 78, 79, 81))
##D 
##D ## Original function to interface
##D cdplot(fail ~ temperature, oring)
##D cdplot(fail ~ temperature, oring, bw = 2)
##D cdplot(fail ~ temperature, oring, bw = "SJ")
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_cdplot(oring, fail ~ temperature)
##D ntbt_cdplot(oring, fail ~ temperature, bw = 2)
##D ntbt_cdplot(oring, fail ~ temperature, bw = "SJ")
##D 
##D ## so it can be used easily in a pipeline.
##D oring %>%
##D   ntbt_cdplot(fail ~ temperature)
##D oring %>%
##D   ntbt_cdplot(fail ~ temperature, bw = 2)
##D oring %>%
##D   ntbt_cdplot(fail ~ temperature, bw = "SJ")
##D 
##D ## coplot
##D Index <- seq(length = nrow(warpbreaks))
##D 
##D ## Original function to interface
##D coplot(breaks ~ Index | wool * tension, data = warpbreaks,
##D        show.given = 0:1)
##D coplot(breaks ~ Index | wool * tension, data = warpbreaks,
##D        col = "red", bg = "pink", pch = 21,
##D        bar.bg = c(fac = "light blue"))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_coplot(data = warpbreaks, breaks ~ Index | wool * tension,
##D             show.given = 0:1)
##D ntbt_coplot(data = warpbreaks, breaks ~ Index | wool * tension,
##D             col = "red", bg = "pink", pch = 21,
##D             bar.bg = c(fac = "light blue"))
##D 
##D ## so it can be used easily in a pipeline.
##D warpbreaks %T>%  ## Note the tee operator.
##D   ntbt_coplot(breaks ~ Index | wool * tension,
##D               show.given = 0:1) %>%
##D   ntbt_coplot(breaks ~ Index | wool * tension,
##D               col = "red", bg = "pink", pch = 21,
##D               bar.bg = c(fac = "light blue"))
##D 
##D ## mosaicplot
##D ## Original function to interface
##D mosaicplot(~ Sex + Age + Survived, data = Titanic, color = TRUE)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_mosaicplot(data = Titanic, ~ Sex + Age + Survived, color = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D Titanic %>%
##D   ntbt_mosaicplot(~ Sex + Age + Survived, color = TRUE)
##D 
##D ## pairs
##D ## Original function to interface
##D pairs(~ Fertility + Education + Catholic, data = swiss,
##D       subset = Education < 20,
##D       main = "Swiss data, Education < 20")
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_pairs(data = swiss, ~ Fertility + Education + Catholic,
##D            subset = Education < 20,
##D            main = "Swiss data, Education < 20")
##D 
##D ## so it can be used easily in a pipeline.
##D swiss %>%
##D   ntbt_pairs(~ Fertility + Education + Catholic,
##D              subset = Education < 20,
##D              main = "Swiss data, Education < 20")
##D 
##D ## plot
##D ## Original function to interface
##D plot(Ozone ~ Wind, data = airquality, pch = as.character(Month))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_plot(data = airquality, Ozone ~ Wind, pch = as.character(Month))
##D 
##D ## so it can be used easily in a pipeline.
##D airquality %>%
##D   ntbt_plot(Ozone ~ Wind, pch = as.character(Month))
##D   
##D op <- par(mfrow = c(2,1))
##D airquality %>%  ## Note: we are *not* using the tee operator.
##D   ntbt_plot(Ozone ~ Wind, pch = as.character(Month)) %>%
##D   ntbt_plot(Ozone ~ Wind, pch = as.character(Month),
##D             subset = Month != 7) %>%
##D   head()          ## Yes! We still have the data to do what we want!
##D par(op)
##D 
##D ## text.formula() can be very natural:
##D within(warpbreaks, {
##D     time <- seq_along(breaks)
##D     W.T <- wool:tension
##D }) %>%
##D   ntbt_plot(breaks ~ time, type = "b") %>%
##D   ntbt_text(breaks ~ time, label = W.T, col = 1 + as.integer(wool))
##D 
##D ## splineplot
##D ## NASA space shuttle o-ring failures
##D oring <- data.frame(
##D   fail = factor(c(2, 2, 2, 2, 1, 1, 1, 1,
##D                   1, 1, 2, 1, 2, 1, 1, 1,
##D                   1, 2, 1, 1, 1, 1, 1),
##D                levels = 1:2, labels = c("no", "yes")),
##D   temperature = c(53, 57, 58, 63, 66, 67, 67, 67,
##D                  68, 69, 70, 70, 70, 70, 72, 73,
##D                  75, 75, 76, 76, 78, 79, 81))
##D 
##D ## Original function to interface
##D spineplot(fail ~ temperature, oring)
##D spineplot(fail ~ temperature, oring, breaks = 3)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_spineplot(oring, fail ~ temperature)
##D ntbt_spineplot(oring, fail ~ temperature, breaks = 3)
##D 
##D ## so it can be used easily in a pipeline.
##D oring %>%
##D   ntbt_spineplot(fail ~ temperature)
##D oring %>%
##D   ntbt_spineplot(fail ~ temperature, breaks = 3)
##D 
##D ## sunflowerplot
##D ## Original function to interface
##D sunflowerplot(Petal.Width ~ Petal.Length, data = iris,
##D               cex = .2, cex.fact = 1, size = .035,
##D               seg.lwd = .8)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_sunflowerplot(data = iris, Petal.Width ~ Petal.Length,
##D                    cex = .2, cex.fact = 1, size = .035,
##D                    seg.lwd = .8)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_sunflowerplot(Petal.Width ~ Petal.Length,
##D                      cex = .2, cex.fact = 1, size = .035,
##D                      seg.lwd = .8)
##D 
##D ## stripchart
##D ## Original function to interface
##D stripchart(decrease ~ treatment, data = OrchardSprays,
##D            main = "stripchart(OrchardSprays)",
##D            vertical = TRUE, log = "y")
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_stripchart(data = OrchardSprays, decrease ~ treatment,
##D                 main = "stripchart(OrchardSprays)",
##D                 vertical = TRUE, log = "y")
##D 
##D ## so it can be used easily in a pipeline.
##D OrchardSprays %>%
##D   ntbt_stripchart(decrease ~ treatment,
##D                   main = "stripchart(OrchardSprays)",
##D                   vertical = TRUE, log = "y")
##D 
##D ## text
##D data <- within(warpbreaks, {
##D     time <- seq_along(breaks)
##D     W.T <- wool:tension
##D })
##D 
##D ## Original function to interface
##D plot(breaks ~ time, data, type = "b")
##D text(breaks ~ time, data, label = W.T, col = 1 + as.integer(wool))
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_plot(data, breaks ~ time, type = "b")
##D ntbt_text(data, breaks ~ time, label = W.T, col = 1 + as.integer(wool))
##D 
##D ## so it can be used easily in a pipeline.
##D data %>%
##D   ntbt_plot(breaks ~ time, type = "b") %>%
##D   ntbt_text(breaks ~ time, label = W.T, col = 1 + as.integer(wool)) %>%
##D   head()          ## Yes! We still have the data to do what we want!
## End(Not run)



