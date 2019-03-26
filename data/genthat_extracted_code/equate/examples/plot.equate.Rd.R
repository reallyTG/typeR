library(equate)


### Name: plot.equate
### Title: Plotting Equating Results
### Aliases: plot.equate plot.equate.list

### ** Examples


# See ?equate for additional examples

rx <- as.freqtab(ACTmath[, 1:2])
ry <- as.freqtab(ACTmath[, c(1, 3)])
set.seed(2007)

req1 <- equate(rx, ry, type = "i", boot = TRUE, reps = 5)
req2 <- equate(rx, ry, type = "m", boot = TRUE, reps = 5)
req3 <- equate(rx, ry, type = "l", boot = TRUE, reps = 5)
req4 <- equate(rx, ry, type = "e", boot = TRUE, reps = 5,
  smooth = "loglin", degree = 3)
req5 <- composite(list(req1, req2), wc = .5, symmetric = TRUE)

plot(req1, req2, req3, req4, req5[[1]], addident = FALSE)
plot(req5)




