library(kpeaks)


### Name: genpolygon
### Title: Generate the Classes to Build a Frequency Polygon
### Aliases: genpolygon

### ** Examples

x <- rnorm(n=100, mean=5, sd=0.5)
# Construct the histogram of x according to the Sturges rule with no display
hvals <- genpolygon(x, binrule = "sturges")
print(hvals)

# Plot the histogram of x by using the user-specified number of classes
hvals <- genpolygon(x, binrule = "usr", nbins = 20, disp = TRUE)
print(hvals)

# Plot the histogram of the second feature in iris dataset 
# by using the Freedman-Diaconis (fd) rule
data(iris)
hvals <- genpolygon(iris[,2], binrule = "fd", disp = TRUE)
print(hvals)



