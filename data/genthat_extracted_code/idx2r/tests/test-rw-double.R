
test_that('Double vector can be written/read to IDX', {
  nr = 8 
  m = round(rnorm(nr),5)
  file = "m8id.idx"
  write_idx(m, file)
  mr = read_idx(file) 
  for (i in 1:(nr)) expect_equal(m[i], mr[i], tolerance = 0.0001)  
})


test_that('Double matrix can be written/read to IDX', {
  nr = 4
  m = matrix(round(rnorm(nr*nr),5), nrow=nr)
  file = "m16id.idx"
  write_idx(m, file)
  mr = read_idx(file) 
  for (i in 1:(nr*nr)) expect_equal(m[i], mr[i], tolerance = 0.0001)  
})

test_that('Double array can be written to IDX', {
  dim = c(10, 4, 6)
  n = prod(dim)
  m = array(rnorm(n), dim=dim)
  file = "m240d.idx"
  write_idx(m, file)
  mr = read_idx(file)
  dimr = dim(mr)
  for (i in seq_along(dim)) expect_equal(dim[i], dimr[i])
  for (i in 1:n) expect_equal(m[i], mr[i], tolerance = 0.0001)
})

