data("checkerboardData", package = "drugCombo")
data1 <- checkerboardData[checkerboardData$exp == 1, ]

context("monotherapy")

defaultMono <- fitMarginals(data1)
monoConstraints <- c(b = 1, m1 = 0.1, m2 = 0)
fixedMono <- fitMarginals(data1, fixed = monoConstraints)

test_that("monotherapy fitting works", {
      
      expect_s3_class(defaultMono, "MarginalFit")
      expect_length(coef(defaultMono), 7)
      
      expect_s3_class(fixedMono, "MarginalFit")
      expect_length(coef(fixedMono), 7)
      expect_equal(coef(fixedMono)[c("b", "m1", "m2")], monoConstraints)      
      expect_equivalent(as.numeric(fixedMono$model$constraints$vector), 
          monoConstraints)
      
      # default monotherapy fitting      
      expect_message(fitD <- fitModel(data1, model = "uniform", tauLog = TRUE), 
          "Running default monotherapy fitting")
      expect_equal(fitD$mono, defaultMono)
      
    })
 

context("fitModel mono constraints")

test_that("constraints are inherited from the monotherapy fit", {

      expect_message(fitC <- fitModel(data1, fixedMono, model = "uniform", 
              tauLog = TRUE), "Using constraints: b")
      expect_false(any(c("b", "m1", "m2") %in% names(coef(fitC))))
      
    }) 

test_that("constraints overwrite ones from the monotherapy fit", {
      
      expect_message(fitC2 <- fitModel(data1, fixedMono, model = "uniform",
              fixed = c(h1 = 1), tauLog = TRUE), "Using constraints: h1")
      expect_true(all(c("b", "m1", "m2") %in% names(coef(fitC2))))
      expect_false("h1" %in% names(coef(fitC2)))
      
    }) 

test_that("specifying mono constraints in 2-stage fit gives error", {
      expect_error(fitCE <- fitModel(data1, fixedMono, model = "uniform",
              fixed = c(h1 = 1), tauLog = TRUE, stage = 2),
          "Please run monotherapy")
    })

context("fitModel tau constraints")

tauConstraints <- c(tau1 = 1, logtau1 = 0)

test_that("constraints work for tau, symbolic formula", {
      
      fitS <- fitModel(data1, defaultMono, model = "separate1", tauLog = TRUE, 
          fixed = tauConstraints)
      expect_s3_class(fitS, "HarbronFit")
      expect_false("logtau1" %in% names(coef(fitS)))
      expect_true("fixedTau" %in% names(fitS))
      
      tauS <- getTauSurface(fitS)
      plot(tauS)
      tauSb <- getTauSurface(fitS, method = "boot", niter = 2)
      plot(tauSb)
      
      # continuous
      fitS2 <- fitModel(data1, defaultMono, model = "linear1", fixed = tauConstraints)
      expect_s3_class(fitS2, "HarbronFit")
      expect_false("tau1" %in% names(coef(fitS2)))
      expect_true("fixedTau" %in% names(fitS2))
      
      tauS2 <- getTauSurface(fitS2)
      plot(tauS2)
      
    })

test_that("constraints work for tau, symbolic formula, 2 stage", {
      
      fitS <- fitModel(data1, defaultMono, model = "separate1", tauLog = TRUE, 
          fixed = tauConstraints, stage = 2)
      expect_s3_class(fitS, "HarbronFit")
      expect_false("logtau1" %in% names(coef(fitS)))
      expect_true("fixedTau" %in% names(fitS))
      
      expect_warning(tauS <- getTauSurface(fitS))
      plot(tauS)
      
    })


tauConstraints2 <- c(tau1 = 0)

test_that("constraints work for tau, literal formula", {
      
      fitL <- fitModel(data1, defaultMono, model = "zhao", tauStart = 0,
          fixed = tauConstraints2)
      expect_s3_class(fitL, "HarbronFit")
      expect_false("tau1" %in% names(coef(fitL)))
      expect_true("fixedTau" %in% names(fitL))
      expect_equal(fitL$tauModel, "zhao")
      expect_equal(fitL$originalTauFormula, defaultModels()[["zhao"]])
      expect_false(identical(fitL$tauFormula, defaultModels()[["zhao"]]))
            
      # model not pre-defined
      fitL2 <-  fitModel(data1, defaultMono, tauFormula = ~tau1+tau2*log10(d1), fixed = tauConstraints2)
      expect_s3_class(fitL2, "HarbronFit")
      expect_false("tau1" %in% names(coef(fitL2)))
      expect_true("fixedTau" %in% names(fitL2))
      expect_equal(fitL2$nTaus, 2)
            
    })

test_that("formula is not modified if constraints are not used, and modified if they are", {
      
      fit1 <- fitModel(data1, defaultMono, model = "linear1")
      formula1 <- ~tau1+tau2*log10(d1)
      fit2 <- fitModel(data1, defaultMono, tauFormula = formula1, fixed = tauConstraints2)
      
      expect_equal(fit1$tauFormula, defaultModels()[["linear1"]])
      expect_equal(fit2$originalTauFormula, formula1)
      expect_false(identical(fit2$tauFormula, defaultModels()[["linear1"]]))
      
    })

context("general tests")

test_that("fitted objects are the same for different tau specs", {
      
      fitSymbolic1 <- fitModel(data1, defaultMono, model = "linear1", stage = 1)
      fitLiteral1 <-  fitModel(data1, defaultMono, tauFormula = ~tau1+tau2*log10(d1), stage = 1)
      fitSymbolic2 <- fitModel(data1, defaultMono, model = "linear1", stage = 2)
      fitLiteral2 <-  fitModel(data1, defaultMono, tauFormula = ~tau1+tau2*log10(d1), stage = 2)
      
      expect_equal(coef(fitSymbolic1), coef(fitLiteral1), tolerance = 1e-4)
      expect_equal(coef(fitSymbolic2), coef(fitLiteral2), tolerance = 1e-4)
      
      plot(fitSymbolic1)
      plot(fitLiteral1, "2d")
      plot(fitLiteral2, "3d")
      plot(fitSymbolic2, fitLiteral1, side = "d2", modelNames = c("sym", "lit"))
      
    })

test_that("inactiveIn argument works as expected", {
      
      skip_on_cran()
      
      fitU0 <- fitModel(data1, model = "uniform", inactiveIn = 0)
      fitU1 <- fitModel(data1, model = "uniform", inactiveIn = 1)
      fitU2 <- fitModel(data1, model = "uniform", inactiveIn = 2, tauLog = TRUE)
      fitU3 <- fitModel(data1, model = "uniform", inactiveIn = 3)

      expect_equal(fitU0$inactiveIn, 0)
      expect_equal(fitU1$inactiveIn, 1)
      expect_equal(fitU2$inactiveIn, 2)
      expect_equal(fitU3$inactiveIn, 0)

      expect_named(coef(fitU1), c("h2", "b", "m2", "e2", "tau1"))
      expect_named(coef(fitU2), c("h1", "b", "m1", "e1", "logtau1"))
      
      expect_identical(coef(fitU3), coef(fitU0))
      
    })
