library(Smisc)


### Name: cusum
### Title: Calculates a sequence of Cusum statistics
### Aliases: cusum print.cusum plot.cusum signal.cusum

### ** Examples

y <- cusum(rnorm(50), 0.2, 2)
y

# Plot the cusum
plot(y)

# Show the indexes where the chart signaled
signal(y)

# A look at the attributes
attributes(y)



