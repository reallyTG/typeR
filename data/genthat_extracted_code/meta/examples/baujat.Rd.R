library(meta)


### Name: baujat.meta
### Title: Baujat plot to explore heterogeneity in meta-analysis
### Aliases: baujat baujat.meta
### Keywords: hplot

### ** Examples

data(Olkin95)

m1 <- metabin(event.e, n.e, event.c, n.c, data=Olkin95,
              studlab=author, sm="OR", method="I")

# Generate Baujat plot
baujat(m1)

# Do not print study labels if the x-value is smaller than 4 and the
# y-value is smaller than 1.
baujat(m1, yscale=10, xmin=4, ymin=1)

# Change position of study labels
baujat(m1, yscale=10, xmin=4, ymin=1,
       pos=1, xlim=c(0, 6.5))

# Generate Baujat plot and assign x- and y- coordinates to R object b1
b1 <- baujat(m1)

# Calculate overall heterogeneity statistic
sum(b1$x)
m1$Q



