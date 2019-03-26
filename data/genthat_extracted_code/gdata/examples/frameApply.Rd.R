library(gdata)


### Name: frameApply
### Title: Subset analysis on data frames
### Aliases: frameApply
### Keywords: manip

### ** Examples

data(ELISA, package="gtools")

# Default is slightly unintuitive, but commonly useful: 
frameApply(ELISA, by = c("PlateDay", "Read"))

# Wouldn't actually recommend this model! Just a demo:
frameApply(ELISA, on = c("Signal", "Concentration"), by = c("PlateDay", "Read"),
           fun = function(dat) coef(lm(Signal ~ Concentration, data =
dat)))

frameApply(ELISA, on = "Signal", by = "Concentration",
           fun = function(dat, ...) {
                    x <- dat[[1]]
                    out <- c(Mean = mean(x, ...),
                             SD = sd(x, ...),
                             N = sum(!is.na(x)))
                  },
           na.rm = TRUE,
           subset = !is.na(Concentration))



