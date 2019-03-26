data("checkerboardData", package = "drugCombo")
data1 <- checkerboardData[checkerboardData$exp == 8, ]

context("tauSurface")

monoConstraints <- c(b = 1, m1 = 0, m2 = 0)
mono <- fitMarginals(data1, fixed = monoConstraints)


fitSymbolic1 <- fitModel(data1, mono, model = "linear1", stage = 1)
fitSymbolic2 <- fitModel(data1, mono, model = "linear1", stage = 2)
fitSymbolic3 <- fitModel(data1, mono, model = "linear2", stage = 1)

fitSep1 <- fitModel(data1, mono, model = "separate1", stage = 1)
fitExp1 <- fitModel(data1, mono, tauFormula = ~ exp(tau1 + tau2*log(d1) + tau3*log(d2)), tauStart = 0)
fitLiteral1 <- fitModel(data1, mono, tauFormula = ~tau1+tau2*log10(d1), stage = 1)
fitLiteral2 <- fitModel(data1, mono, tauFormula = ~tau1+tau2*log10(d1), stage = 2)

tauSep1 <- getTauSurface(fitSep1)

test_that("tau surface calculation gives the same result for symbolic/literal specification, wald", {
      
      # wald
      tauSym1 <- getTauSurface(fitSymbolic1)
      tauLit1 <- getTauSurface(fitLiteral1)
      
      expect_warning(tauSym2 <- getTauSurface(fitSymbolic2), "error propagation")
      expect_warning(tauLit2 <- getTauSurface(fitLiteral2), "error propagation")
      
      expect_equal(tauLit1$data, tauSym1$data, tolerance = 1e-4)
      expect_equal(tauLit2$data, tauSym2$data, tolerance = 1e-4)
      
    })

test_that("bootstrap: symbolic/literal specification, resampling", {
      
      skip_on_cran()
      
      seed <- sample(1:1000, 1)

      tauSymR1 <- getTauSurface(fitSymbolic1, method = "boot", niter = 2, seed = seed, resample = "all")
      tauSymR2 <- getTauSurface(fitSymbolic1, method = "boot", niter = 2, resample = "mono")
      tauSymR3 <- getTauSurface(fitSymbolic1, method = "boot", niter = 2, resample = "stratified")

      tauLit1 <- getTauSurface(fitLiteral1, method = "boot", niter = 2, seed = seed)
      
      expect_equal(tauSymR1$data$tau, tauSymR2$data$tau, tolerance = 1e-4)
      expect_equal(tauSymR1$data$tau, tauSymR3$data$tau, tolerance = 1e-4)
      
      
      expect_equal(dim(tauSymR1$bootstrapCoefs), c(2, 2))
      expect_equal(tauSymR1$bootstrapCoefs, bootstrapCoefs(tauLit1), tolerance = 1e-4)
      expect_equivalent(tauSymR1$data, tauLit1$data, tolerance = 1e-4)
      
    })

test_that("tau surface calculation gives the same result with/without tauLog", {
      
      fitSepLog1 <- fitModel(data1, mono, model = "separate1", tauLog = TRUE)
      
      coef1 <- coef(fitSep1)[grepl("tau", names(coef(fitSep1)))]
      coefLog1 <- coef(fitSepLog1)[grepl("tau", names(coef(fitSepLog1)))]
      
      expect_equivalent(coef1, exp(coefLog1), tolerance = 1e-4)
      
      tauSepLog1 <- getTauSurface(fitSepLog1)
      
      expect_equal(tauSep1, tauSepLog1, tolerance = 1e-4)
      
    })

test_that("tau surface calculation works if tau is fixed", {
      
      data2 <- checkerboardData[checkerboardData$exp == 2, ]
      
      # literal
      fitLitFix <- fitModel(data2, tauFormula = ~tau1+tau2*log10(d1), stage = 1, fixed = c(tau1 = 0.6))
      
      expect_silent(getTauSurface(fitLitFix))
      
      # symbolic
      fitSepFixLog <- fitModel(data1, mono, model = "separate1", tauLog = TRUE, fixed = c(logtau1 = 0))
      
      expect_silent(getTauSurface(fitSepFixLog))
      
    })


test_that("bootstrap coefficients are returned", {
      
      skip_on_cran()
      
      niter <- 4
      
      tauSep1b <- getTauSurface(fitSep1, method = "boot", niter = niter)	
      
      expect_warning(expect_null(bootstrapCoefs(tauSep1)), "No bootstrap")
      expect_equal(
          dim(bootstrapCoefs(tauSep1b)), 
          c(niter-length(Filter(Negate(is.null), tauSep1b$bootstrapErrors)), fitSep1$nTaus)
      # foresee potential errors in the bootstrap
      )
      
    })


context("tauSurface plots")

test_that("plots work for tauSurface", {
      
      tauSym1 <- getTauSurface(fitSymbolic1)
      tauLit1 <- getTauSurface(fitLiteral1)
      
      tauSym3 <- getTauSurface(fitSymbolic3)
      
      tauExp1 <- getTauSurface(fitExp1)
      
      plot(tauSep1, continuous = TRUE)
      plot(tauExp1, continuous = FALSE, side = "d2")
      
      plot(tauSep1, tauExp1, continuous2 = FALSE)
      expect_warning(plot(tauSep1, tauExp1), "interpret")
      expect_warning(plot(tauSym1, tauSep1), "interpret")
      
      expect_warning(plot(tauSym3, tauSep1), "interpret")
      plot(tauSym1, "3d", continuous = FALSE)
      plot(tauSym1, tauLit1)
      expect_warning(plot(tauSym1, tauSym3, continuous = FALSE, 
              continuous2 = TRUE, addLine = TRUE), "interpret")
      
      expect_warning(plot(tauSym1, side = "d2"), "d1")
      expect_warning(plot(tauSym1, tauLit1, continuous = FALSE, 
              continuous2 = FALSE, addLine = TRUE), "interpret")
      
    }) 

test_that("plots work for tauSurface without CI", {
      
      tauSym1 <- getTauSurface(fitSymbolic1, addCI = FALSE)
      tauSym2 <- getTauSurface(fitSymbolic1, addCI = TRUE)
      tauLit1 <- getTauSurface(fitLiteral1, addCI = FALSE)
      
      expect_silent({
            plot(tauSym1)
            plot(tauSym1, continuous = FALSE)
            
            plot(tauSym1, "3d")
            plot(tauSym1, "3d", continuous = FALSE)
            
            plot(tauSym1, tauSym2)
          })
    }) 
