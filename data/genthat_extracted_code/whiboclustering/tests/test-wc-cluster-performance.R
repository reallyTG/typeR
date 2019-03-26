context('test-wc-cluster-performance.R')

# ----- General Cluster Performance function tests -----
test_that('Total Sum of squares',
          {
            data <- iris[, 1:4]

            result <- wc_eval_total_sum_of_squares(data = data)

            #Class should be numeric and only one value should be returned
            expect_true(class(result) == 'numeric')
            expect_true(length(result) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_total_sum_of_squares())
            expect_error(wc_eval_total_sum_of_squares(data = ''))
          })

test_that('Within Sum of Squares',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_within_sum_of_squares(data = data, centroids = centroids, assignment = assignmnets)

            #Class should be numeric and k values should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == k)

            #Error if wrong parameter
            expect_error(wc_eval_within_sum_of_squares())
            expect_error(wc_eval_within_sum_of_squares(data = ''))
            expect_error(wc_eval_within_sum_of_squares(centroids = ''))
            expect_error(wc_eval_within_sum_of_squares(assignment = ''))
            expect_error(wc_eval_within_sum_of_squares(data = data))
            expect_error(wc_eval_within_sum_of_squares(centroids = centroids))
            expect_error(wc_eval_within_sum_of_squares(assignment = assignmnets))
            expect_error(wc_eval_within_sum_of_squares(data = data, centroids = centroids))
            expect_error(wc_eval_within_sum_of_squares(data = data, assignment = assignmnets))
            expect_error(wc_eval_within_sum_of_squares(centroids = centroids, assignment = assignmnets))
          })

test_that('Between sum of squares',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_between_sum_of_squares(data = data, centroids = centroids, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_between_sum_of_squares())
            expect_error(wc_eval_between_sum_of_squares(data = ''))
            expect_error(wc_eval_between_sum_of_squares(centroids = ''))
            expect_error(wc_eval_between_sum_of_squares(assignment = ''))
            expect_error(wc_eval_between_sum_of_squares(data = data))
            expect_error(wc_eval_between_sum_of_squares(centroids = centroids))
            expect_error(wc_eval_between_sum_of_squares(assignment = assignmnets))
            expect_error(wc_eval_between_sum_of_squares(data = data, centroids = centroids))
            expect_error(wc_eval_between_sum_of_squares(data = data, assignment = assignmnets))
            expect_error(wc_eval_between_sum_of_squares(centroids = centroids, assignment = assignmnets))
          })

test_that('Ball-Hall index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_ball_hall(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_ball_hall())
            expect_error(wc_eval_ball_hall(data = ''))
            expect_error(wc_eval_ball_hall(assignment = ''))
            expect_error(wc_eval_ball_hall(data = data))
            expect_error(wc_eval_ball_hall(assignment = assignmnets))
          })

test_that('Banfeld-Raftery index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_banfeld_raftery(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_banfeld_raftery())
            expect_error(wc_eval_banfeld_raftery(data = ''))
            expect_error(wc_eval_banfeld_raftery(assignment = ''))
            expect_error(wc_eval_banfeld_raftery(data = data))
            expect_error(wc_eval_banfeld_raftery(assignment = assignmnets))
          })

test_that('C index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_c_index(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_c_index())
            expect_error(wc_eval_c_index(data = ''))
            expect_error(wc_eval_c_index(assignment = ''))
            expect_error(wc_eval_c_index(data = data))
            expect_error(wc_eval_c_index(assignment = assignmnets))
          })

test_that('Calinski-Harabasz index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_calinski_harabasz(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_calinski_harabasz())
            expect_error(wc_eval_calinski_harabasz(data = ''))
            expect_error(wc_eval_calinski_harabasz(assignment = ''))
            expect_error(wc_eval_calinski_harabasz(data = data))
            expect_error(wc_eval_calinski_harabasz(assignment = assignmnets))
          })

test_that('Davies-Bouldin index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_davies_bouldin(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_davies_bouldin())
            expect_error(wc_eval_davies_bouldin(data = ''))
            expect_error(wc_eval_davies_bouldin(assignment = ''))
            expect_error(wc_eval_davies_bouldin(data = data))
            expect_error(wc_eval_davies_bouldin(assignment = assignmnets))
          })

test_that('Det ratio',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_det_ratio(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_det_ratio())
            expect_error(wc_eval_det_ratio(data = ''))
            expect_error(wc_eval_det_ratio(assignment = ''))
            expect_error(wc_eval_det_ratio(data = data))
            expect_error(wc_eval_det_ratio(assignment = assignmnets))
          })

test_that('Dunn index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_dunn(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_dunn())
            expect_error(wc_eval_dunn(data = ''))
            expect_error(wc_eval_dunn(assignment = ''))
            expect_error(wc_eval_dunn(data = data))
            expect_error(wc_eval_dunn(assignment = assignmnets))
          })

test_that('Gamma index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_gamma(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_gamma())
            expect_error(wc_eval_gamma(data = ''))
            expect_error(wc_eval_gamma(assignment = ''))
            expect_error(wc_eval_gamma(data = data))
            expect_error(wc_eval_gamma(assignment = assignmnets))
          })

test_that('G+ index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_g_plus(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_g_plus())
            expect_error(wc_eval_g_plus(data = ''))
            expect_error(wc_eval_g_plus(assignment = ''))
            expect_error(wc_eval_g_plus(data = data))
            expect_error(wc_eval_g_plus(assignment = assignmnets))
          })

test_that('Silhouette score',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_silhouette(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_silhouette())
            expect_error(wc_eval_silhouette(data = ''))
            expect_error(wc_eval_silhouette(assignment = ''))
            expect_error(wc_eval_silhouette(data = data))
            expect_error(wc_eval_silhouette(assignment = assignmnets))
          })

test_that('Xie-Beni index',
          {
            k <- 3
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = k, initialization_type = 'Random')
            assignmnets <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            results <- wc_eval_xie_beni(data = data, assignment = assignmnets)

            #Class should be numeric and only one value should be returned
            expect_true(class(results) == 'numeric')
            expect_true(length(results) == 1)

            #Error if wrong parameter
            expect_error(wc_eval_xie_beni())
            expect_error(wc_eval_xie_beni(data = ''))
            expect_error(wc_eval_xie_beni(assignment = ''))
            expect_error(wc_eval_xie_beni(data = data))
            expect_error(wc_eval_xie_beni(assignment = assignmnets))
          })
