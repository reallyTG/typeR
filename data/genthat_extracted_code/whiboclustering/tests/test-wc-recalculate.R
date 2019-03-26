context('test-wc-recalculate.R')

# ----- General Initialization function tests -----
# Parameter is missing
test_that('Recalculate parameter is missing',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            expect_error(wc_recalculate())
            expect_error(wc_recalculate(data = data))
            expect_error(wc_recalculate(assignment = assignments))
            expect_error(wc_recalculate(recalculate_type = 'Mean'))
            expect_error(wc_recalculate(data = data, assignment = assignments))
            expect_error(wc_recalculate(data = data, recalculate_type = 'Mean'))
            expect_error(wc_recalculate(assignment = assignments, recalculate_type = 'Mean'))
          })

test_that('Result of the recalculate should be data.frame',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')
            assignment_type = 'Euclidean'

            #Check every implementation of Update Representative
            for(i in wc_recalculate_types$Type)
            {
              set.seed(1989)

              new_centroids <- wc_recalculate(data = data, assignment = assignments, recalculate_type = i, assignment_type = assignment_type)

              #Result is of type data.frame
              expect_true(class(new_centroids) == 'data.frame')

              #Number of rows should be the same in old centroids and new centroids
              expect_true(nrow(centroids) == nrow(new_centroids))

              #Number of columns should be the same in old centroids and new centroids
              expect_true(ncol(centroids) == ncol(new_centroids))
            }
          })

# ----- Implementations of RC Recalculate -----
# Missing parameters
test_that('Parameter of implementation is missing',
          {
            expect_error(wc_recalc_mean())
            expect_error(wc_recalc_median())
            expect_error(wc_recalc_trimmed_mean())
            expect_error(wc_recalc_geometric_mean())
            expect_error(wc_recalc_harmonic_mean())
            expect_error(wc_recalc_quadratic_mean())
            expect_error(wc_recalc_trimean())
            expect_error(wc_recalc_midhinge())
            expect_error(wc_recalc_midrange())
            expect_error(wc_recalc_online_mean())
            expect_error(wc_recalc_online_median())
            expect_error(wc_recalc_online_trimmed_mean())
            expect_error(wc_recalc_online_geometric_mean())
            expect_error(wc_recalc_online_harmonic_mean())
            expect_error(wc_recalc_online_quadratic_mean())
            expect_error(wc_recalc_online_trimean())
            expect_error(wc_recalc_online_midhinge())
            expect_error(wc_recalc_online_midrange())

            #Wrong data type
            expect_error(wc_recalc_mean(data = ''))
            expect_error(wc_recalc_median(data = ''))
            expect_error(wc_recalc_trimmed_mean(data = ''))
            expect_error(wc_recalc_geometric_mean(data = ''))
            expect_error(wc_recalc_harmonic_mean(data = ''))
            expect_error(wc_recalc_quadratic_mean(data = ''))
            expect_error(wc_recalc_trimean(data = ''))
            expect_error(wc_recalc_midhinge(data = ''))
            expect_error(wc_recalc_midrange(data = ''))
            expect_error(wc_recalc_online_mean(data = ''))
            expect_error(wc_recalc_online_median(data = ''))
            expect_error(wc_recalc_online_trimmed_mean(data = ''))
            expect_error(wc_recalc_online_geometric_mean(data = ''))
            expect_error(wc_recalc_online_harmonic_mean(data = ''))
            expect_error(wc_recalc_online_quadratic_mean(data = ''))
            expect_error(wc_recalc_online_trimean(data = ''))
            expect_error(wc_recalc_online_midhinge(data = ''))
            expect_error(wc_recalc_online_midrange(data = ''))

            expect_error(wc_recalc_mean(assignment = ''))
            expect_error(wc_recalc_median(assignment = ''))
            expect_error(wc_recalc_trimmed_mean(assignment = ''))
            expect_error(wc_recalc_geometric_mean(assignment = ''))
            expect_error(wc_recalc_harmonic_mean(assignment = ''))
            expect_error(wc_recalc_quadratic_mean(assignment = ''))
            expect_error(wc_recalc_trimean(assignment = ''))
            expect_error(wc_recalc_midhinge(assignment = ''))
            expect_error(wc_recalc_midrange(assignment = ''))
            expect_error(wc_recalc_online_mean(assignment = ''))
            expect_error(wc_recalc_online_median(assignment = ''))
            expect_error(wc_recalc_online_trimmed_mean(assignment = ''))
            expect_error(wc_recalc_online_geometric_mean(assignment = ''))
            expect_error(wc_recalc_online_harmonic_mean(assignment = ''))
            expect_error(wc_recalc_online_quadratic_mean(assignment = ''))
            expect_error(wc_recalc_online_trimean(assignment = ''))
            expect_error(wc_recalc_online_midhinge(assignment = ''))
            expect_error(wc_recalc_online_midrange(assignment = ''))

            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            expect_error(wc_recalc_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_median(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_trimmed_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_geometric_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_harmonic_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_quadratic_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_trimean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_midhinge(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_midrange(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_median(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_trimmed_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_geometric_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_harmonic_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_quadratic_mean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_trimean(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_midhinge(data = data, assignment = assignments[1:100]))
            expect_error(wc_recalc_online_midrange(data = data, assignment = assignments[1:100]))
          })

test_that('Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_mean(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Median Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_median(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Trimmed Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_trimmed_mean(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Geometric Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_geometric_mean(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Harmonic Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_harmonic_mean(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Quadratic Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_quadratic_mean(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Trimean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_trimean(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Midhinge Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_midhinge(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Midrange Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_midrange(data = data, assignment = assignments)

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_mean(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Median Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_median(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Trimmed Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_trimmed_mean(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Geometric Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_geometric_mean(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Harmonic Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_harmonic_mean(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Quadratic Mean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_quadratic_mean(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Trimean Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_trimean(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Midhinge Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_midhinge(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })

test_that('Online Midrange Recalculate',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = 'Euclidean')

            set.seed(1989)

            new_centroids <- wc_recalc_online_midrange(data = data, assignment = assignments, assignment_type = 'Euclidean')

            expect_true(nrow(new_centroids) == nrow(centroids))
            expect_true(ncol(new_centroids) == ncol(centroids))
          })
