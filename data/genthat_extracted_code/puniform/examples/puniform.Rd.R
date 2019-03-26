library(puniform)


### Name: puniform
### Title: p-uniform
### Aliases: puniform

### ** Examples

### Load data from meta-analysis by McCall and Carriger (1993)
data(data.mccall93)

### Apply p-uniform method
puniform(ri = data.mccall93$ri, ni = data.mccall93$ni, alpha = .05, side = "right", 
method = "LNP", plot = TRUE)

### Generate example data for one-sample means design
set.seed(123)
ni <- 100
sdi <- 1
mi <- rnorm(8, mean = 0.2, sd = sdi/sqrt(ni))
tobs <- mi/(sdi/sqrt(ni))

### Apply p-uniform method based on sample means
puniform(mi = mi, ni = ni, sdi = sdi, alpha = 0.05, side = "right", method = "P", plot = FALSE)

### Apply p-uniform method based on t-values
puniform(ni = ni, tobs = tobs, alpha = 0.05, side = "right", method = "P", plot = FALSE)




