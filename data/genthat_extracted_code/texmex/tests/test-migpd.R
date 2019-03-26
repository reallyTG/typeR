context("migpd")

test_that("migpd behaves as it should", {
  skip_on_cran()
  # values from Heffernan and Tawn (2004) Table 4.
  # Note values in published Table 4 for u_{Xi} in cols NO2 and NO Winter were reversed.
  
  htsummer <- rbind(mqu=c(43, 43, 66.1, 22, 46),
                    mth = c(.9, .7, .7, .85, .7),
                    sigma = c(15.8, 9.1, 32.2, 42.9, 22.8),
                    xi = c(-.29, .01, .02, .08, .02))
  
  htwinter <- rbind(mqu=c(28, 49, 151.6, 23, 53),
                    mth = rep(.7, 5),
                    sigma = c(6.2, 9.3, 117.4, 19.7, 37.5),
                    xi = c(-.37, -.03, -.09, .11, -.2))
  
  summer.gpd <- coef(migpd(summer, mqu=htsummer[2,],penalty="none"))
  winter.gpd <- coef(migpd(winter, mqu=htwinter[2,],penalty="none"))
  
  tol <- c(1, 0.05, .5, 0.5)
  for(i in 1:4){
      expect_equal(htsummer[i, ], unname(summer.gpd[i,]),
                   tolerance=tol[i], label=paste("migpd:Table4summer", i))
      expect_equal(htwinter[i, ], unname(winter.gpd[i,]),
                   tolerance=tol[i], label=paste("migpd:Table4winter", i))
  }
  
  # check excecution for 2-d data
  
  wavesurge.fit <- migpd(wavesurge,mqu=.7)
  expect_equal(wavesurge.fit$models$wave$loglik,
               evm(wavesurge$wave, qu=0.7)$loglik,
               tolerance=0.001,
               label="migpd: 2-d data gpd fit wave")
  
}
)
