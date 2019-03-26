context("Testing print.nphtest function")


##
## test for correct output of npStochin
ones <- c(rep(1, 15), rep(0, 3))
zeros <- c(rep(0, 14), rep(1, 5))

res <- npStochinUnpaired(ones, zeros)
test_that("test for Stochin estimate", {
          expect_output(print.nphtest(res),
                        "estimated value of SI:")
          expect_output(print.nphtest(res),
                        "as threshold probability: [01]\\.?[0-9]* is greater than theta: [01]\\.?[0-9]*")
          expect_output(print.nphtest(res),
                        "alpha: 0.05")
          expect_output(print.nphtest(res),
                        "typeII: 0.5")
          expect_output(print.nphtest(res),
                        "max error prob of MC:")
          })

##
## TODO:
##

## test for non-stochin parameter

## test for valid and invalid theta

## test for small-sample note
