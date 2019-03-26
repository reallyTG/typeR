# test geneticscale()

library(SimPhe)
context('Genetic Scale')

test_that('default',
          {
              expect_equal(genetic.scale(), c(1.0,-0.5, 1.0,-0.5, 1.0,-0.5,-0.5, 0.25))
              expect_equal(genetic.scale(0,0), c(1.0,-0.5, 1.0,-0.5, 1.0,-0.5,-0.5, 0.25))
          }
          )
## The following tests were created using
## for (i in 0:2) for (j in 0:2) cat(sprintf('expect_equal(geneticscale(%d, %d), c(%s))\n', i, j, paste(round(geneticscale(i,j), 2), collapse = ', ')))
## and some formatting on the output to make the columns line up
test_that('range tests',
          {
              expect_equal(genetic.scale(0, 1), c( 1, -0.5,  0,  0.5,  0,  0.5,  0,   -0.25))
              expect_equal(genetic.scale(0, 2), c( 1, -0.5, -1, -0.5, -1, -0.5,  0.5,  0.25))
              expect_equal(genetic.scale(1, 0), c( 0,  0.5,  1, -0.5,  0,  0,    0.5, -0.25))
              expect_equal(genetic.scale(1, 1), c( 0,  0.5,  0,  0.5,  0,  0,    0,    0.25))
              expect_equal(genetic.scale(1, 2), c( 0,  0.5, -1, -0.5,  0,  0,   -0.5, -0.25))
              expect_equal(genetic.scale(2, 0), c(-1, -0.5,  1, -0.5, -1,  0.5, -0.5,  0.25))
              expect_equal(genetic.scale(2, 1), c(-1, -0.5,  0,  0.5,  0, -0.5,  0,   -0.25))
              expect_equal(genetic.scale(2, 2), c(-1, -0.5, -1, -0.5,  1,  0.5,  0.5,  0.25))
          }
          )

test_that('input range',
          {
              expect_equal(genetic.scale( 0, 3), c( 1, -0.5, -1, -0.5, -1, -0.5,  0.5,  0.25))
              expect_equal(genetic.scale( 0,-1), c(1.0,-0.5, 1.0,-0.5, 1.0,-0.5,-0.5, 0.25))
              expect_equal(genetic.scale( 3, 0), c(-1, -0.5, 1, -0.5, -1, 0.5, -0.5, 0.25))
              expect_equal(genetic.scale(-1, 0), c(1.0,-0.5, 1.0,-0.5, 1.0,-0.5,-0.5, 0.25))
          }
          )

test_that('fractional input',
          {
              expect_equal(genetic.scale(0.5, 0  ), c( 0,  0.5,  1, -0.5,  0,  0,    0.5, -0.25))
              expect_equal(genetic.scale(0  , 0.5), c( 1, -0.5,  0,  0.5,  0,  0.5,  0,   -0.25))
          }
          )


