library(Smisc)


### Name: timeDiff
### Title: Subtracts two time series by matching irregular time indexes
### Aliases: timeDiff
### Keywords: misc

### ** Examples

data(timeDiff.eg)

# Show the objects
print(timeDiff.eg)

# Extract the objects from the list for easier use in the example
sepList(timeDiff.eg)

# Print warnings as they occur
op <- options(warn = 1)

# Show various differences
timeDiff(x1, x2, full = TRUE)
timeDiff(x2.d, x1.d, full = TRUE)
timeDiff(x1, x1)

options(op)

### If we need to average a time-series at 30 second invervals:

# Create the vector that will be averaged, with time stamps occuring
# about every 10 seconds
v1.names <- seq(formatDT("2009-09-12 3:20:31")$dt.posix,
                formatDT("2009-09-12 3:29:15")$dt.posix, by = 10)

# Now jitter the times a bit and look at the time spacing
v1.names <- v1.names + round(rnorm(length(v1.names), sd = 1.5))
diff(v1.names)

# Create the vector
v1 <- abs(rnorm(length(v1.names), mean = 7, sd = 3))
names(v1) <- v1.names

# Now create a standard vector with values of 0 with time stamps every 30 seconds
standard.names <- seq(formatDT("2009-09-12 3:21:30")$dt.posix,
                      formatDT("2009-09-12 3:28:30")$dt.posix, by = 30)
standard <- double(length(standard.names))
names(standard) <- standard.names

# Now average the v1 values by matching the 3 closest values to each standard time:
timeDiff(v1, standard, n.ind = 3, full = TRUE)
v1.avg <- timeDiff(v1, standard, n.ind = 3)

# Check that every 3 obs were averaged
v1.avg.check <- tapply(v1[6:50], rep(1:15, each = 3), mean)
max(abs(v1.avg.check - v1.avg))





