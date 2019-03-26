cat("\ntest of IsoriX compatibility:")

if (requireNamespace("IsoriX",quietly=TRUE)) { ## Checks that exports/imports are OK
  IsoriX::options_IsoriX(spaMM.options("example_maxtime")) ## Set to 201 for running  the full test
  IsoriX::options_IsoriX(dont_ask = TRUE) ## for plots
  if ( exists("GermanFit")) rm("GermanFit")
  if ( exists("plot.mean.respVar")) rm("plot.mean.respVar")
  if ( exists("calib")) rm("calib")
  if ( exists("assignment.GP")) rm("assignment.GP")
  chk <- try(example("isofit",package="IsoriX",ask=FALSE),silent=TRUE) ## to detect e.g. do_TRACE issues... or corrPars$rho...
  if (inherits(chk,"try-error")) {
    warning(paste('example("isofit")',"produced",chk))
  } else if ( exists("GermanFit")) { ## !exists if IsoriX.getOption("example_maxtime") too low
    testthat::expect_equal(get_ranPars(GermanFit$mean_fit,which="corrPars")[["2"]]$rho,0.0001176491)
    #testthat::expect_equal(get_ranPars(GermanFit$disp.fit,which="corrPars")$rho,0.0001176491) ## lower bound for rho in both cases
  }
  if (spaMM.options("example_maxtime")>700) { ## that would be tests' total time
    chk <- try(example("isoscape",package="IsoriX",ask=FALSE),silent=TRUE) 
    if (inherits(chk,"try-error")) {
      warning(paste('example("isoscape")',"produced",chk))
    } else if ( exists("PlotMeanRespVar")) { ## !exists if IsoriX.getOption("example_maxtime") too low
      try(testthat::expect_equal(GermanScape$isoscapes@data@values[1,"mean_predVar"],c(mean_predVar=24.343934))) ## 148.333653 before same bug correction
      # The values are affected by changes in force_solve; try_gmp is quite different (given GermanFit$mean.fit$lambda[1] = 6.993493e-10)
    }
  } else if (spaMM.options("example_maxtime")>30) {
    # ad-hoc bc builing the sphere is not worth the time
    source("C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests/testthat/nestedFiles/isoscape.R")
    testthat::expect_equal(GermanScape$isoscapes@data@values[1,"disp_predVar"],c(disp_predVar=0.08379131),tol=1e-7) ## 0.0804033 before bug correction in v2.4.87
  }
  if (spaMM.options("example_maxtime")>700) { ## that would be tests' total time
    chk <- try(example("calibfit",package="IsoriX",ask=FALSE),silent=TRUE) 
    if (inherits(chk,"try-error")) {
      warning(paste('example("calibfit")',"produced",chk))
    } else if ( exists("calib")) { ## !exists if IsoriX.getOption("example_maxtime") too low
    }
  } else if (spaMM.options("example_maxtime")>10) {
    # ad-hoc bc builing the additional calibfits is not worth the time
    source("C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests/testthat/nestedFiles/calibfit.R")
    #try(testthat::expect_equal(logLik(CalibAlien$calib_fit),c(p_bv=-1132.78314))) ## -1135.841334 before same bug correction
    try(testthat::expect_equal(logLik(CalibAlien$calib_fit),c(p_bv=-1132.664893))) ## after modif numerical precision predVar
  }
  chk <- try(example("isofind",package="IsoriX",ask=FALSE),silent=TRUE) ## ~101s but the condition is 200
  if (inherits(chk,"try-error")) {
    warning(paste('example("isofind")',"produced",chk))
  } else if ( exists("assignment.GP")) { ## !exists if IsoriX.getOption("example_maxtime") too low
    try(testthat::expect_equal(AssignedGP$group$pv@data@values[12240],0.7814368255))
  }
}
