context("bout_analysis")

test_that("bout_analysis works on behavr table", {
  dt <- toy_activity_data(duration=days(2))
  bout_analysis(asleep, dt)
})


test_that("bout_analysis works in a simple context", {
  a = "a"
  b = "b"
  dt <- data.table(t = c(1:5,10:15),
                   y = c(a,a,a,b,a,b,a,a,a,b,b))

  dt
  bdt <- bout_analysis(y, dt)


  expected <- rbind(
      data.table( y=a,
                  t=c(1,5,11),
                  duration=c(3,5,3)),
      data.table( y=b,
                  t=c(4,10,14),
                  duration=c(1,1,1))
    )[,.SD, keyby=t]

  bdt <- bdt[, .(t,y,duration)][,.SD, keyby=t]


  expect_equal(expected[,sum(duration)], max(dt[,t]) - 1)
  expect_equal(bdt[,sum(duration)], max(dt[,t]) - 1)
  expect_equal(expected, bdt)


})

