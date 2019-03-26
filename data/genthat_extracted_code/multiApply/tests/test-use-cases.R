context("Use cases")

test_that("in1: 1 val; targ. dims: 0; out1: 0 val", {
  f <- function(x) NULL
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(logical(0), dim = c(0, 1)))
  )
  f <- function(x) numeric(0)
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(logical(0), dim = c(0, 1)))
  )
})

test_that("in1: 1 val; targ. dims: 0; out1: 0 val", {
  f <- function(x) NULL
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(logical(0)))
  )
  f <- function(x) numeric(0)
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(logical(0)))
  )
})

test_that("in1: 1 val; targ. dims: 0; out1: 1 val", {
  expect_equal(
    Apply(1, NULL, mean), 
    list(output1 = array(1))
  )
})

test_that("in1: 1 val; targ. dims: 1; out1: 1 val", {
  expect_equal(
    Apply(1, 1, mean), 
    list(output1 = 1)
  )
})

test_that("in1: 1 val; targ. dims: 0; out1: 3 val", {
  f <- function(x) x:(x + 2)
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(1:3, dim = c(3, 1)))
  )
})

test_that("in1: 1 val; targ. dims: 1; out1: 3 val", {
  f <- function(x) x:(x + 2)
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(1:3))
  )
})

test_that("in1: 1 val; targ. dims: 0; out1: 1 dim", {
  # unnamed output dim
  f <- function(x) array(x:(x + 2))
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(1:3, dim = c(3, 1)))
  )
  # named output dim
  f <- function(x) array(x:(x + 2), dim = c(time = 3))
  expect_equal(
    Apply(1, NULL, f),
    list(output1 = array(1:3, dim = c(time = 3, 1)))
  )
})

test_that("in1: 1 val; targ. dims: 1; out1: 1 dim", {
  # unnamed output dim
  f <- function(x) array(x:(x + 2))
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(1:3))
  )
  # named output dim
  f <- function(x) array(x:(x + 2), dim = c(time = 3))
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(1:3, dim = c(time = 3)))
  )
})

test_that("in1: 1 val; targ. dims: 0; out1: 2 dim", {
  # unnamed output dims
  f <- function(x) array(x:(x + 2), dim = c(3, 4))
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(1:3, dim = c(3, 4, 1)))
  )
  # named output dim 1
  f <- function(x) array(x:(x + 2), dim = c(time = 3, 4))
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(1:3, dim = c(time = 3, 4, 1)))
  )
  # named output dim 2
  f <- function(x) array(x:(x + 2), dim = c(3, region = 4))
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(1:3, dim = c(3, region = 4, 1)))
  )
  # named output dims
  f <- function(x) array(x:(x + 2), dim = c(time = 3, region = 4))
  expect_equal(
    Apply(1, NULL, f), 
    list(output1 = array(1:3, dim = c(time = 3, region = 4, 1)))
  )
})

test_that("in1: 1 val; targ. dims: 1; out1: 2 dim", {
  # unnamed output dims
  f <- function(x) array(x:(x + 2), dim = c(3, 4))
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(1:3, dim = c(3, 4)))
  )
  # named output dims
  f <- function(x) array(x:(x + 2), dim = c(time = 3, region = 4))
  expect_equal(
    Apply(1, 1, f), 
    list(output1 = array(1:3, dim = c(time = 3, region = 4)))
  )
})

test_that("in1: 1 val; targ. dims: 0; out1: 1 val; out 2: 1 val", {
  # unnamed outputs
  f <- function(x) list(mean(x), mean(x) + 1)
  expect_equal(
    Apply(1, NULL, f),
    list(output1 = array(1),
         output2 = array(2))
  )
  # named outputs
  f <- function(x) list(a = mean(x), b = mean(x) + 1)
  expect_equal(
    Apply(1, NULL, f),
    list(a = array(1),
         b = array(2))
  )
})

test_that("in1: 1 val; targ. dims: 1; out1: 3 val; out 2: 2 dim", {
  f <- function(x) list(a = x:(x + 2), array(x:(x + 2), dim = c(3, region = 4)))
  expect_equal(
    Apply(1, 1, f),
    list(a = array(1:3),
         output2 = array(1:3, dim = c(3, region = 4)))
  )
})

test_that("in1: 1 dim; targ. dims: 0; out1: 0 val", {
  # unnamed dim
  # unnamed output
  f <- function(x) NULL
  expect_equal(
    Apply(array(1:10), NULL, f), 
    list(output1 = array(logical(0), dim = c(0, 10)))
  )
  # named dim
  # named output
  f <- function(x) list(out1 = NULL)
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), NULL, f), 
    list(out1 = array(logical(0), dim = c(0, a = 10)))
  )
})

test_that("in1: 1 dim; targ. dims: 1; out1: 0 val", {
  # unnamed dim
  # unnamed output
  f <- function(x) NULL
  expect_equal(
    Apply(array(1:10), 1, f), 
    list(output1 = array(logical(0)))
  )
  # named dim
  # named output
  f <- function(x) list(out1 = NULL)
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 1, f), 
    list(out1 = array(logical(0), dim = c(0)))
  )
  # named target dim
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 'a', f), 
    list(out1 = array(logical(0), dim = c(0)))
  )
})

test_that("in1: 1 dim; targ. dims: 0; out1: 1 val", {
  # unnamed dim
  # unnamed output
  expect_equal(
    Apply(array(1:10), NULL, mean), 
    list(output1 = array(1:10))
  )
  # named dim
  # named output
  f <- function(x) list(out1 = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), NULL, f), 
    list(out1 = array(1:10, dim = c(a = 10)))
  )
})

test_that("in1: 1 dim; targ. dims: 1; out1: 1 val", {
  # unnamed dim
  # unnamed output
  expect_equal(
    Apply(array(1:10), 1, mean), 
    list(output1 = 5.5)
  )
  # named dim
  # named output
  f <- function(x) list(out1 = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 1, f), 
    list(out1 = 5.5)
  )
  # named target dim
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 'a', f), 
    list(out1 = 5.5)
  )
})

test_that("in1: 1 dim; targ. dims: 0; out1: 3 vals", {
  # unnamed dim
  # unnamed output
  f <- function(x) x:(x + 2)
  expect_equal(
    Apply(array(1:10), NULL, f), 
    list(output1 = array(sapply(1:10, function(x) x:(x + 2)), dim = c(3, 10)))
  )
  # named dim
  # named output
  f <- function(x) list(out1 = x:(x + 2))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), NULL, f), 
    list(out1 = array(sapply(1:10, function(x) x:(x + 2)), dim = c(3, a = 10)))
  )
})

test_that("in1: 1 dim; targ. dims: 1; out1: 3 vals", {
  # unnamed dim
  # unnamed output
  f <- function(x) x[1]:(x[1] + 2)
  expect_equal(
    Apply(array(1:10), 1, f), 
    list(output1 = array(1:3))
  )
  # named dim
  # named output
  f <- function(x) list(out1 = x[1]:(x[1] + 2))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 1, f), 
    list(out1 = array(1:3))
  )
  # named target dim
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 'a', f), 
    list(out1 = array(1:3))
  )
})

test_that("in1: 1 dim; targ. dims: 0; out1: 1 dim", {
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) array(x:(x + 2))
  expect_equal(
    Apply(array(1:10), NULL, f), 
    list(output1 = array(sapply(1:10, function(x) x:(x + 2)), dim = c(3, 10)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(out1 = array(x:(x + 2), dim = c(b = 3)))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), NULL, f), 
    list(out1 = array(sapply(1:10, function(x) x:(x + 2)), dim = c(b = 3, a = 10)))
  )
})

test_that("in1: 1 dim; targ. dims: 1; out1: 1 dim", {
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) array(x[1]:(x[1] + 2))
  expect_equal(
    Apply(array(1:10), 1, f), 
    list(output1 = array(1:3))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(out1 = array(x[1]:(x[1] + 2), dim = c(b = 3)))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 1, f), 
    list(out1 = array(1:3, dim = c(b = 3)))
  )
  # named target dim
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 'a', f), 
    list(out1 = array(1:3, dim = c(b = 3)))
  )
})

test_that("in1: 1 dim; targ. dims: 0; out1: 2 dims", {
  # unnamed input dim
  # unnamed output
  # unnamed output dims
  f <- function(x) array(x:(x + 2), dim = c(3, 4))
  expect_equal(
    Apply(array(1:10), NULL, f), 
    list(output1 = array(sapply(1:10, function(x) rep(x:(x + 2), 4)), dim = c(3, 4, 10)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(out1 = array(x:(x + 2), dim = c(b = 3, c = 4)))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), NULL, f), 
    list(out1 = array(sapply(1:10, function(x) rep(x:(x + 2), 4)), dim = c(b = 3, c = 4, a = 10)))
  )
})

test_that("in1: 1 dim; targ. dims: 1; out1: 2 dims", {
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) array(x[1]:(x[1] + 2), dim = c(3, 4))
  expect_equal(
    Apply(array(1:10), 1, f), 
    list(output1 = array(sapply(1:10, function(x) rep(x:(x + 2), 4)), dim = c(3, 4)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(out1 = array(x[1]:(x[1] + 2), dim = c(b = 3, c = 4)))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 1, f), 
    list(out1 = array(sapply(1:10, function(x) rep(x:(x + 2), 4)), dim = c(b = 3, c = 4)))
  )
  # named target dim
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 'a', f), 
    list(out1 = array(sapply(1:10, function(x) rep(x:(x + 2), 4)), dim = c(b = 3, c = 4)))
  )
})

test_that("in1: 1 dim; targ. dims: 0; out1: 1 dim; out2: 2 dims; out3: 1 val", {
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) list(array(x:(x + 2), dim = c(3)),
                        array(x:(x + 3), dim = c(4, 5)),
                        mean(x))
  expect_equal(
    Apply(array(1:10), NULL, f),
    list(output1 = array(sapply(1:10, function(x) x:(x + 2)), dim = c(3, 10)),
         output2 = array(sapply(1:10, function(x) rep(x:(x + 3), 5)), dim = c(4, 5, 10)),
         output3 = array(1:10))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(a = array(x:(x + 2), dim = c(b = 3)),
                        b = array(x:(x + 3), dim = c(c = 4, d = 5)),
                        c = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), NULL, f),
    list(a = array(sapply(1:10, function(x) x:(x + 2)), dim = c(b = 3, a = 10)),
         b = array(sapply(1:10, function(x) rep(x:(x + 3), 5)), 
                   dim = c(c = 4, d = 5, a = 10)),
         c = array(1:10, dim = c(a = 10)))
  )
})

test_that("in1: 1 dim; targ. dims: 1; out1: 1 dim; out2: 2 dims; out3: 1 val", {
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) list(array(x[1]:(x[1] + 2), dim = c(3)),
                        array(x[1]:(x[1] + 3), dim = c(4, 5)),
                        mean(x))
  expect_equal(
    Apply(array(1:10), 1, f),
    list(output1 = array(sapply(1, function(x) x:(x + 2)), dim = c(3)),
         output2 = array(sapply(1, function(x) rep(x:(x + 3), 5)), dim = c(4, 5)),
         output3 = 5.5)
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(a = array(x[1]:(x[1] + 2), dim = c(b = 3)),
                        b = array(x[1]:(x[1] + 3), dim = c(c = 4, d = 5)),
                        c = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10)), 1, f),
    list(a = array(sapply(1, function(x) x:(x + 2)), dim = c(b = 3)),
         b = array(sapply(1, function(x) rep(x:(x + 3), 5)), dim = c(c = 4, d = 5)),
         c = 5.5)
  )
})

test_that("in1: 2 dim; targ. dims: 0-2; out1: 1 dim; out2: 2 dims; out3: 1 val", {
# no target dim
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) list(array(x[1]:(x[1] + 2), dim = c(3)),
                        array(x[1]:(x[1] + 3), dim = c(4, 5)),
                        mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(10, 3)), NULL, f),
    list(output1 = array(rep(sapply(1:10, function(x) x:(x + 2)), 3), dim = c(3, 10, 3)),
         output2 = array(rep(sapply(1:10, function(x) rep(x:(x + 3), 5)), 3), 
                         dim = c(4, 5, 10, 3)),
         output3 = array(1:10, dim = c(10, 3)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(a = array(x[1]:(x[1] + 2), dim = c(c = 3)),
                        b = array(x[1]:(x[1] + 3), dim = c(d = 4, e = 5)),
                        c = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10, b = 3)), NULL, f),
    list(a = array(rep(sapply(1:10, function(x) x:(x + 2)), 3), 
                   dim = c(c = 3, a = 10, b = 3)),
         b = array(rep(sapply(1:10, function(x) rep(x:(x + 3), 5)), 3), 
                         dim = c(d = 4, e = 5, a = 10, b = 3)),
         c = array(1:10, dim = c(a = 10, b = 3)))
  )
# first target dim
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) list(array(x[1]:(x[1] + 2), dim = c(3)),
                        array(x[1]:(x[1] + 3), dim = c(4, 5)),
                        mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(10, 3)), 1, f),
    list(output1 = array(rep(sapply(1, function(x) x:(x + 2)), 3), dim = c(3, 3)),
         output2 = array(rep(sapply(1, function(x) rep(x:(x + 3), 5)), 3), 
                         dim = c(4, 5, 3)),
         output3 = array(5.5, dim = c(3)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(a = array(x[1]:(x[1] + 2), dim = c(c = 3)),
                        b = array(x[1]:(x[1] + 3), dim = c(d = 4, e = 5)),
                        c = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10, b = 3)), 'a', f),
    list(a = array(rep(sapply(1, function(x) x:(x + 2)), 3), dim = c(c = 3, b = 3)),
         b = array(rep(sapply(1, function(x) rep(x:(x + 3), 5)), 3), 
                   dim = c(d = 4, e = 5, b = 3)),
         c = array(5.5, dim = c(b = 3)))
  )
# second target dim
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) list(array(x[1]:(x[1] + 2), dim = c(3)),
                        array(x[1]:(x[1] + 3), dim = c(4, 5)),
                        mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(10, 3)), 2, f),
    list(output1 = array(sapply(1:10, function(x) x:(x + 2)), dim = c(3, 10)),
         output2 = array(sapply(1:10, function(x) rep(x:(x + 3), 5)), 
                         dim = c(4, 5, 10)),
         output3 = array(1:10, dim = c(10)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(a = array(x[1]:(x[1] + 2), dim = c(c = 3)),
                        b = array(x[1]:(x[1] + 3), dim = c(d = 4, e = 5)),
                        c = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10, b = 3)), 'b', f),
    list(a = array(sapply(1:10, function(x) x:(x + 2)), 
                   dim = c(c = 3, a = 10)),
         b = array(sapply(1:10, function(x) rep(x:(x + 3), 5)), 
                   dim = c(d = 4, e = 5, a = 10)),
         c = array(1:10, dim = c(a = 10)))
  )
# two target dims
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x) list(array(x[1]:(x[1] + 2), dim = c(3)),
                        array(x[1]:(x[1] + 3), dim = c(4, 5)),
                        mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(10, 3)), c(1, 2), f),
    list(output1 = array(sapply(1, function(x) x:(x + 2)), dim = c(3)),
         output2 = array(sapply(1, function(x) rep(x:(x + 3), 5)), 
                         dim = c(4, 5)),
         output3 = 5.5)
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x) list(a = array(x[1]:(x[1] + 2), dim = c(c = 3)),
                        b = array(x[1]:(x[1] + 3), dim = c(d = 4, e = 5)),
                        c = mean(x))
  expect_equal(
    Apply(array(1:10, dim = c(a = 10, b = 3)), c('a', 'b'), f),
    list(a = array(sapply(1, function(x) x:(x + 2)), dim = c(c = 3)),
         b = array(sapply(1, function(x) rep(x:(x + 3), 5)), 
                   dim = c(d = 4, e = 5)),
         c = 5.5)
  )
})




#test_that("in1: 3 dim; targ. dims: 0-3; out1: 1 dim; out2: 2 dims; out3: 1 val", {
#})




#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 0; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 0; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 1; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 1; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 0; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 0; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 1; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 1; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 0; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 0; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 1; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 1; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 0; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 0; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 1; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 1; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 0; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 0; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 0, 1; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 val; targ. dims: 1, 1; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#
#
#
#
#
#
#
#
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 0; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 0; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 1; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 1; out1: 0 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 0; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 0; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 1; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 1; out1: 1 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 0; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 0; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 1; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 1; out1: 3 val", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 0; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 0; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 1; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 1; out1: 1 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 0; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 0; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 0, 1; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})
#
#test_that("in1: 1 val; in2: 1 dim; targ. dims: 1, 1; out1: 1 dim; out2: 1 val; out3: 3 dim", {
#})










#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 0; out1: 0 val", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 0; out1: 0 val", {
##first in first dim
##first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 1; out1: 0 val", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 1; out1: 0 val", {
##shared target dims
###first in first dim
###first in second dim
##not shared target dims
###first in first dim
###first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 2, 1; out1: 0 val", {
## shared first target dim
## shared second target dim
## not shared target dims
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 0; out1: 1 val", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 0; out1: 1 val", {
##first in first dim
##first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 1; out1: 1 val", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 1; out1: 1 val", {
##shared target dims
###first in first dim
###first in second dim
##not shared target dims
###first in first dim
###first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 2, 1; out1: 1 val", {
## shared first target dim
## shared second target dim
## not shared target dims
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 0; out1: 3 val", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 0; out1: 3 val", {
##first in first dim
##first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 1; out1: 3 val", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 1; out1: 3 val", {
##shared target dims
###first in first dim
###first in second dim
##not shared target dims
###first in first dim
###first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 2, 1; out1: 3 val", {
## shared first target dim
## shared second target dim
## not shared target dims
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 0; out1: 1 dim", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 0; out1: 1 dim", {
##first in first dim
##first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0, 1; out1: 1 dim", {
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 1, 1; out1: 1 dim", {
##shared target dims
###first in first dim
###first in second dim
##not shared target dims
###first in first dim
###first in second dim
#})
#
#test_that("in1: 2 dim; in2: 1 dim; targ. dims: 2, 1; out1: 1 dim", {
## shared first target dim
## shared second target dim
## not shared target dims
#})

test_that("in1: 2 dim; in2: 1 dim; targ. dims: 0-2, 0-1; out1: 1 dim; out2: 1 val; out3: 3 dim", {
# no target dims
## no shared margins
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  # equal dimensions -> crash
  f <- function(x, y) {
    z <- mean(x) + mean(y)
    list(array(z:(z + 3)),
         z,
         array(z:(z + 4), dim = c(5, 6, 7)))
  }
  expect_error(
    Apply(list(array(1:10, dim = c(10, 3)),
               array(1:3 * 10, dim = c(3))), 
          NULL, f, guess_dim_names = FALSE),
    "multiple unnamed dimensions of the same length"
  )
  expect_warning(
    Apply(list(array(1:10, dim = c(10, 3)),
               array(1:3 * 10, dim = c(3))),
          NULL, f),
    "Guessed names for some unnamed dimensions"
  )
  expect_equal(
    Apply(list(array(1:10, dim = c(10, 3)),
               array(1:3 * 10, dim = c(3))),
          NULL, f),
    list(output1 = array(sapply(c(10, 20, 30), function(x) {
                           x + rep(sapply(1:10, function(y) {
                             y:(y + 3)
                           }), 1)
                         }),
                         dim = c(4, 10, 3)), 
         output2 = array(sapply(c(10, 20, 30), function (x) x + rep(1:10, 1)),
                         dim = c(10, 3)),
         output3 = array(sapply(c(10, 20, 30), function(x) {
                           x + rep(sapply(1:10, function(y) {
                             rep(y:(y + 4), 6 * 7)
                           }), 1)
                         }),
                         dim = c(5, 6, 7, 10, 3)))
  )
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  expect_equal(
    Apply(list(array(1:10, dim = c(10, 4)),
               array(1:3 * 10, dim = c(3))), 
          NULL, f),
    list(output1 = array(sapply(c(10, 20, 30), function(x) {
                           x + rep(sapply(1:10, function(y) {
                             y:(y + 3)
                           }), 4)
                         }),
                         dim = c(4, 10, 4, 3)), 
         output2 = array(sapply(c(10, 20, 30), function (x) x + rep(1:10, 4)), 
                         dim = c(10, 4, 3)),
         output3 = array(sapply(c(10, 20, 30), function(x) {
                           x + rep(sapply(1:10, function(y) {
                             rep(y:(y + 4), 6 * 7)
                           }), 4)
                         }),
                         dim = c(5, 6, 7, 10, 4, 3))) 
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    z <- mean(x) + mean(y)
    list(a = array(z:(z + 3), dim = c(d = 4)),
         b = z,
         c = array(z:(z + 4), dim = c(e = 5, f = 6, g = 7)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 4)),
               array(1:3 * 10, dim = c(c = 3))), 
          NULL, f),
    list(a = array(sapply(c(10, 20, 30), function(x) {
                     x + rep(sapply(1:10, function(y) {
                       y:(y + 3)
                     }), 4)
                   }),
                   dim = c(d = 4, a = 10, b = 4, c = 3)), 
         b = array(sapply(c(10, 20, 30), function (x) x + rep(1:10, 4)), 
                   dim = c(a = 10, b = 4, c = 3)),
         c = array(sapply(c(10, 20, 30), function(x) {
                     x + rep(sapply(1:10, function(y) {
                       rep(y:(y + 4), 6 * 7)
                     }), 4)
                   }),
                   dim = c(e = 5, f = 6, g = 7, a = 10, b = 4, c = 3))) 
  )
## one shared margin
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    z <- mean(x) + mean(y)
    list(a = array(z:(z + 3), dim = c(d = 4)),
         b = z,
         c = array(z:(z + 4), dim = c(e = 5, f = 6, g = 7)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 3)),
               array(1:3 * 10, dim = c(b = 3))), 
          NULL, f),
    list(a = array(sapply(c(10, 20, 30), function(x) {
                     x + rep(sapply(1:10, function(y) {
                       y:(y + 3)
                     }), 1)
                   }),
                   dim = c(d = 4, a = 10, b = 3)), 
         b = array(sapply(c(10, 20, 30), function (x) x + rep(1:10, 1)), 
                   dim = c(a = 10, b = 3)),
         c = array(sapply(c(10, 20, 30), function(x) {
                     x + rep(sapply(1:10, function(y) {
                       rep(y:(y + 4), 6 * 7)
                     }), 1)
                   }),
                   dim = c(e = 5, f = 6, g = 7, a = 10, b = 3))) 
  )

#one target dim only
##no shared margins
###first in first dim as target
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x, y) {
    list(array(rev(x)),
         mean(x) + mean(y),
         array(rep(x + y - 1, 30), dim = c(10, 5, 6)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(10, 4)), 
               array(1:3 * 10, dim = c(3))),
          list(1, NULL), f),
    list(output1 = array(sapply(c(10, 20, 30), function(x) {
                           rep(10:1, 4)
                         }), 
                         dim = c(10, 4, 3)),
         output2 = array(sapply(c(10, 20, 30), function(x) {
                           x + rep(5.5, 4)
                         }),
                         dim = c(4, 3)),
         output3 = array(sapply(c(10, 20, 30), function(x) {
                           rep(1:10 + x - 1, 30 * 4)
                         }),
                         dim = c(10, 5, 6, 4, 3)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    list(a = array(rev(x), dim = c(d = 10)),
         b = mean(x) + mean(y),
         c = array(rep(x + y - 1, 30), dim = c(a = 10, e = 5, f = 6)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 4)), 
               array(1:3 * 10, dim = c(c = 3))),
          list('a', NULL), f),
    list(a = array(sapply(c(10, 20, 30), function(x) {
                     rep(10:1, 4)
                   }), 
                   dim = c(d = 10, b = 4, c = 3)),
         b = array(sapply(c(10, 20, 30), function(x) {
                     x + rep(5.5, 4)
                   }),
                   dim = c(b = 4, c = 3)),
         c = array(sapply(c(10, 20, 30), function(x) {
                     rep(1:10 + x - 1, 30 * 4)
                   }),
                   dim = c(a = 10, e = 5, f = 6, b = 4, c = 3)))
  )
###first in second dim as target
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x, y) {
    list(array(x[1]:(x[1] + length(x) - 1)),
         mean(x) + mean(y),
         array(rep(x + y - 1, 30), dim = c(4, 5, 6)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(10, 4)), 
               array(1:3 * 10, dim = c(3))),
          list(2, NULL), f),
    list(output1 = array(sapply(c(10, 20, 30), function(x) {
                           sapply(1:10, function(y) {
                             y:(y + 3)
                           })
                         }), 
                         dim = c(4, 10, 3)),
         output2 = array(sapply(c(10, 20, 30), function(x) {
                           1:10 + x
                         }),
                         dim = c(10, 3)),
         output3 = array(sapply(c(10, 20, 30), function(x) {
                           sapply(1:10, function(y) {
                             rep(rep(y, 4) + x - 1, 30)
                           })
                         }),
                         dim = c(4, 5, 6, 10, 3)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    list(a = array(x[1]:(x[1] + length(x) - 1), dim = c(d = 4)),
         b = mean(x) + mean(y),
         c = array(rep(x + y - 1, 30), dim = c(b = 4, e = 5, f = 6)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 4)), 
               array(1:3 * 10, dim = c(c = 3))),
          list('b', NULL), f),
    list(a = array(sapply(c(10, 20, 30), function(x) {
                     sapply(1:10, function(y) {
                       y:(y + 3)
                     })
                   }), 
                   dim = c(d = 4, a = 10, c = 3)),
         b = array(sapply(c(10, 20, 30), function(x) {
                     1:10 + x
                   }),
                   dim = c(a = 10, c = 3)),
         c = array(sapply(c(10, 20, 30), function(x) {
                     sapply(1:10, function(y) {
                       rep(rep(y, 4) + x - 1, 30)
                     })
                   }),
                   dim = c(b = 4, e = 5, f = 6, a = 10, c = 3)))
  )
###second in first dim as target
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x, y) {
    list(array(rev(y)),
         mean(x) + mean(y),
         array(rep(x + y - 1, 30), dim = c(3, 5, 6)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(10, 4)), 
               array(1:3 * 10, dim = c(3))),
          list(NULL, 1), f),
    list(output1 = array(rep(sapply(1:10, 
                               function(x) {
                                 c(30, 20, 10)
                               }), 4),
                         dim = c(3, 10, 4)),
         output2 = array(rep(sapply(1:10, 
                               function(x) {
                                 20 + x
                               }), 4),
                         dim = c(10, 4)),
         output3 = array(rep(sapply(1:10, 
                               function(x) {
                                 rep(c(10, 20, 30) + x - 1, 30)
                               }), 4),
                         dim = c(3, 5, 6, 10, 4)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    list(a = array(rev(y), dim = c(d = 3)),
         b = mean(x) + mean(y),
         c = array(rep(x + y - 1, 30), dim = c(c = 3, e = 5, f = 6)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 4)), 
               array(1:3 * 10, dim = c(c = 3))),
          list(NULL, 'c'), f),
    list(a = array(rep(sapply(1:10, 
                         function(x) {
                           c(30, 20, 10)
                         }), 4),
                   dim = c(d = 3, a = 10, b = 4)),
         b = array(rep(sapply(1:10, 
                         function(x) {
                           20 + x
                         }), 4),
                   dim = c(a = 10, b = 4)),
         c = array(rep(sapply(1:10, 
                         function(x) {
                           rep(c(10, 20, 30) + x - 1, 30)
                         }), 4),
                   dim = c(c = 3, e = 5, f = 6, a = 10, b = 4)))
  )
##one shared margin. the remaining dim in first in is the target
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    list(a = array(x[1]:(x[1] + length(x) - 1), dim = c(d = 4)),
         b = mean(x) + mean(y),
         c = array(rep(x + y - 1, 30), dim = c(b = 4, e = 5, f = 6)))
  }
  expect_equal(
    Apply(list(array(1:3, dim = c(a = 3, b = 4)), 
               array(1:3 * 10, dim = c(a = 3))),
          list('b', NULL), f),
    list(a = array(sapply(c(10, 20, 30), function(x) {
                     sapply(1:4, function(y) {
                       y[1]:(y[1] + 3)
                     })
                   }), 
                   dim = c(d = 4, a = 3)),
         b = array(sapply(c(1:3), function(x) {
                     x + x * 10
                   }),
                   dim = c(a = 3)),
         c = array(sapply(c(1:3), function(x) {
                     rep(x * 10 + rep(x, 4) - 1, 30)
                   }),
                   dim = c(b = 4, e = 5, f = 6, a = 3)))
  )

#one target dim from each in
##no shared target
##shared target

#two target dims first in, no target dim second in

#all target dims
##no shared target
  # unnamed input dim
  # unnamed output
  # unnamed output dim
  f <- function(x, y) {
    list(array(rowMeans(x)),
         mean(x) + mean(y),
         array(sapply(y, function(z) z + x - 1), dim = c(10, 4, 3)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(10, 4)), 
               array(1:3 * 10, dim = c(3))),
          list(c(1, 2), 1), f),
    list(output1 = array(1:10),
         output2 = 25.5,
         output3 = array(sapply(c(10, 20, 30), 
                           function(x) {
                             rep(1:10, 4) + x - 1
                           }),
                         dim = c(10, 4, 3)))
  )
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    list(a = array(rowMeans(x), c(a = 10)),
         b = mean(x) + mean(y),
         c = array(sapply(y, function(z) z + x - 1), 
                   dim = c(a = 10, b = 4, c = 3)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 4)), 
               array(1:3 * 10, dim = c(c = 3))),
          list(c('a', 'b'), 'c'), f),
    list(a = array(1:10, dim = c(a = 10)),
         b = 25.5,
         c = array(sapply(c(10, 20, 30), 
                     function(x) {
                       rep(1:10, 4) + x - 1
                     }),
                   dim = c(a = 10, b = 4, c = 3)))
  )
##shared target
  # named input dim
  # named output
  # named output dim
  f <- function(x, y) {
    list(a = array(rowMeans(x), c(a = 10)),
         b = mean(x) + mean(y),
         c = array(rep(t(apply(x, 1, function(z) z * y)), 3),
                   dim = c(a = 10, b = 4, c = 3)))
  }
  expect_equal(
    Apply(list(array(1:10, dim = c(a = 10, b = 4)), 
               array(1:4 * 10, dim = c(b = 4))),
          list(c('a', 'b'), 'b'), f),
    list(a = array(1:10, dim = c(a = 10)),
         b = 30.5,
         c = array(rep(sapply(c(10, 20, 30, 40), 
                         function(x) {
                           1:10 * x
                         }), 
                       3),
                   dim = c(a = 10, b = 4, c = 3)))
  )
})

##test_that("in1: 2 dim; in2: 3 dim; targ. dims: 0-2, 0-3; out1: 2 dim", {
### shared first target dim
### shared second target dim
### shared two target dims (first two in second in)
### shared two target dims (last two in second in)
### shared two target dims (extreme two in second in)
### not shared target dims
##})
#
#test_that("in1: 2 dim; in2: 3 dim; targ. dims: 0-2, 0-3; out1: 1 dim; out2: 1 val; out3: 3 dim", {
## shared first target dim
## shared second target dim
## shared two target dims (first two in second in)
## shared two target dims (last two in second in)
## shared two target dims (extreme two in second in)
## not shared target dims
#})
#
#test_that("in1: 2 dim; in2: 3 dim; in3: 1 dim; targ. dims: 0-2, 0-3, 0-1; out1: 2 dim", {
## shared first target dim
## shared second target dim
## shared two target dims (first two in second in)
## shared two target dims (last two in second in)
## shared two target dims (extreme two in second in)
## not shared target dims
#})

# Real cases
test_that("real use case - standardization", {
  standardization <- function(x, mean, deviation){
    r <- (x - mean) / deviation
    names(dim(r)) <- NULL
    r
  }

  x <- array(1:(2*3*4), dim = c(mod = 2, lon = 3, lat = 4))
  y <- array(1:12, dim = c(lon = 3, lat = 4))
  z <- array(1:12, dim = c(lon = 3, lat = 4))

  expected_result <- array(c(0:11 / z, rep(1, 3 * 4)), dim = c(3, 4, mod = 2))

  expect_equal(
    Apply(data = list(x,y,z), 
          target_dims = list(c('lon', 'lat'),
                             c('lon', 'lat'),
                             c('lon', 'lat')), 
          fun = standardization)$output1,
    expected_result
  )

  names(dim(expected_result)) <- c('lon', 'lat', 'mod')

  expect_equal(
    Apply(data = list(x,y,z), 
          margins = list('mod', NULL, NULL), 
          fun = standardization,
          output_dims = c('lon', 'lat')
         )$output1,
    expected_result
  )

  expect_equal(
    Apply(data = list(x,y,z), 
          margins = list(c('mod', 'lat'), 'lat', 'lat'), 
          fun = standardization,
          output_dims = c('lon')
         )$output1,
    multiApply:::.aperm2(expected_result, c(1, 3, 2))
  )

  x <- multiApply:::.aperm2(x, c(3, 2, 1))

  expect_equal(
    Apply(data = list(x,y,z), 
          target_dims = list(c('lon', 'lat'),
                             c('lon', 'lat'),
                             c('lon', 'lat')), 
          fun = standardization,
          output_dims = c('lon', 'lat')
         )$output1,
    expected_result
  )

})

# Test .aperm2
test_that(".aperm2", {
  data <- seq(as.POSIXct('1990-11-01'), 
              length.out = 6,
              by = as.difftime(1, units = 'days'))
  dim(data) <- c(3, 2)
  expect_equal(
    class(multiApply:::.aperm2(data, c(2, 1))),
    c('POSIXct', 'POSIXt')
  )
})

# TODOS:
# TESTS FOR MARGINS
# TESTS FOR DISORDERED TARGET_DIMS
# TESTS FOR FUN WITH TARGET_DIMS AND OUTPUT_DIMS ATTACHED
# TESTS FOR FUNCTIONS RECEIVING ADDITIONAL PARAMETERS
# TESTS FOR SPLIT FACTOR
# TESTS FOR NCORES
# TESTS OF WALLCLOCK TIME
# TESTS OF MEMORY FOOTPRINT
