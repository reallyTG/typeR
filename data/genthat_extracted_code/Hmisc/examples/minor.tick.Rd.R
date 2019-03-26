library(Hmisc)


### Name: minor.tick
### Title: Minor Tick Marks
### Aliases: minor.tick
### Keywords: aplot hplot

### ** Examples

# Plot with default settings
plot(runif(20), runif(20))
minor.tick()

# Plot with arguments passed to axis()
plot(c(0,1), c(0,1), type = 'n', axes = FALSE, ann = FALSE)
# setting up a plot without axes and annotation
points(runif(20), runif(20))                       # plotting data
axis(1, pos = 0.5, lwd = 2)                        # showing X-axis at Y = 0.5 with formatting
axis(2, col = 2)                                   # formatted Y-axis
minor.tick( nx = 4, ny = 4, tick.ratio = 0.3,
            x.args = list(pos = 0.5, lwd = 2),     # X-minor tick format argumnets
            y.args = list(col = 2))                # Y-minor tick format arguments



