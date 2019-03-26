library(ludic)
context("Record linkage")

test_that("10 true matches are properly found", {
  set.seed(123)
  ncodes <- 100
  npat <- 100
  incid <- abs(rnorm(n=ncodes, 0.15, 0.07))
  bin_codes <- rbinom(n=npat*ncodes, size=1,  prob=rep(incid, npat))
  bin_codes_mat <- matrix(bin_codes, ncol=ncodes, byrow = TRUE)
  data1_ex <- bin_codes_mat[1:(npat/2+npat/10),]
  data2_ex <- bin_codes_mat[c(1:(npat/10), (npat/2+npat/10 + 1):npat), ]
  #rownames(data1_ex) <- paste0("ID", 1:(npat/2+npat/10), "_data1")
  #rownames(data2_ex) <- paste0("ID", c(1:(npat/10), (npat/2+npat/10 + 1):npat), "_data2")
  res <- recordLink(data1 = data1_ex, data2 = data2_ex, 
                    use_diff = FALSE, eps_minus = 0.01, eps_plus = 0.01)
  testthat::expect_equivalent(res[1:(npat/10), 1:(npat/10)], diag(10))
  testthat::expect_equivalent(res[(npat/10 + 1):nrow(res), (npat/10 + 1):ncol(res)], 
                              matrix(0, nrow=(nrow(res) - npat/10), ncol=(ncol(res) - npat/10)))
})