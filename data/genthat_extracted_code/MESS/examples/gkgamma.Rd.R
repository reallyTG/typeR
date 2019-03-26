library(MESS)


### Name: gkgamma
### Title: Goodman-Kruskal's gamma statistic for a two-dimensional table
### Aliases: gkgamma
### Keywords: htest

### ** Examples


# Data from the Glostrup study comparing smoking to overall health in males
smoke <- matrix(c(16, 15, 13, 10, 1, 73, 75, 59, 81, 29, 6, 6, 7, 17, 3, 1, 0, 1, 3, 1), ncol=4)
colnames(smoke) <- c("VGood", "Good", "Fair", "Bad") # General health status
rownames(smoke) <- c("Never", "No more", "1-14", "15-24", "25+")  # Smoke amount
gkgamma(smoke)
chisq.test(smoke)




