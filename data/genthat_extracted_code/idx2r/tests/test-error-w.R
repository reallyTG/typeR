

test_that('Error is returned if x is character', {
  m = matrix(as.character(1:16), nrow = 4)
  file_name = "error.idx"
  expect_error(write_idx(m, file_name))
})


test_that('Error is returned if x is not a vector, a matrix or an array', {
  m = function(x) x
  file_name = "error.idx"
  expect_error(writeIdx(m, file_name))
})

test_that('Error is returned if wrong magic number', {
  file_name = "error.idx"
  file = file(file_name, "wb")
  writeBin(as.raw(1), file, size = 1, endian = "big")
  writeBin(as.raw(2), file, size = 1, endian = "big")
  close(file)
  expect_error(read_idx(file_name))
})

test_that('Error is returned if incorrect type byte', {
  file_name = "error.idx"
  file = file(file_name, "wb")
  writeBin(as.raw(1), file, size = 1, endian = "big")
  writeBin(as.raw(2), file, size = 1, endian = "big")
  writeBin(as.raw(3), file, size = 1, endian = "big")
  close(file)
  expect_error(read_idx(file_name))
})


