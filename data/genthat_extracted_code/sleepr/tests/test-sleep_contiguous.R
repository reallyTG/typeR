context("sleep_contiguous")

test_that("sleep_contiguous works", {
  # all moving
  moving <- rep(T,100)
  # so no sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/60.0 )
  expect_false(unique(asleep))


  # no moving
  moving <- rep(F,100)
  # so all sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/60.0 )
  expect_true(unique(asleep))

  # the first 5min are imobile, then one minute of mobility. Then immobility
  moving[6] <- T
  # so all sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/60.0 )

  expect_true(sum(asleep) == sum(!moving))
  expect_false(asleep[6])

  # now, 4min of imobility between two showrt awakening
  moving[11] <- T
  # so all sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/60.0 )
  # awake between two moving
  expect_true(sum(asleep[6:11]) == 0)
  # alseep otherwise
  expect_true(all(asleep[-6:-11]))
})



test_that("sleep_contiguous works with different sampling frequencies", {
  # all moving
  moving <- rep(T,600)

  # so no sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/10.0 )
  expect_false(unique(asleep))


  # no moving
  moving <- rep(F,600)
  # so all sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/10.0 )
  expect_true(unique(asleep))

  # the first 5min are imobile, then one minute of mobility. Then immobility
  moving[36] <- T
  # so all sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/10.0 )

  expect_true(sum(asleep) == sum(!moving))
  expect_false(asleep[36])

  # now, 4min of imobility between two showrt awakening
  moving[66] <- T
  # so all sleep
  asleep <- sleepr:::sleep_contiguous(moving, fs = 1/10.0 )
  # awake between two moving
  expect_true(sum(asleep[36:66]) == 0)
  # alseep otherwise
  expect_true(all(asleep[-36:-66]))
})
