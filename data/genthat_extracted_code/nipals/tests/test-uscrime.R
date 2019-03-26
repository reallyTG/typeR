context("uscrime data")

# these examples come from the documentation for the SAS PCA procedure
# http://documentation.sas.com/?docsetId=casstat&docsetVersion=8.11&docsetTarget=viyastat_pca_gettingstarted.htm&locale=en

test_that("NIPALS decomposition of 'uscrime' data matches SAS", {
  data(uscrime)
  # SAS discards rows with missinng values
  dat <- uscrime[complete.cases(uscrime), ]
  dat <- as.matrix(dat[ , -1])
  
  m1 <- nipals(dat) # complete-data method
  
  m2 <- nipals(dat, force.na=TRUE) # use the missing-data method
  
  # scale(dat) # centering / scaling information matches SAS
  
  # SAS eigenvalues reported are squared singular values divided by (n-1)
  sas.eig <- c(4.045824, 1.264030, 0.747500, 0.326325, 0.265207, 0.228364, 0.122750)
  # (m1$eig^2) / (48-1) - sas.eig
  expect_equal((m1$eig^2) / (nrow(dat)-1) , sas.eig, tolerance = 1e-4)
  expect_equal((m2$eig^2) / (nrow(dat)-1) , sas.eig, tolerance = 1e-4)
  
  # SAS eigenvectors
  sas.loadings <- matrix(c(
    -0.30289,	0.61893,	0.17353,	-0.23308,	-0.54896,	0.26371,	-0.26428,
    -0.43410,	0.17053,	-0.23539,	0.06540,	-0.18075,	-0.78232,	0.27946,
    -0.39705,	-0.04713,	0.49208,	-0.57470,	0.50808,	-0.09452,	0.02497,
    -0.39622,	0.35142,	-0.05343,	0.61743,	0.51525,	0.17395,	-0.19921,
    -0.44164,	-0.20861,	-0.22454,	-0.02750,	-0.11273,	0.52340,	0.65085,
    -0.35634,	-0.40570,	-0.53681,	-0.23231,	-0.02172,	0.04085,	-0.60346,
    -0.28834,	-0.50400,	0.57524,	0.41853,	-0.35939,	-0.06024,	-0.15487),
    nrow=7, byrow=TRUE)
  row.names(sas.loadings) <- c("murder", "rape", "robbery", "assault",
                               "burglary", "larceny", "autotheft")
  colnames(sas.loadings) <- paste0("PC",1:7)
  # use abs() because values are only unique up to a sign change
  expect_equal(abs(m1$loadings), abs(sas.loadings), tolerance = 1e-3)
  expect_equal(abs(m2$loadings), abs(sas.loadings), tolerance = 1e-3)

})

test_that("NIPALS and SVD match for complete uscrime data", {
  data(uscrime)
  dat <- uscrime[complete.cases(uscrime), ]
  dat <- as.matrix(dat[ , -1])
  m1 <- nipals(dat) # complete-data method
  m3 <- svd(scale(dat))
  
  # eigenvalues
  expect_equal(m1$eig, m3$d, tol = 1e-3)
  # loadings
  expect_equal(abs(m1$loadings), abs(m3$v), tol=1e-3, check.attributes=FALSE )
  # scores
  expect_equal(abs(m1$scores), abs(m3$u), tol=1e-3, check.attributes=FALSE )
  
})