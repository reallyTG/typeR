context('transition-class')

test_that('transition classes work', {

  # a user-specified transfun
  ddfun <- function (landscape) {
    adult_density <- population(landscape, 'adults') / area(landscape)
    param$p * exp(-adult_density / param$area)
  }
  dd <- as.transfun(ddfun,
                    param = list(p = 0.9,
                                 area = 1000),
                    type = 'probability')

  # alias works
  expect_equal(tr, transition)

  # two types of transfun
  tr1 <- transition(larva ~ egg, p(0.5))
  tr2 <- transition(egg ~ adult, r(10))
  tr3 <- transition(adult ~ adult, dd)
  tr4 <- transition(adult ~ adult, p(0.5)) * tr3

  # check they have the right class
  expect_s3_class(tr1, 'transition')
  expect_s3_class(tr2, 'transition')
  expect_s3_class(tr3, 'transition')
  expect_s3_class(tr4, 'transition')

  # check is.transition works on transitions
  expect_true(is.transition(tr1))
  expect_true(is.transition(tr2))
  expect_true(is.transition(tr3))
  expect_true(is.transition(tr4))

  # check is.transition works on non-transitions
  expect_false(is.transition(list()))
  expect_false(is.transition(NA))
  expect_false(is.transition(NULL))

  # check as.transition works
  obj1 <- pop:::as.transition(list())
  obj2 <- pop:::as.transition(NA)
  obj3 <- pop:::as.transition(Inf)
  expect_s3_class(obj1, 'transition')
  expect_s3_class(obj2, 'transition')
  expect_s3_class(obj3, 'transition')

  # check print.transition works
  expect_equal(capture.output(print(tr1)),
               'transition:	egg -> larva with expectation 0.5')
  expect_equal(capture.output(print(tr2)),
               'transition:	adult -> egg with expectation 10')
  expect_equal(capture.output(print(tr3)),
               'transition:	adult -> adult with user-defined transfun')
  expect_equal(capture.output(print(tr4)),
               'transition:	adult -> adult with user-defined transfun')

})
