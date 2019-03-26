context('test-whibo-clustering.R')

# ----- WHIBO CLUSTERING -----
test_that('WhiBo Cluster Design',
          {
            data <- iris[, 1:4]
            k <- 3

            model <- whibo_clustering(data = data, k = k)

            #Number of centroids is same as k
            expect_equal(nrow(model$centroids), k)

            #Length of assignment vector should be the same as number of rows in data
            expect_equal(length(model$assignments), nrow(data))
          })
