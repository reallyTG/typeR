context("sampler")

test_that("Test sampler with a easy example", {
  simply <- data.frame("R"=c(1,2,3,4,5,6,7,8,9),"Z"=rep("A",9))
  set.seed(22071993)
  sample <-  sampler(simply$R, p=0.7)
  sample2 <-  sampler(simply$R,p=0.7, seed=22071993)
  sample_percent <-  sampler(simply$R,p=70, seed=22071993)
  expect_error(sampler(simply,p=700, seed=22071993), paste0(crayon::bold("p"), " must be a value between 0 and 1 or 0 and 100"), fixed=TRUE)
  expect_equal(sample[[2]], sample2[[2]])
  expect_equal(sample2[[2]], sample_percent[[2]])


})
