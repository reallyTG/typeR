context("MSPE")

# In this file we compute the linear forecasts as defined in
# Section 3.4 of the paper naively (with plain R) and compare
# to the C++ implementation that is more efficient.

# We will do it for one t, h, p and N

T <- 25
m1 <- 20
m2 <- 25

X <- rnorm(T)

P <- 5
H <- 2

N <- 10:12

naiveRes <- array(0, dim=c(H, P, length(N)))
for (h in 1:H) {
  for (j.N in 1:length(N)) {
    for (i in 1:P) {
      for (t in (m1-h):(m2-h)) { 
        # compute forecast
        coef <- predCoef(X, P, h, t, N[j.N])$coef[i, 1:i, h, 1, 1]
        Xhat <- sum( coef * X[t:(t-i+1)])
        naiveRes[h, i, j.N] <- naiveRes[h, i, j.N] + ( X[t+h] - Xhat )^2
      }
      naiveRes[h, i, j.N] <- naiveRes[h, i, j.N] / (m2-m1+1)
    }
  }
}


test_that("MSPE computation works", {
  predcoef <- predCoef(X, P, H, (m1-H):(m2-1), N )
  cppRes <- MSPE(X, predcoef, m1, m2, P, H, N)
  expect_equal(sum( (cppRes$mspe - naiveRes)^2 ), 0)
  
  # It should also work without the predcoef previously computed.
  cppRes1 <- MSPE(X, m1 = m1, m2 = m2, P = P, H = H, N = N)
  expect_equal(sum( (cppRes1$mspe - naiveRes)^2 ), 0)
})

naiveRes <- array(0, dim=c(H, P, length(N)))
alpha1 <- 0.2
alpha2 <- 0.3
for (h in 1:H) {
  for (j.N in 1:length(N)) {
    for (i in 1:P) {
      aux <- rep(0, m2)
      for (t in (m1-h):(m2-h)) { 
        # compute forecast
        coef <- predCoef(X, P, h, t, N[j.N])$coef[i, 1:i, h, 1, 1]
        Xhat <- sum( coef * X[t:(t-i+1)])
        aux[t] <- abs(X[t+h] - Xhat)
      }
      aux[(m1-h):(m2-h)] <- sort(aux[(m1-h):(m2-h)]) 
      m_lo <- m1 - h + floor(alpha1*(m2-m1+1))
      m_up <- m2 - h - floor(alpha2*(m2-m1+1))
      naiveRes[h, i, j.N] <- sum(aux[m_lo:m_up]) / (m_up - m_lo + 1)
    }
  }
}

test_that("trMAPE computation works", {
      predcoef <- predCoef(X, P, H, (m1-H):(m2-1), N )
      cppRes <- MAPE(X, predcoef, m1, m2, P, H, N, trimLo=0.2, trimUp=0.3)
      expect_equal(sum( (cppRes$mape - naiveRes)^2 ), 0)
      
      # It should also work without the predcoef previously computed.
      cppRes1 <- MAPE(X, m1 = m1, m2 = m2, P = P, H = H, N = N, trimLo=0.2, trimUp=0.3)
      expect_equal(sum( (cppRes1$mape - naiveRes)^2 ), 0)
    })

test_that("parameter validation works properly", {
  expect_error( cppRes <- MSPE(X, "not a list", m1, m2, P, H, N) )
  
  predcoef_not_right_names <- list()
  expect_error( cppRes <- MSPE(X, predcoef_not_right_names, m1, m2, P, H, N) )
  
  predcoef_not_right_names <- list(coef_X = array(dim = c(P,P,H,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_not_right_names, m1, m2, P, H, N) )

  ## predcoef$pref has to be five dimensions
  predcoef_not_right_dim1 <- list(coef = array(dim = c(1,P,P,H,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_not_right_dim1, m1, m2, P, H, N) )
  
  predcoef_t_not_numeric <- list(coef = array(dim=c(1,2,3,4,5)), t = "not numeric", N = 3:7)
  expect_error( cppRes <- MSPE(X, predcoef_t_not_numeric, m1, m2, P, H, N) )
  
  predcoef_N_not_numeric <- list(coef = array(dim=c(1,2,3,4,5)), t = 5:10, N = "not numeric")
  expect_error( cppRes <- MSPE(X, predcoef_N_not_numeric, m1, m2, P, H, N) )
  
  predcoef_not_right_dim2 <- list(coef = array(dim = c(P,P+1,H,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_not_right_dim2, m1, m2, P, H, N) )
  
  predcoef_not_right_dim3 <- list(coef = array(dim = c(P-1,P-1,H,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_not_right_dim3, m1, m2, P, H, N) )
  
  predcoef_not_right_dim4 <- list(coef = array(dim = c(P,P,H-1,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_not_right_dim4, m1, m2, P, H, N) )
  
  predcoef_not_right_dim5 <- list(coef = array(dim = c(P,P,H,m2-m1+1,length(N))), t = (m1+1):(m2+1), N = N)
  expect_error( cppRes <- MSPE(X, predcoef_not_right_dim5, m1, m2+1, P, H, N) )
  
  predcoef_too_few_N <- list(coef = array(dim = c(P,P,H,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_too_few_N, m1, m2, P, H, 10:13) )

  predcoef_too_few_t <- list(coef = array(dim = c(P,P,H,m2-m1+1,length(N))), t = (m1+1):m2, N = N)
  expect_error( cppRes <- MSPE(X, predcoef_too_few_t, m1, m2+1, P, H, N) )
  
})