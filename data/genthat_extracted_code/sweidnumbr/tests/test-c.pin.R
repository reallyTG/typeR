context("c.pin")

test_that(desc="class: pin",{
  x <- as.pin("196408233234")
  y <- as.pin("200108230000")
  xy <- c(x, y)
  expect_is(xy, class = "pin")
  expect_equal(as.character(xy), c("196408233234","200108230000"))
})
