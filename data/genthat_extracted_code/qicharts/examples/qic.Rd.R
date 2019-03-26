library(qicharts)


### Name: qic
### Title: Quality improvement charts
### Aliases: qic

### ** Examples

set.seed(1)
# Run chart of 24 samples of a random continuous variable
# with an approximate mean = 12 and standard deviation = 3.
y <- rnorm(24, 12, 3)
qic(y)

# Add subgroup vector (dates) and a target
x <- seq.Date(as.Date('2013-08-04'), by = 'week', length = 24)
qic(y, x = x, target = 16)

# Individuals control chart
qic(y, x = x, chart = 'i')

# Xbar control chart, sample size = 5
y <- rnorm(5 * 24)
x <- rep(x, 5)
qic(y, x = x, chart = 'xbar')

# Create data frame with counts and sample sizes by week
d <- data.frame(week = seq.Date(as.Date('2013-08-04'),
                                by = 'week',
                                length = 36),
                y = c(rbinom(24, 20, 0.5), rbinom(12, 20, 0.8)),
                n = round(rnorm(36, 20, 2)))

# Proportions control chart
qic(y, n, x = week, data = d[1:24,], chart = 'p')

# Introduce change in process performance
qic(y, n, x = week, data = d, chart = 'p')

# Freeze baseline to first 24 samples
qic(y, n, x = week, data = d, chart = 'p', freeze = 24)

# Break control chart before and after change
qic(y, n, x = week, data = d, chart = 'p', breaks = 24)

# Introduce extreme sample value and notes
d$a <- ''
d$a[30] <- 'Extreme value'
d$y[30] <- 1
qic(y, n, x = week, data = d, chart = 'p',
    breaks = 24,
    notes = a)

# Exclude value from calculations
d$a[30] <- 'Value excluded from calculations'
qic(y, n, x = week, data = d, chart = 'p',
    breaks = 24,
    notes = a,
    exclude = 30)



