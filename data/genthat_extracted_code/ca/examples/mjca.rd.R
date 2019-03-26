library(ca)


### Name: mjca
### Title: Multiple and joint correspondence analysis
### Aliases: mjca mjca.data.frame mjca.table mjca.array mjca.default
### Keywords: multivariate

### ** Examples
 
data("wg93")
mjca(wg93[,1:4])

# table input
data(UCBAdmissions)
mjca(UCBAdmissions)
## Not run: plot(mjca(UCBAdmissions))

### Different approaches to multiple correspondence analysis:
# Multiple correspondence analysis based on the indicator matrix:
## Not run: mjca(wg93[,1:4], lambda = "indicator")

# Multiple correspondence analysis based on the Burt matrix:
## Not run: mjca(wg93[,1:4], lambda = "Burt")

# "Adjusted" multiple correspondence analysis (default setting):
## Not run: mjca(wg93[,1:4], lambda = "adjusted")

# Joint correspondence analysis:
## Not run: mjca(wg93[,1:4], lambda = "JCA")


### Subset analysis and supplementary variables:
# Subset analysis:
## Not run: mjca(wg93[,1:4], subsetcat = (1:20)[-seq(3,18,5)])

# Supplementary variables:
## Not run: mjca(wg93, supcol = 5:7)

 


