library(clues)


### Name: clustering
### Title: Data Clustering (After Data Shrinking)
### Aliases: clustering
### Keywords: cluster

### ** Examples

    # Maronna data set
    data(Maronna)
    # data matrix
    maronna <- Maronna$maronna

    tt <- shrinking(maronna, K = 50, itmax = 20)
    tt2 <- clustering(tt)

    # Plot of disimilarities between the sorted consecutive data points
    #     versus the sorted consecutive data points
    # This plot can be used to assess the estimated number of clusters
    db <- tt2$db
    point <- tt2$point
    n <- length(point)
    plot(1:(n - 1), db, type = "l",
        xlab = "sorted consecutive data points", 
        ylab = "disimilarities between the sorted consecutive data points", 
        xlim = c(0, n), axes = FALSE)
    box()
    axis(side = 2)
    axis(side = 1, at = c(0, 1:(n - 1)), labels = point)




