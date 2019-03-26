context('Permutation test:')

test_that('Error handling',
          {
            expect_error(
              test_RET(xExp = rnorm(10),
                       xRef = rnorm(10),
                       xPla = rnorm(10),
                       Delta = -1,
                       n_perm = 100,
                       distribution = "nonparametric"),
              "'Delta' must be numeric and positive."
            )
            expect_error(
              test_RET(xExp = c("a", "a"),
                       xRef = rnorm(10),
                       xPla = rnorm(10),
                       Delta = 0.8,
                       n_perm = 100,
                       distribution = "nonparametric"),
              "Data must be numeric."
            )
            expect_error(
              test_RET(xExp = rnorm(10),
                       xRef = rnorm(10),
                       xPla = rnorm(10),
                       Delta = 0.8,
                       n_perm = 0,
                       distribution = "nonparametric"),
              "Number of permutations \'n_perm\' must be a natural number."
            )
          }
) # end of test_that



#
#
# context('Permutation test: simulate_test_RET_permutation')
#
# test_that('Error handling',
#           {
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 30, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 50,
#                 nPermutations = 50,
#                 Delta = -1,
#                 sig.level = 0.025),
#               "Margin 'Delta' must be postive."
#             )
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 30, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 50,
#                 nPermutations = 50,
#                 Delta = 0.7,
#                 sig.level = 0),
#               "\'sig.level\' must be postive."
#             )
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 30, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 1,
#                 nPermutations = 50,
#                 Delta = 0.7,
#                 sig.level = 0.05),
#               "Number of simulations \'nSimulations\' must be a natural number and at least 2."
#             )
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 30, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 10,
#                 nPermutations = 1,
#                 Delta = 0.7,
#                 sig.level = 0.05),
#               "Number of permutations \'nPermutations\' must be a natural number and at least 3."
#             )
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 30, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 10,
#                 nPermutations = 10,
#                 Delta = 0.7,
#                 sig.level = 0.05,
#                 competitor = 1),
#               "'competitor' must be TRUE or FALSE."
#             )
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 30, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 10,
#                 nPermutations = 10,
#                 Delta = c(0.7, 0.8),
#                 sig.level = 0.05,
#                 competitor = TRUE),
#               "Input parameters 'nSimulations', 'nPermutations', 'Delta', 'sig.level', and 'competitor' must have length 1."
#             )
#             expect_error(
#               simulate_test_RET_permutation(
#                 parameterExp = list(n = 1, mu = 7.56, size = 1),
#                 distExp = 'rnbinom',
#                 parameterRef = list(n = 30, mu = 5.1, size = 1),
#                 distRef = 'rnbinom',
#                 parameterPla = list(n = 30, mu = 17.4, size = 1),
#                 distPla = 'rnbinom',
#                 nSimulations = 10,
#                 nPermutations = 10,
#                 Delta = 0.7,
#                 sig.level = 0.05,
#                 competitor = TRUE),
#               "Each group must have at least two observations."
#             )
#           }
# ) # end of test_that
#
