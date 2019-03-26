library(IMIFA)


### Name: show_digit
### Title: Show image of grayscale grid
### Aliases: show_digit
### Keywords: plotting

### ** Examples

data(USPSdigits)

# Plot the first digit
show_digit(USPSdigits$train[1,-1])

# Visualise the overall mean
show_digit(colMeans(USPSdigits$train[,-1]))



