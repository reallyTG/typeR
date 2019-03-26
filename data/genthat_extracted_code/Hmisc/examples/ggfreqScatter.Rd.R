library(Hmisc)


### Name: ggfreqScatter
### Title: Frequency Scatterplot
### Aliases: ggfreqScatter
### Keywords: hplot

### ** Examples

set.seed(1)
x <- rnorm(1000)
y <- rnorm(1000)
count <- sample(1:100, 1000, TRUE)
x <- rep(x, count)
y <- rep(y, count)
# color=alpha=NULL below makes loess smooth over all points
g <- ggfreqScatter(x, y) +   # might add g=0 if using plotly
      geom_smooth(aes(color=NULL, alpha=NULL), se=FALSE) +
      ggtitle("Using Deciles of Frequency Counts, 2500 Bins")
g
# plotly::ggplotly(g, tooltip='label')  # use plotly, hover text = freq. only
# Plotly makes it somewhat interactive, with hover text tooltips

# Try with x categorical
x1 <- sample(c('cat', 'dog', 'giraffe'), length(x), TRUE)
ggfreqScatter(x1, y)

# Try with y categorical
y1 <- sample(LETTERS[1:10], length(x), TRUE)
ggfreqScatter(x, y1)

# Both categorical, larger point symbols, box instead of circle
ggfreqScatter(x1, y1, shape=15, size=7)
# Vary box size instead
ggfreqScatter(x1, y1, nsize=TRUE, shape=15)



