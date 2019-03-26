library(clusterCrit)


### Name: bestCriterion
### Title: Best clustering index
### Aliases: bestCriterion

### ** Examples

# Create some spheric data around three distinct centers
x <- rbind(matrix(rnorm(100, mean = 0, sd = 0.5), ncol = 2),
           matrix(rnorm(100, mean = 2, sd = 0.5), ncol = 2),
           matrix(rnorm(100, mean = 4, sd = 0.5), ncol = 2))
vals <- vector()
for (k in 2:6) {
    # Perform the kmeans algorithm
    cl <- kmeans(x, k)
    # Compute the Calinski_Harabasz index
    vals <- c(vals,as.numeric(intCriteria(x,cl$cluster,"Calinski_Harabasz")))
}
idx <- bestCriterion(vals,"Calinski_Harabasz")
cat("Best index value is",vals[idx],"\n")



