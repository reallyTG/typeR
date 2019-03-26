
test_that('Integer vector can be written to IDX', {
  nr = 8 
  m = 1:nr
  file = "m8i.idx"
  write_idx(m, file)
  mr = read_idx(file) 
  for (i in 1:(nr)) expect_equal(m[i], mr[i])  
})


test_that('Integer matrix can be written to IDX', {
  nr = 4
  m = matrix(1:(nr*nr), nrow=nr)
  file = "m16i.idx"
  write_idx(m, file)
  mr = read_idx(file) 
  for (i in 1:(nr*nr)) expect_equal(m[i], mr[i])  
})

test_that('Integer array can be written to IDX', {
  dim = c(10, 4, 6)
  n = prod(dim) 
  m = array(1:n, dim=dim)
  file = "m240i.idx"
  write_idx(m, file)
  mr = read_idx(file) 
  dimr = dim(mr)
  for (i in seq_along(dim)) expect_equal(dim[i], dimr[i])
  for (i in 1:n) expect_equal(m[i], mr[i])  
})

