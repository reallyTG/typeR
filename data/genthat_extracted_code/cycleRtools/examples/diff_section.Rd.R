library(cycleRtools)


### Name: diff_section
### Title: Section data according to breaks.
### Aliases: diff_section

### ** Examples

t_sec <- c(1:10, 40:60, 100:150)       # Discontinuous timer values.
pwr   <- runif(length(t_sec), 0, 400)  # Some power values.
x     <- data.frame(t_sec, pwr)

## Generate section levels.
x$section <- diff_section(x$t_sec, br = 10) # 10 second breaks.
print(x)
split(x, x$section)

## Using "intervaldata", which has a large stop.
data(intervaldata)
intervaldata$section <- diff_section(intervaldata$timer.s, br = 20)
sp <- split(intervaldata, intervaldata$section)

## Plot.
eplot <- function(x) cycleRtools:::elev_plot(x, "timer.min")
layout(matrix(c(1, 2, 1, 3), 2, 2))
eplot(cycleRtools:::expand_stops(intervaldata))
eplot(sp[[1]])
eplot(sp[[2]])




