library(ca)


### Name: plot.ca
### Title: Plotting 2D maps in correspondence analysis
### Aliases: plot.ca

### ** Examples

data("smoke")

# A two-dimensional map with standard settings
plot(ca(smoke))

# Mass for rows and columns represented by the size of the point symbols
plot(ca(smoke), mass = c(TRUE, TRUE))

# Displaying the column profiles only with masses represented by size of point
# symbols and relative contributions by colour intensity.
# Since the arguments are recycled it is sufficient to give only one argument 
# for mass and contrib.
data("author")
plot(ca(author), what = c("none", "all"), mass = TRUE, contrib = "relative")




