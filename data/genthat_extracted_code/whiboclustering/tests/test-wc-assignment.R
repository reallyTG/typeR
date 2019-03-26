context("test-wc-assignment.r")

# ----- General Assignment function tests -----
# Parameter(s) is missing test
test_that('Assignment of data points to Cluster Representatives',
          {
            #Parameters are missing combinations
            expect_error(wc_assignment())
            expect_error(wc_assignment(data = iris[, 1:4]))
            expect_error(wc_assignment(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
            expect_error(wc_assignment(assignment_type = 'Euclidean'))
            expect_error(wc_assignment(data = iris[, 1:4], centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
            expect_error(wc_assignment(data = iris[, 1:4], assignment_type = 'Euclidean'))
            expect_error(wc_assignment(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random'), assignment_type = 'Euclidean'))

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assignment(data = iris[, 1:4], centroids = data[1:3, 1:3], assignment_type = 'Euclidean'))

            #Error if non-implemented assignment type is used
            expect_error(wc_assignment(data = iris[, 1:4], centroids = data[1:3, 1:4], assignment_type = 'Uljez'))
          })

# Result should be a vector of equal size as number of rows in data
test_that('Result of assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            #Checking every implemented assignment type
            for (i in wc_assign_types$Type) {
              set.seed(1989)
              assignments <- wc_assignment(data = data, centroids = centroids, assignment_type = i)

              expect_true(is.numeric(assignments))
              expect_true(length(assignments) == n_rows)

              #Data and centroids not compatible (not same number of columns)
              expect_error(wc_assignment(data = data, centroids = centroids[, 1:3], assignment_type = i))
            }
          })

# ----- Implementations of RC Measure distance and Assignments -----
# Missing parameters
test_that('Parameters missing for Euclidean assignment',
          {
            expect_error(wc_assign_euclidean())
            expect_error(wc_assign_euclidean(data = iris[, 1:4]))
            expect_error(wc_assign_euclidean(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_euclidean(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_euclidean(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Squared Euclidean assignment',
          {
            expect_error(wc_assign_squared_euclidean())
            expect_error(wc_assign_squared_euclidean(data = iris[, 1:4]))
            expect_error(wc_assign_squared_euclidean(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_squared_euclidean(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_squared_euclidean(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Manhattan assignment',
          {
            expect_error(wc_assign_manhattan())
            expect_error(wc_assign_manhattan(data = iris[, 1:4]))
            expect_error(wc_assign_manhattan(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_manhattan(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_manhattan(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Canberra assignment',
          {
            expect_error(wc_assign_canberra())
            expect_error(wc_assign_canberra(data = iris[, 1:4]))
            expect_error(wc_assign_canberra(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_canberra(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_canberra(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Cosine assignment',
          {
            expect_error(wc_assign_cosine())
            expect_error(wc_assign_cosine(data = iris[, 1:4]))
            expect_error(wc_assign_cosine(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_cosine(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_cosine(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Correlation assignment',
          {
            expect_error(wc_assign_correlation())
            expect_error(wc_assign_correlation(data = iris[, 1:4]))
            expect_error(wc_assign_correlation(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_correlation(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_correlation(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Sorensen assignment',
          {
            expect_error(wc_assign_sorensen())
            expect_error(wc_assign_sorensen(data = iris[, 1:4]))
            expect_error(wc_assign_sorensen(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_sorensen(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_sorensen(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

# test_that('Parameters missing for Soergel assignment',
#           {
#             expect_error(wc_assign_soergel())
#             expect_error(wc_assign_soergel(data = iris[, 1:4]))
#             expect_error(wc_assign_soergel(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#
#             #Wrong type of input
#             expect_error(wc_assign_soergel(data = iris[, 1:4], centroids = ''))
#             expect_error(wc_assign_soergel(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#           })

test_that('Parameters missing for Kulczynski assignment',
          {
            expect_error(wc_assign_kulczynski())
            expect_error(wc_assign_kulczynski(data = iris[, 1:4]))
            expect_error(wc_assign_kulczynski(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_kulczynski(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_kulczynski(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Lorentzian assignment',
          {
            expect_error(wc_assign_lorentzian())
            expect_error(wc_assign_lorentzian(data = iris[, 1:4]))
            expect_error(wc_assign_lorentzian(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_lorentzian(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_lorentzian(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Gower assignment',
          {
            expect_error(wc_assign_gower())
            expect_error(wc_assign_gower(data = iris[, 1:4]))
            expect_error(wc_assign_gower(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_gower(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_gower(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Intersection assignment',
          {
            expect_error(wc_assign_intersection())
            expect_error(wc_assign_intersection(data = iris[, 1:4]))
            expect_error(wc_assign_intersection(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_intersection(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_intersection(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

# test_that('Parameters missing for Czekanowski assignment',
#           {
#             expect_error(wc_assign_czekanowski())
#             expect_error(wc_assign_czekanowski(data = iris[, 1:4]))
#             expect_error(wc_assign_czekanowski(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#
#             #Wrong type of input
#             expect_error(wc_assign_czekanowski(data = iris[, 1:4], centroids = ''))
#             expect_error(wc_assign_czekanowski(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#           })
#
# test_that('Parameters missing for Motika assignment',
#           {
#             expect_error(wc_assign_motika())
#             expect_error(wc_assign_motika(data = iris[, 1:4]))
#             expect_error(wc_assign_motika(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#
#             #Wrong type of input
#             expect_error(wc_assign_motika(data = iris[, 1:4], centroids = ''))
#             expect_error(wc_assign_motika(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#           })
#
# test_that('Parameters missing for Ruzicka assignment',
#           {
#             expect_error(wc_assign_ruzicka())
#             expect_error(wc_assign_ruzicka(data = iris[, 1:4]))
#             expect_error(wc_assign_ruzicka(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#
#             #Wrong type of input
#             expect_error(wc_assign_ruzicka(data = iris[, 1:4], centroids = ''))
#             expect_error(wc_assign_ruzicka(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#           })

test_that('Parameters missing for Inner Product assignment',
          {
            expect_error(wc_assign_inner_product())
            expect_error(wc_assign_inner_product(data = iris[, 1:4]))
            expect_error(wc_assign_inner_product(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_inner_product(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_inner_product(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

# test_that('Parameters missing for Jaccard assignment',
#           {
#             expect_error(wc_assign_jaccard_numerical())
#             expect_error(wc_assign_jaccard_numerical(data = iris[, 1:4]))
#             expect_error(wc_assign_jaccard_numerical(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#
#             #Wrong type of input
#             expect_error(wc_assign_jaccard_numerical(data = iris[, 1:4], centroids = ''))
#             expect_error(wc_assign_jaccard_numerical(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#           })
#
# test_that('Parameters missing for Dice assignment',
#           {
#             expect_error(wc_assign_dice_numerical())
#             expect_error(wc_assign_dice_numerical(data = iris[, 1:4]))
#             expect_error(wc_assign_dice_numerical(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#
#             #Wrong type of input
#             expect_error(wc_assign_dice_numerical(data = iris[, 1:4], centroids = ''))
#             expect_error(wc_assign_dice_numerical(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
#           })

test_that('Parameters missing for Fidelity assignment',
          {
            expect_error(wc_assign_fidelity_numerical())
            expect_error(wc_assign_fidelity_numerical(data = iris[, 1:4]))
            expect_error(wc_assign_fidelity_numerical(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_fidelity_numerical(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_fidelity_numerical(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Bhattacharyya assignment',
          {
            expect_error(wc_assign_bhattacharyya_numerical())
            expect_error(wc_assign_bhattacharyya_numerical(data = iris[, 1:4]))
            expect_error(wc_assign_bhattacharyya_numerical(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_bhattacharyya_numerical(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_bhattacharyya_numerical(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Hellinger assignment',
          {
            expect_error(wc_assign_hellinger_numerical())
            expect_error(wc_assign_hellinger_numerical(data = iris[, 1:4]))
            expect_error(wc_assign_hellinger_numerical(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_hellinger_numerical(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_hellinger_numerical(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

test_that('Parameters missing for Whittaker assignment',
          {
            expect_error(wc_assign_whittaker())
            expect_error(wc_assign_whittaker(data = iris[, 1:4]))
            expect_error(wc_assign_whittaker(centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))

            #Wrong type of input
            expect_error(wc_assign_whittaker(data = iris[, 1:4], centroids = ''))
            expect_error(wc_assign_whittaker(data = '', centroids =  wc_initialize(data = data, k = 3, initialization_type = 'Random')))
          })

# Return type should be numerical vector with same length as number of rows in data set
# Check for compatibility of data and centroids
test_that('Result of Euclidean assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_euclidean(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_euclidean(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Squared Euclidean assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_squared_euclidean(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_squared_euclidean(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Manhattan assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_manhattan(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_manhattan(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Canberra assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_canberra(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_canberra(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Chebyshev assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_chebyshev(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_chebyshev(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Cosine assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_cosine(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_cosine(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Correlation assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_correlation(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_correlation(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Sorensen assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_sorensen(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_sorensen(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

# test_that('Result of Soergel assignment is vector of assignments with same number of elements as number of rows in data',
#           {
#             data <- iris[, 1:4]
#             centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
#             n_rows <- nrow(data)
#
#             set.seed(1989)
#             assignments <- wc_assign_soergel(data = data, centroids = centroids)
#
#             expect_true(is.numeric(assignments))
#             expect_true(length(assignments) == n_rows)
#
#             #Data and centroids not compatible (not same number of columns)
#             expect_error(wc_assign_soergel(data = iris[, 1:4], centroids = data[1:3, 1:3]))
#           })

test_that('Result of Kulczynski assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_kulczynski(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_kulczynski(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Lorentzian assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_lorentzian(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_lorentzian(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Gower assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_gower(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_gower(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Inersection assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_intersection(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_intersection(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

# test_that('Result of Czekanowski assignment is vector of assignments with same number of elements as number of rows in data',
#           {
#             data <- iris[, 1:4]
#             centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
#             n_rows <- nrow(data)
#
#             set.seed(1989)
#             assignments <- wc_assign_czekanowski(data = data, centroids = centroids)
#
#             expect_true(is.numeric(assignments))
#             expect_true(length(assignments) == n_rows)
#
#             #Data and centroids not compatible (not same number of columns)
#             expect_error(wc_assign_czekanowski(data = iris[, 1:4], centroids = data[1:3, 1:3]))
#           })
#
# test_that('Result of Motika assignment is vector of assignments with same number of elements as number of rows in data',
#           {
#             data <- iris[, 1:4]
#             centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
#             n_rows <- nrow(data)
#
#             set.seed(1989)
#             assignments <- wc_assign_motika(data = data, centroids = centroids)
#
#             expect_true(is.numeric(assignments))
#             expect_true(length(assignments) == n_rows)
#
#             #Data and centroids not compatible (not same number of columns)
#             expect_error(wc_assign_motika(data = iris[, 1:4], centroids = data[1:3, 1:3]))
#           })
#
# test_that('Result of Ruzicka assignment is vector of assignments with same number of elements as number of rows in data',
#           {
#             data <- iris[, 1:4]
#             centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
#             n_rows <- nrow(data)
#
#             set.seed(1989)
#             assignments <- wc_assign_ruzicka(data = data, centroids = centroids)
#
#             expect_true(is.numeric(assignments))
#             expect_true(length(assignments) == n_rows)
#
#             #Data and centroids not compatible (not same number of columns)
#             expect_error(wc_assign_ruzicka(data = iris[, 1:4], centroids = data[1:3, 1:3]))
#           })

test_that('Result of Tanimoto assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_tanimoto(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_tanimoto(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Inner Product assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_inner_product(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_inner_product(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

# test_that('Result of Jaccard assignment is vector of assignments with same number of elements as number of rows in data',
#           {
#             data <- iris[, 1:4]
#             centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
#             n_rows <- nrow(data)
#
#             set.seed(1989)
#             assignments <- wc_assign_jaccard_numerical(data = data, centroids = centroids)
#
#             expect_true(is.numeric(assignments))
#             expect_true(length(assignments) == n_rows)
#
#             #Data and centroids not compatible (not same number of columns)
#             expect_error(wc_assign_jaccard_numerical(data = iris[, 1:4], centroids = data[1:3, 1:3]))
#           })
#
# test_that('Result of Dice assignment is vector of assignments with same number of elements as number of rows in data',
#           {
#             data <- iris[, 1:4]
#             centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
#             n_rows <- nrow(data)
#
#             set.seed(1989)
#             assignments <- wc_assign_dice_numerical(data = data, centroids = centroids)
#
#             expect_true(is.numeric(assignments))
#             expect_true(length(assignments) == n_rows)
#
#             #Data and centroids not compatible (not same number of columns)
#             expect_error(wc_assign_dice_numerical(data = iris[, 1:4], centroids = data[1:3, 1:3]))
#           })

test_that('Result of Fidelity assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_fidelity_numerical(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_fidelity_numerical(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Bhattacharyya assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_bhattacharyya_numerical(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_bhattacharyya_numerical(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Hellinger assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_hellinger_numerical(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_hellinger_numerical(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })

test_that('Result of Whittaker assignment is vector of assignments with same number of elements as number of rows in data',
          {
            data <- iris[, 1:4]
            centroids <- wc_initialize(data = data, k = 3, initialization_type = 'Random')
            n_rows <- nrow(data)

            set.seed(1989)
            assignments <- wc_assign_whittaker(data = data, centroids = centroids)

            expect_true(is.numeric(assignments))
            expect_true(length(assignments) == n_rows)

            #Data and centroids not compatible (not same number of columns)
            expect_error(wc_assign_whittaker(data = iris[, 1:4], centroids = data[1:3, 1:3]))
          })
