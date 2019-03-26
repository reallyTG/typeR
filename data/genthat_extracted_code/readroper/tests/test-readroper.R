context("read_rpr function")

test_that("First row of multicard dataset matches", {
  out1 <- read_rpr(col_positions=c(1,2,4), widths=c(1,2,1),
                   col_names=c('V1','V2','V3'), filepath='testMultiCard.txt', card_read=2, cards=2)
  expect_equal(out1$V1[1], 0)
  expect_equal(out1$V2[1], "80")
  expect_equal(out1$V3[1], 1)
})

test_that("First row of single card dataset matches", {
  out1 <- read_rpr(col_positions=c(1,2,4), widths=c(1,2,1),
                   col_names=c('V1','V2','V3'), filepath='testSingleCard.txt')
  expect_equal(out1$V1[1], 0)
  expect_equal(out1$V2[1], "08")
  expect_equal(out1$V3[1], 1)
})

test_that("read_rpr throws error when col positions, lengths or names are different lengths", {
  expect_error(read_rpr(col_positions=c(1,2), widths=c(1,2,4),
                        col_names=c('V1','V2','V3'), filepath='testSingleCard.txt'))
  expect_error(read_rpr(col_positions=c(1,2,4), widths=c(1,2),
                        col_names=c('V1','V2','V3'), filepath='testSingleCard.txt'))
  expect_error(read_rpr(col_positions=c(1,2,4), widths=c(1,2,1),
                        col_names=c('V1','V2'), filepath='testSingleCard.txt'))
})

test_that("read_rpr throws error when missing file", {
  expect_error(read_rpr(col_positions=c(1,2,4), widths=c(1,2,1), col_names=c('V1','V2','V3')))
})

test_that("read_rpr throws error when missing col positions, lengths or names", {
  expect_error(read_rpr(widths=c(1,2,1), col_names=c('V1','V2','V3'), filepath='testSingleCard.txt'))
  expect_error(read_rpr(col_positions=c(1,2,4), col_names=c('V1','V2','V3'), filepath='testSingleCard.txt'))
  expect_error(read_rpr(col_positions=c(1,2,4), widths=c(1,2,1), filepath='testSingleCard.txt'))
})
