context("Power results")

test_that("Return same values as Wittes and Wallenstein Table 2", {
  vpower <- Vectorize(power.cmh.test, c("theta","N"), SIMPLIFY = FALSE)

  thetas <- c(2:8,10,10)
  Ns <- c(400,180,100,80,80,60,40,40,20)

  power_list <- vpower(
    theta = thetas,
    p2 = c(.2,.4,.65),
    N = Ns,
    power = NULL,
    s = c(.2,.6,.4),
    t = c(.25,.25,.5),
    alternative = "two",
    correct = FALSE
  )

  calculated_power <- round(sapply(power_list, "[[", "power") * 100, 0)

  expected_power <- c(85,87,81,82,88,83,69,76,43)

  expect_equal(calculated_power,expected_power)

})

test_that("Return same values as Wittes and Wallenstein Table 3", {
  power_test <- function(thetas, p2, N, correct) {
    round(
      power.cmh.test(
        theta = thetas,
        p2 = p2,
        N = N,
        power = NULL,
        alternative = "two",
        correct = correct
      )$power,
      3
    )
  }

  # Uncorrected
  expect_equal(power_test(c(12,12),c(0.2,0.25),16,FALSE),0.595)
  expect_equal(power_test(c(10,10),c(0.2,0.25),28,FALSE),0.813)
  expect_equal(power_test(c(8,8),c(0.2,0.25),40,FALSE),0.878)
  expect_equal(power_test(c(8,8),c(0.2,0.5),40,FALSE),0.831)
  expect_equal(power_test(c(4,8),c(0.2,0.5),60,FALSE),0.828)
  expect_equal(power_test(c(2,6),c(0.2,0.5),60,FALSE),0.552)
  expect_equal(power_test(c(3,3),c(0.2,0.5),60,FALSE),0.497)
  expect_equal(power_test(c(3,3),c(0.2,0.5),80,FALSE),0.620)
  expect_equal(power_test(c(4,4),c(0.2,0.5),80,FALSE),0.815)

  # Corrected
  expect_equal(power_test(c(12,12),c(0.2,0.25),16,TRUE),0.360)
  expect_equal(power_test(c(10,10),c(0.2,0.25),28,TRUE),0.672)
  expect_equal(power_test(c(8,8),c(0.2,0.25),40,TRUE),0.790)
  expect_equal(power_test(c(8,8),c(0.2,0.5),40,TRUE),0.722)
  expect_equal(power_test(c(4,8),c(0.2,0.5),60,TRUE),0.743)
  expect_equal(power_test(c(2,6),c(0.2,0.5),60,TRUE),0.434)
  expect_equal(power_test(c(3,3),c(0.2,0.5),60,TRUE),0.386)
  expect_equal(power_test(c(3,3),c(0.2,0.5),80,TRUE),0.524)
  expect_equal(power_test(c(4,4),c(0.2,0.5),80,TRUE),0.742)
})


test_that("Corrected power is less than uncorrected", {
  correction_test <- function(thetas, p2, N, alternative) {
    vpower <- Vectorize(power.cmh.test,"correct", SIMPLIFY = FALSE)

    power_pair <-
      sapply(
        vpower(
          theta = thetas,p2 = p2,N = N,power = NULL,
          alternative = alternative,correct = c(FALSE,TRUE)
        ),
        "[[",
        "power"
    )

    power_pair[1] > power_pair[2]
  }

  # Two-sided
  expect_true(correction_test(c(12,12),c(0.2,0.25),16,"two"))
  expect_true(correction_test(c(10,10),c(0.2,0.25),28,"two"))
  expect_true(correction_test(c(8,8),c(0.2,0.25),40,"two"))
  expect_true(correction_test(c(8,8),c(0.2,0.5),40,"two"))
  expect_true(correction_test(c(4,8),c(0.2,0.5),60,"two"))
  expect_true(correction_test(c(2,6),c(0.2,0.5),60,"two"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),60,"two"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),80,"two"))
  expect_true(correction_test(c(4,4),c(0.2,0.5),80,"two"))
  expect_true(correction_test(1 / c(12,12),c(0.2,0.25),16,"two"))
  expect_true(correction_test(1 / c(10,10),c(0.2,0.25),28,"two"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.25),40,"two"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.5),40,"two"))
  expect_true(correction_test(1 / c(4,8),c(0.2,0.5),60,"two"))
  expect_true(correction_test(1 / c(2,6),c(0.2,0.5),60,"two"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),60,"two"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),80,"two"))
  expect_true(correction_test(1 / c(4,4),c(0.2,0.5),80,"two"))

  # Greater
  expect_true(correction_test(c(12,12),c(0.2,0.25),16,"g"))
  expect_true(correction_test(c(10,10),c(0.2,0.25),28,"g"))
  expect_true(correction_test(c(8,8),c(0.2,0.25),40,"g"))
  expect_true(correction_test(c(8,8),c(0.2,0.5),40,"g"))
  expect_true(correction_test(c(4,8),c(0.2,0.5),60,"g"))
  expect_true(correction_test(c(2,6),c(0.2,0.5),60,"g"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),60,"g"))
  expect_true(correction_test(c(3,3),c(0.2,0.5),80,"g"))
  expect_true(correction_test(c(4,4),c(0.2,0.5),80,"g"))

  # Less
  expect_true(correction_test(1 / c(12,12),c(0.2,0.25),16,"l"))
  expect_true(correction_test(1 / c(10,10),c(0.2,0.25),28,"l"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.25),40,"l"))
  expect_true(correction_test(1 / c(8,8),c(0.2,0.5),40,"l"))
  expect_true(correction_test(1 / c(4,8),c(0.2,0.5),60,"l"))
  expect_true(correction_test(1 / c(2,6),c(0.2,0.5),60,"l"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),60,"l"))
  expect_true(correction_test(1 / c(3,3),c(0.2,0.5),80,"l"))
  expect_true(correction_test(1 / c(4,4),c(0.2,0.5),80,"l"))
})
