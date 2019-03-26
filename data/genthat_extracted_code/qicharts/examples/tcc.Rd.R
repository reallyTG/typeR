library(qicharts)


### Name: tcc
### Title: Trellis Control Charts
### Aliases: tcc

### ** Examples

# Run chart of 24 random normal variables
tcc(rnorm(24))

# Build data frame for examples
d <- data.frame(x = rep(1:24, 4),
                mo = (rep(seq(as.Date('2014-1-1'),
                              length.out = 24,
                              by = 'month'),
                          4)),
                n = rbinom(4 * 24, 100, 0.5),
                d = round(runif(4 * 24, 90, 110)),
                g1 = rep(c('a', 'b'), each = 48),
                g2 = rep(c('A', 'B'), each = 24))

# Run chart with two grouping variables
tcc(n, d, mo, g1 = g1, g2 = g2, data = d)

# P chart
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p')

# P chart with baseline fixed to the first 12 data points
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p', freeze = 12)

# P chart with two breaks and summary output
tcc(n, d, mo, g1 = g1, g2 = g2, data = d, chart = 'p',
 breaks = c(12, 18), print.summary = TRUE)



