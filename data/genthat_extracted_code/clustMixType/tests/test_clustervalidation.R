context("Basic tests - clustervalidation.\n")

library(clustMixType)

# generate test data from example
set.seed(42)
n   <- 10
prb <- 0.99
muk <- 2.5 
clusid <- rep(1:4, each = n)

x1 <- sample(c("A","B"), 2*n, replace = TRUE, prob = c(prb, 1-prb))
x1 <- c(x1, sample(c("A","B"), 2*n, replace = TRUE, prob = c(1-prb, prb)))
x1 <- as.factor(x1)

x2 <- sample(c("A","B"), 2*n, replace = TRUE, prob = c(prb, 1-prb))
x2 <- c(x2, sample(c("A","B"), 2*n, replace = TRUE, prob = c(1-prb, prb)))
x2 <- as.factor(x2)

x3 <- c(rnorm(n, mean = -muk), rnorm(n, mean = muk), rnorm(n, mean = -muk), rnorm(n, mean = muk))
x4 <- c(rnorm(n, mean = -muk), rnorm(n, mean = muk), rnorm(n, mean = -muk), rnorm(n, mean = muk))

x <- data.frame(x1,x2,x3,x4)

kpres <- kproto.default(x, 4)
kpres_w <- kproto.default(x,4, keep.data = FALSE)


iv_cindex  <- cindex_kproto(object=kpres)
ivk_cindex <- cindex_kproto(data=x,k=c(3:5))
test_that("resulting objects based on cindex are as expected",{
  expect_error(cindex_kproto(object=2))
  expect_error(cindex_kproto(object=kpres, k=4))
  expect_error(cindex_kproto(data=NULL))
  expect_error(cindex_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(cindex_kproto(data=data.frame("a"=c(2,2))))
  expect_error(cindex_kproto(data=x,k=-1:3))
  expect_error(cindex_kproto(data=x,k=5:43))
  expect_error(cindex_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_cindex, "numeric")
  expect_true(length(iv_cindex) == 1)
  expect_true(iv_cindex > 0)
  expect_true(iv_cindex < 1)
  
  expect_is(ivk_cindex[[1]], "numeric")
  expect_true(length(ivk_cindex[[1]]) == 1)
  expect_true(ivk_cindex[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_cindex[[2]]))
  expect_true(length(ivk_cindex[[2]]) <= 3)
  expect_equal(ivk_cindex[[1]], as.numeric(names(which.min(ivk_cindex[[2]]))))
}
)

iv_dunn  <- dunn_kproto(object=kpres)
ivk_dunn <- dunn_kproto(data=x,k=c(3:5))
test_that("resulting objects based on dunn index are as expected",{
  expect_error(dunn_kproto(object=2))
  expect_error(dunn_kproto(object=kpres, k=4))
  expect_error(dunn_kproto(data=NULL))
  expect_error(dunn_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(dunn_kproto(data=data.frame("a"=c(2,2))))
  expect_error(dunn_kproto(data=x,k=-1:3))
  expect_error(dunn_kproto(data=x,k=5:43))
  expect_error(dunn_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_dunn, "numeric")
  expect_true(length(iv_dunn) == 1)
  expect_true(iv_dunn >= 0)
  
  expect_is(ivk_dunn[[1]], "numeric")
  expect_true(length(ivk_dunn[[1]]) == 1)
  expect_true(ivk_dunn[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_dunn[[2]]))
  expect_true(length(ivk_dunn[[2]]) <= 3)
  expect_equal(ivk_dunn[[1]], as.numeric(names(which.max(ivk_dunn[[2]]))))
}
)

iv_gamma  <- gamma_kproto(object=kpres)
ivk_gamma <- gamma_kproto(data=x,k=c(3:5))
test_that("resulting objects based on gamma index are as expected",{
  expect_error(gamma_kproto(object=2))
  expect_error(gamma_kproto(object=kpres, k=4))
  expect_error(gamma_kproto(data=NULL))
  expect_error(gamma_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(gamma_kproto(data=data.frame("a"=c(2,2))))
  expect_error(gamma_kproto(data=x,k=-1:3))
  expect_error(gamma_kproto(data=x,k=5:43))
  expect_error(gamma_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_gamma, "numeric")
  expect_true(length(iv_gamma) == 1)
  expect_true(iv_gamma > -1)
  expect_true(iv_gamma <= 1)
  
  expect_is(ivk_gamma[[1]], "numeric")
  expect_true(length(ivk_gamma[[1]]) == 1)
  expect_true(ivk_gamma[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_gamma[[2]]))
  expect_true(length(ivk_gamma[[2]]) <= 3)
  expect_equal(ivk_gamma[[1]], as.numeric(names(which.max(ivk_gamma[[2]]))))
}
)

iv_gplus  <- gplus_kproto(object=kpres)
ivk_gplus <- gplus_kproto(data=x,k=c(3:5))
test_that("resulting objects based on gplus index are as expected",{
  expect_error(gplus_kproto(object=2))
  expect_error(gplus_kproto(object=kpres, k=4))
  expect_error(gplus_kproto(data=NULL))
  expect_error(gplus_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(gplus_kproto(data=data.frame("a"=c(2,2))))
  expect_error(gplus_kproto(data=x,k=-1:3))
  expect_error(gplus_kproto(data=x,k=5:43))
  expect_error(gplus_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_gplus, "numeric")
  expect_true(length(iv_gplus) == 1)
  expect_true(iv_gplus >= 0)
  expect_true(iv_gplus < 1)
  
  expect_is(ivk_gplus[[1]], "numeric")
  expect_true(length(ivk_gplus[[1]]) == 1)
  expect_true(ivk_gplus[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_gplus[[2]]))
  expect_true(length(ivk_gplus[[2]]) <= 3)
  expect_equal(ivk_gplus[[1]], as.numeric(names(which.min(ivk_gplus[[2]]))))
}
)

iv_mcclain  <- mcclain_kproto(object=kpres)
ivk_mcclain <- mcclain_kproto(data=x,k=c(3:5))
test_that("resulting objects based on mcclain index are as expected",{
  expect_error(mcclain_kproto(object=2))
  expect_error(mcclain_kproto(object=kpres, k=4))
  expect_error(mcclain_kproto(data=NULL))
  expect_error(mcclain_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(mcclain_kproto(data=data.frame("a"=c(2,2))))
  expect_error(mcclain_kproto(data=x,k=-1:3))
  expect_error(mcclain_kproto(data=x,k=5:43))
  expect_error(mcclain_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_mcclain, "numeric")
  expect_true(length(iv_mcclain) == 1)
  expect_true(iv_mcclain >= 0)
  
  expect_is(ivk_mcclain[[1]], "numeric")
  expect_true(length(ivk_mcclain[[1]]) == 1)
  expect_true(ivk_mcclain[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_mcclain[[2]]))
  expect_true(length(ivk_mcclain[[2]]) <= 3)
  expect_equal(ivk_mcclain[[1]], as.numeric(names(which.min(ivk_mcclain[[2]]))))
}
)

iv_ptbiserial  <- ptbiserial_kproto(object=kpres)
ivk_ptbiserial <- ptbiserial_kproto(data=x,k=c(3:5))
test_that("resulting objects based on ptbiserial index are as expected",{
  expect_error(ptbiserial_kproto(object=2))
  expect_error(ptbiserial_kproto(object=kpres, k=4))
  expect_error(ptbiserial_kproto(data=NULL))
  expect_error(ptbiserial_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(ptbiserial_kproto(data=data.frame("a"=c(2,2))))
  expect_error(ptbiserial_kproto(data=x,k=-1:3))
  expect_error(ptbiserial_kproto(data=x,k=5:43))
  expect_error(ptbiserial_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_ptbiserial, "numeric")
  expect_true(length(iv_ptbiserial) == 1)
  
  expect_is(ivk_ptbiserial[[1]], "numeric")
  expect_true(length(ivk_ptbiserial[[1]]) == 1)
  expect_true(ivk_ptbiserial[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_ptbiserial[[2]]))
  expect_true(length(ivk_ptbiserial[[2]]) <= 3)
  expect_equal(ivk_ptbiserial[[1]], as.numeric(names(which.max(ivk_ptbiserial[[2]]))))
}
)

iv_silhouette  <- silhouette_kproto(object=kpres)
ivk_silhouette <- silhouette_kproto(data=x,k=c(3:5))
test_that("resulting objects based on silhouette index are as expected",{
  expect_error(silhouette_kproto(object=2))
  expect_error(silhouette_kproto(object=kpres, k=4))
  expect_error(silhouette_kproto(data=NULL))
  expect_error(silhouette_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(silhouette_kproto(data=data.frame("a"=c(2,2))))
  expect_error(silhouette_kproto(data=x,k=-1:3))
  expect_error(silhouette_kproto(data=x,k=5:43))
  expect_error(silhouette_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_silhouette, "numeric")
  expect_true(length(iv_silhouette) == 1)
  expect_true(iv_silhouette >= -1)
  expect_true(iv_silhouette <= 1)
  
  expect_is(ivk_silhouette[[1]], "numeric")
  expect_true(length(ivk_silhouette[[1]]) == 1)
  expect_true(ivk_silhouette[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_silhouette[[2]]))
  expect_true(length(ivk_silhouette[[2]]) <= 3)
  expect_equal(ivk_silhouette[[1]], as.numeric(names(which.max(ivk_silhouette[[2]]))))
}
)

iv_tau  <- tau_kproto(object=kpres)
ivk_tau <- tau_kproto(data=x,k=c(3:5))
test_that("resulting objects based on tau index are as expected",{
  expect_error(tau_kproto(object=2))
  expect_error(tau_kproto(object=kpres, k=4))
  expect_error(tau_kproto(data=NULL))
  expect_error(tau_kproto(data=data.frame("a"=2,"b"=2)))
  expect_error(tau_kproto(data=data.frame("a"=c(2,2))))
  expect_error(tau_kproto(data=x,k=-1:3))
  expect_error(tau_kproto(data=x,k=5:43))
  expect_error(tau_kproto(data=NULL, object=kpres_w))
  
  expect_is(iv_tau, "numeric")
  expect_true(length(iv_tau) == 1)
  expect_true(iv_tau >= -1)
  expect_true(iv_tau <= 1)
  
  expect_is(ivk_tau[[1]], "numeric")
  expect_true(length(ivk_tau[[1]]) == 1)
  expect_true(ivk_tau[[1]] %in% c(3:5))
  expect_true(is.numeric(ivk_tau[[2]]))
  expect_true(length(ivk_tau[[2]]) <= 3)
  expect_equal(ivk_tau[[1]], as.numeric(names(which.max(ivk_tau[[2]]))))
}
)