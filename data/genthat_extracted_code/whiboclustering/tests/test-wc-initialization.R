context('test-wc-initialization.r')

# ----- General Initialization function tests -----
# Parameter is missing
test_that('Initialization parameters are missing',
          {
            data <- iris[, 1:4]

            expect_error(wc_initialize())
            expect_error(wc_initialize(data = data))
            expect_error(wc_initialize(k = 3))
            expect_error(wc_initialize(initialization_type = 'Random'))
            expect_error(wc_initialize(data = data, k = 3))
            expect_error(wc_initialize(k = 3, initialization_type = 'Random'))

            #Wrong parameter
            expect_error(wc_initialize(data = data, k = 3, initialization_type = 'Uljez'))
            expect_error(wc_initialize(data = data, k = '3', initialization_type = 'Random'))
          })

# Result should be matrix
test_that('Result of Initialization should be data frame',
          {
            data <- iris[, 1:4]
            k <- 3

            #Test for every implemented type
            for(i in wc_init_types$Type)
            {
              centroids <- wc_initialize(data = data, k = k, initialization_type = i)

              #Class should be data.frame
              expect_true(class(centroids) == 'data.frame')

              #Number of rows should be k
              expect_true(nrow(centroids) == k)

              #Number of columns should be same as in data (plus one for WCCluster)
              expect_true(ncol(centroids) == (ncol(data) + 1))
            }
          })

# ----- Implementations of RC Initialization -----
# Missing parameters

test_that('Initialization parameters missing',
          {
            expect_error(wc_init_random())
            expect_error(wc_init_forgy())
            expect_error(wc_init_kmeansplusplus())
            expect_error(wc_init_kkz())
            expect_error(wc_init_pca())
            expect_error(wc_init_agnes())
            expect_error(wc_init_diana())
            expect_error(wc_init_ward())
            expect_error(wc_init_quantile())
            expect_error(wc_init_ccia())

            #Wrong parameters
            expect_error(wc_init_random(data = ''))
            expect_error(wc_init_forgy(data = ''))
            expect_error(wc_init_kmeansplusplus(data = ''))
            expect_error(wc_init_kkz(data = ''))
            expect_error(wc_init_pca(data = ''))
            expect_error(wc_init_agnes(data = ''))
            expect_error(wc_init_diana(data = ''))
            expect_error(wc_init_ward(data = ''))
            expect_error(wc_init_quantile(data = ''))
            expect_error(wc_init_ccia(data = ''))

            expect_error(wc_init_random(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_forgy(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_kmeansplusplus(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_kkz(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_pca(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_agnes(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_diana(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_ward(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_quantile(data = iris[, 1:4], k = '3'))
            expect_error(wc_init_ccia(data = iris[, 1:4], k = '3'))
          })

test_that('Random - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_random(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('Forgy - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_forgy(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('KMeans++ - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_kmeansplusplus(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('KKZ - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_kkz(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('PCA - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_pca(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('AGNES - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_agnes(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('DIANA - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_diana(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('Ward - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_ward(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('Quantile - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_quantile(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })

test_that('CCIA - Result should be data.frame with k rows',
          {
            data <- iris[, 1:4]
            k <- 3
            centroids <- wc_init_ccia(data = data, k = k)

            #Output
            expect_true(class(centroids) == 'data.frame')

            #Number of rows
            expect_true(nrow(centroids) == k)

            #Number of columns
            expect_true((ncol(centroids) - 1) == ncol(data))
          })
