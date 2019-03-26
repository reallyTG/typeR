context("EbayesThresh")

# ----------------------------------------------------------------------
test_that("beta.laplace recovers result from v1.3.2 package when s=1",{
  x <- c(-2,1,0,-4,5)
  y <- c(+0.889852029651143,
         -0.380041716606011,
         -0.561817771773154,
         +285.459466672351,
         +15639.8849145429)
  expect_equal(beta.laplace(x),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("postmean recovers result from v1.3.2 package when s=1 and w=0.5",{
  x <- c(-2,1,0,-4,5)
  y <- c(-1.01158962199946,
         +0.270953305249239,
         0,
         -3.48800924041643,
         +4.4997151290092)
  expect_equal(postmean(x, s=1),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("postmed recovers result from v1.3.2 package when s=1 and w=0.5",{
  x <- c(-2,1,0,-4,5)
  y <- c(-0.829992882781227,
         0,
         0,
         -3.49568406354978,
         +4.49992059554046)
  expect_equal(postmed(x, s=1),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
# Note that tfromw(x) is expected to give different values for large
# values of x (e.g., x = 10) due to an changes in the search domain
# for the threshold.
test_that("tfromw recovers result from v1.3.2 package when s=1",{
  w <- seq(0.2,0.8,0.2)
  y <- c(+2.44873377028853,
         +1.92279064562172,
         +1.40956187155098,
         +0.767900790087879)
  expect_equal(tfromw(w),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("tfromx recovers result from v1.3.2 package when s=1",{
  set.seed(123)
  x <- rnorm(100)
  y <- c(+3.03485425654799)
  expect_equal(tfromx(x),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("wfromt recovers result from v1.3.2 package when s=1",{
  y <- c(+0.734187187788918,
         +0.368633767549335,
         +0.0661925474440213,
         +0.00348003803260551,
         +6.39312743790131e-05)
  expect_equal(wfromt(1:5),y,tolerance = 1e-10)
})

# ----------------------------------------------------------------------
test_that("wfromx recovers result from v1.3.2 package when s=1",{
  set.seed(123)
  x <- rnorm(100)
  y <- 0.0609124723599925
  expect_equal(wfromx(x),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("wandafromx recovers result from v1.3.2 package when s=1",{
  set.seed(123)
  x <- rnorm(100)
  y <- list(w = 0.371583145802847,a = 3)
  expect_equal(wandafromx(x),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("ebayesthresh recovers result from v1.3.2 when s=1 (1st test)",{
  set.seed(123)
  mu <- c(rep(0, 50), rnorm(50, sd=2))
  x  <- mu + rnorm(100)
  y  <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          0.461501932251305,0,-1.18081131503738,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          0.87949485647377,0,0,0,0,0,2.18630700818864,0,0,
          2.83745453837867,0,-3.69477351123594,0,0,0,0,0,0,0,
          3.36467539856769,0,-4.07317568417785,0,-0.141700670497741,
          -0.343683094401104,0,-1.65608219851322,0,0,-3.5191992174366,
          0,0,-2.66613200774895,1.45289341778632,1.15387225239285,
          0,0,0,0,1.59321391647936,0,0,0,-0.925903664068815,0,0,
          -3.59828116583749,2.11687940619439,0,-2.04737147690392,
          -1.08310726061405,0,3.13925967166472,0)
  expect_equal(ebayesthresh(x, sdev = 1),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that("ebayesthresh recovers result from v1.3.2 when s=1 (2nd test)",{
  set.seed(120)
  mu <- c(rep(0, 50), rnorm(50, sd=2))
  x  <- mu + rnorm(100)
  y  <- c(0,0,0,0,0,0,0,0,0,0,0,0,-1.04121693067389,
          0,0,0,0,0,0,0,0,0,0,-1.35978570570315,0,0,-0.240101857101125,
          0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
          3.83090910100726,0.0712822438458154,0,-3.59696604125997,
          3.86540675250451,0.0897481774495907,0,0,0,0,-3.41370542189694,
          0,0,3.49859567543283,0,0,-1.81030820004674,3.71037602480949,
          0,0,0,2.81312247449243,0,0,0,-2.00442016176308,-4.6661776361885,
          0,0,1.67416061651496,0,0,-1.53846644772252,0,5.8288454853458,
          0,0,0,0,0,0,3.00394257291387,0,0,-2.26047995381615,0,0)
  expect_equal(ebayesthresh(x, sdev = 1),y,tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that(paste("ebayesthresh returns the same result with sdev=1",
                "and sdev=rep(1, n) (3rd test)"),{
  set.seed(120)
  mu <- c(rep(0, 50), rnorm(50, sd=2))
  x  <- mu + rnorm(100)
  expect_equal(ebayesthresh(x, sdev = rep(1,100)),
               ebayesthresh(x, sdev = 1),
               tolerance = 1e-6)
})

# ----------------------------------------------------------------------
test_that(paste("ebayesthresh with heterogeneous variance in which",
                "samples are presented in different orders (4th test)"),{
  set.seed(120)
  mu <- c(rep(0, 25), rnorm(25, sd=2))
  s  <- rchisq(50, 1)
  x  <- mu + rnorm(50, sd=s)
  i  <- sample(50)
  expect_equal(ebayesthresh(x,sdev = s),
               ebayesthresh(x[i],sdev = s[i])[order(i)],
               tolerance = 1e-6)
})

