context("tests of function CodomMarker")

wd <- getwd()

test_that("Load the fitPoly_data", {
  result <- data(fitPoly_data)
  expect_equal(result, "fitPoly_data")
  expect_equal(length(fitPoly_data), 4)
})

test_that("4x - multiple populations original example Gerrit Gort", {
  #without population structure, ploidy=4:
  loadvars <- load("../testdata/SNP5815.RData")
  expect_equal(loadvars, "SNP5815")
  setwd(tempdir()) # using testthat, all plots will be saved in Rplots.pdf in the working directory
  #                  but normally CodomMarker just shows them in a window
  cdm <- CodomMarker(SNP5815$ratio, ng=5)
  expect_equal(nrow(cdm$psi$p), 1)
  expect_equal(cdm$loglik, 2270.677, tolerance=1e-4)
  #with population structure, ploidy=4:
  cdm <- CodomMarker(y=SNP5815$ratio, ng=5, pop=SNP5815$pop,
                     pop.parents=matrix(c(1,2,NA,NA,NA,NA), ncol=2, byrow=TRUE))
  expect_equal(names(cdm), "message")
  expect_equal(cdm$message, "Error2 in CodomMarker: invalid pop.parents")
  pop.parents <- matrix(c(2,3,NA,NA,NA,NA,NA,NA), ncol=2, byrow=TRUE)
  rownames(pop.parents) <- c("F1", "P1", "P2", "X")
  cdm <- CodomMarker(y=SNP5815$ratio, ng=5,
                     pop=SNP5815$pop, pop.parents=pop.parents)
  expect_equal(cdm$message, "")
  expect_equal(cdm$loglik, 2329.402, tolerance=1e-4) #with p.free for panel
  ptype <- c("p.F1", "p.free", "p.free")
  cdm <- CodomMarker(y=SNP5815$ratio, ng=5,
                     pop=SNP5815$pop, pop.parents=pop.parents, ptype=ptype)
  expect_equal(cdm$message, "Error2 in CodomMarker: length(ptype) different from nrow(pop.parents)")
  ptype <- c("p.F1", "p.free", "p.free", "p.HW")
  cdm <- CodomMarker(y=SNP5815$ratio, ng=5,
                     pop=SNP5815$pop, pop.parents=pop.parents, ptype=ptype)
  expect_equal(cdm$message, "")
  expect_equal(cdm$loglik, 1922.47, tolerance=1e-4) #with p.HW for panel
  expect_equal(apply(cdm$post[SNP5815$pop %in% c("P1", "P2"),], 1, which.max),
               c(3, 5, 3, 5)) #parental dosages 2 and 4
  #  this is not the optimal solution (a.o. it has a dip);
  #  see the test of fitPoly for a better one
})

test_that("6x - multiple populations", {
  #loadvars <- load("../testdata/6x.RData")
  #expect_equal(loadvars, c("dat6x", "pop6x", "pop.par6x",
  #                         "parPriors6x", "sampPriors6x", "startmeans6x"))
  mrkdat <- fitPoly_data$ploidy6$dat6x[fitPoly_data$ploidy6$dat6x$MarkerName == "mrk001",]
  #without population structure, ploidy=6:
  cdm <- CodomMarker(mrkdat$ratio)
  expect_equal(cdm$message,
               "Error2 in CodomMarker: argument \"ng\" is missing, with no default")
  cdm <- CodomMarker(mrkdat$ratio, ng=7)
  expect_equal(length(cdm$psi$mu), 7) #free mu's
  expect_equal(cdm$psi$mu[1], 0.244 , tolerance=1e-3)
  cdm <- CodomMarker(mrkdat$ratio, ng=7, mutype=5) #restricted mu's
  expect_equal(cdm$psi$mu[1], 0.234 , tolerance=1e-3)
  expect_equal(cdm$loglik, 536.5062, tolerance=5.0)
  #with population structure, ploidy=6:
  #pop.parents and pop must be in matrix / integer form for CodomMarker,
  #pop.par6x is already sorted as required
  #convert pop.par6x to matrix:
  pop.parents <- matrix(NA, nrow=nrow(fitPoly_data$ploidy6$pop.par6x), ncol=2)
  rownames(pop.parents) <- fitPoly_data$ploidy6$pop.par6x[,1]
  pop.parents[,1] <- match(fitPoly_data$ploidy6$pop.par6x[,2],
                           fitPoly_data$ploidy6$pop.par6x[,1])
  pop.parents[,2] <- match(fitPoly_data$ploidy6$pop.par6x[,3],
                           fitPoly_data$ploidy6$pop.par6x[,1])
  #convert population to integer:
  pop <- fitPoly_data$ploidy6$pop6x$Population[
    match(as.character(mrkdat$SampleName),
          as.character(fitPoly_data$ploidy6$pop6x$SampleName))]
  pop <- match(pop, fitPoly_data$ploidy6$pop.par6x[,1])
  #set the ptype for each population:
  ptype <- rep("p.HW", nrow(pop.parents))
  ptype[!is.na(pop.parents[,1])] <- "p.F1"
  ptype[unique(pop.parents)] <- "p.free" #all F1 parents
  cdm <- CodomMarker(y=mrkdat$ratio, ng=7,
                     pop=pop, pop.parents=pop.parents,
                     mutype=5, ptype=ptype)
  expect_equal(cdm$loglik, 627.7964, tolerance=5.0)
  expect_equal(length(cdm$psi$mu), 7)
  expect_equal(nrow(cdm$psi$p), 12)
})

test_that("3x", {
  #loadvars <- load("../testdata/3x.RData")
  #expect_equal(loadvars, c("dat3x", "pop3x", "pop.par3x"))
  mrkdat <- fitPoly_data$ploidy3$dat3x[fitPoly_data$ploidy3$dat3x$MarkerName == "mrk039",]
  expect_equal(nrow(mrkdat), 152)

  #without population structure, ploidy=3:
  cdm <- CodomMarker(mrkdat$ratio, ng=4)
  expect_equal(length(cdm$psi$mu), 4) #free mu's
  #with population structure, ploidy=3, no F1's:
  #(artificial, actually only one population)
  pop.parents <- matrix(c(NA,NA,NA,NA), ncol=2, byrow=TRUE) #2 panels
  rownames(pop.parents) <- c("panel1", "panel2")
  pop <- c(rep(1, 90), rep(2, 62))
  ptype <- c("p.HW", "p.HW")
  cdm <- CodomMarker(y=mrkdat$ratio, ng=4,
                     pop=pop, pop.parents=pop.parents,
                     mutype=5, ptype=ptype)
  expect_equal(dim(cdm$psi$p), c(2, 4))
  #with population structure including F1,
  #not allowed for odd ploidy (again, artificial, not real situation)
  pop.parents <- matrix(c(2,3,NA,NA,NA,NA), ncol=2, byrow=TRUE)
  rownames(pop.parents) <- c("F1", "P1", "P2")
  pop <- c(2, 3, 3, rep(1, 149))
  ptype <- c("p.F1", "p.free", "p.free")
  cdm <- CodomMarker(y=mrkdat$ratio, ng=4,
                     pop=pop, pop.parents=pop.parents,
                     mutype=5, ptype=ptype)
  expect_equal(cdm[[1]], "Error2 in CodomMarker: ptype p.F1 not allowed with odd ploidy")
})

test_that("2x", {
  #loadvars <- load("../testdata/2x.RData")
  #expect_equal(loadvars, "dat2x")
  mrkdat <- fitPoly_data$ploidy2$dat2x[fitPoly_data$ploidy2$dat2x$MarkerName == "mrk001",]
  expect_equal(nrow(mrkdat), 255)

  #without population structure, ploidy=2:
  cdm <- CodomMarker(mrkdat$ratio, ng=3, plothist=TRUE)
  expect_equal(length(cdm$psi$mu), 3) #free mu's
})

setwd(wd) #restore wd for next tests
