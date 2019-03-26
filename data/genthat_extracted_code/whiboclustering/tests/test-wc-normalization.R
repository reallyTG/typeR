context('test-wc-normalization.r')

# ----- General Normalization function tests -----
# Parameter is missing
test_that('Normalization function parameter is missing',
          {
            expect_error(wc_normalize())
            expect_error(wc_normalize(data = iris[, 1:4]))
            expect_error(wc_normalize(normalization_type = 'No'))

            #If non implemented normalization type is used throw error
            expect_error(wc_normalize(data = iris[, 1:4], normalization_type = 'Uljez'))
          })

# Result should be list with data and model
test_that('Result of normalization is data.frame or data.matrix',
          {
            data <- iris[, 1:4]
            #Testing every implemented normalization technique
            for (i in wc_norm_types$Type) {
              norm_data <- wc_normalize(data = data, normalization_type = i)

              # Format of the result
              expect_true(names(norm_data)[1] == 'data')
              expect_true(names(norm_data)[2] == 'model')

              # Data should be matrix
              expect_true(class(norm_data$data) == 'matrix')
            }
          })

# ----- Implementations of RC Normalization -----
# Missing parameters
test_that('Normalization parameter missing',
          {
            expect_error(wc_norm_no())
            expect_error(wc_norm_z())
            expect_error(wc_norm_l2())
            expect_error(wc_norm_l1())
            expect_error(wc_norm_linf())
            expect_error(wc_norm_max_min())
            expect_error(wc_norm_mean())
            expect_error(wc_norm_log())
            expect_error(wc_norm_non_monotonic())
            expect_error(wc_norm_comprehensive())
            expect_error(wc_norm_decimal_scaling())
            expect_error(wc_norm_sigmoid())
            expect_error(wc_norm_softmax())

            #Wrong type of data
            expect_error(wc_norm_no(data = ''))
            expect_error(wc_norm_z(data = ''))
            expect_error(wc_norm_l2(data = ''))
            expect_error(wc_norm_l1(data = ''))
            expect_error(wc_norm_linf(data = ''))
            expect_error(wc_norm_max_min(data = ''))
            expect_error(wc_norm_mean(data = ''))
            expect_error(wc_norm_log(data = ''))
            expect_error(wc_norm_non_monotonic(data = ''))
            expect_error(wc_norm_comprehensive(data = ''))
            expect_error(wc_norm_decimal_scaling(data = ''))
            expect_error(wc_norm_sigmoid(data = ''))
            expect_error(wc_norm_softmax(data = ''))
          })

test_that('No normalization and original data should be the same',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_no(data)$data

            expect_true(sum(data != norm_data) == 0)
          })

test_that('Z transformation should result in zero mean and one standard deviation',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_z(data)$data

            #Well... close to zero
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(mean(x) > -0.0000001 || mean(x) < 0.0000001) })
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(sd(x) > 0.9999999 || mean(x) < 1.0000001) })
          })

test_that('L2 normalization should sum to one if elements are squared',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_l2(data)$data

            #Well... close to zero
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(sum(x^2) > 0.9999999 || sum(x^2) < 1.00000001) })
          })

test_that('L1 normalization should sum to one',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_l1(data)$data

            #Well... close to one
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(sum(x) > 0.9999999 || sum(x) < 1.00000001) })
          })

test_that('Linf normalization should have max equal to 1',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_linf(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(max(x) == 1) })
          })

test_that('Max-Min normalization should result in min = 0 and max = 1',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_max_min(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(min(x) == 0) })
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(max(x) == 1) })
          })

test_that('Mean normalization should result in mean = 0',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_mean(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(mean(x) > -0.0000001 || mean(x) < 0.0000001) })
          })

test_that('Log transformation result in same mean for every column',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_log(data)$data

            #Close to zero...
            expect_true(sd(apply(X = norm_data, MARGIN = 2, function(x) { mean(x) })) < 0.0000001)
          })

test_that('Log transformation will fail is negative value is present',
          {
            data <- as.matrix(iris[, 1:4])
            data[1, 1] <- -1

            expect_error(wc_norm_log(data))
          })

test_that('Non-monotic normalization will create max = 1',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_non_monotonic(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(max(x) == 1) })
          })

test_that('Comprehensive will make min = 0',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_comprehensive(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(min(x) == 0) })
          })

test_that('Decimal Scaling will be greater or equal than 0',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_decimal_scaling(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(min(x) > 0) })
          })

test_that('Sigmoid normalization will always be between -1 and 1',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_sigmoid(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(min(x) > -1) })
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(max(x) < 1) })
          })

test_that('Softmax normalization will always be between 0 and 1',
          {
            data <- as.matrix(iris[, 1:4])
            norm_data <- wc_norm_softmax(data)$data

            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(min(x) > 0) })
            apply(X = norm_data, MARGIN = 2, FUN = function(x) { expect_true(max(x) < 1) })
          })
