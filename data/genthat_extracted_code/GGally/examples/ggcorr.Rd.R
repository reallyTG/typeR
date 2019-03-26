library(GGally)


### Name: ggcorr
### Title: ggcorr - Plot a correlation matrix with ggplot2
### Aliases: ggcorr

### ** Examples

# Basketball statistics provided by Nathan Yau at Flowing Data.
dt <- read.csv("http://datasets.flowingdata.com/ppg2008.csv")

# Default output.
ggcorr(dt[, -1])

# Labelled output, with coefficient transparency.
ggcorr(dt[, -1],
       label = TRUE,
       label_alpha = TRUE)

# Custom options.
ggcorr(
  dt[, -1],
  name = expression(rho),
  geom = "circle",
  max_size = 10,
  min_size = 2,
  size = 3,
  hjust = 0.75,
  nbreaks = 6,
  angle = -45,
  palette = "PuOr" # colorblind safe, photocopy-able
)

# Supply your own correlation matrix
ggcorr(
  data = NULL,
  cor_matrix = cor(dt[, -1], use = "pairwise")
)



