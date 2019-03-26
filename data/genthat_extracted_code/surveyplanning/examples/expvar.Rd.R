library(surveyplanning)


### Name: expvar
### Title: Expected precision for the estimates of totals
### Aliases: expvar
### Keywords: surveyplanning

### ** Examples


data <- data.table(H = 1:3,
                   Yh = 10 * 1:3, Yh1 = 10 * 4:6,
                   s2h = 10 * runif(3), s2h2 = 10 * runif(3),
                   nh = rep(4 * 1:3),
                   poph = 8 * 1:3,
                   Rh = rep(1, 3),
                   deffh = rep(2, 3), deffh2 = rep(3, 3),
                   dd = c(1, 1, 1))

vars <- expvar(Yh = c("Yh", "Yh1"), H = "H",
               s2h = c("s2h", "s2h2"),
               nh = "nh", poph = "poph",
               Rh = "Rh", deffh = c("deffh", "deffh2"),
               dataset = data)

vars



