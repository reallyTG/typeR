library(nanostringr)


### Name: CCplot
### Title: Concordance Correlation Plot
### Aliases: CCplot

### ** Examples

# Simulate normally distributed data
set.seed(12)
a1 <- rnorm(20) + 2
a2 <- a1 + rnorm(20, 0, 0.15)
a3 <- a1 + rnorm(20, 0, 0.15) + 1.4
a4 <- 1.5 * a1 + rnorm(20, 0, 0.15)
a5 <- 1.3 * a1 + rnorm(20, 0, 0.15) + 1
a6 <- a1 + rnorm(20, 0, 0.8)

# One scatterplot
CCplot(a1, a2, Ptype = "scatter")


m2 <- list(a1, a2, a3, a4, a5, a6)
mains <- c("Perfect Agreement", "Very Good Agreement", "Location Shift",
           "Scale Shift", "Location and Scale Shift", "Measurement Error")
subs <- letters[1:6]
par(mfrow = c(3, 2), mar = c(5.1, 4.1, 1.5, 1.5))

# Scatterplots
mapply(function(y, t, s)
  CCplot(method1 = a1, method2 = y, Ptype = "scatter",
         xlabel = "X", ylabel = "Y", title = t, subtitle = s),
  y = m2, t = mains, s = subs)

# MAplots and show metrics
mapply(function(y, t, s)
  CCplot(method1 = a1, method2 = y, Ptype = "MAplot",
         title = t, subtitle = s, metrics = TRUE),
  y = m2, t = mains, s = subs)



