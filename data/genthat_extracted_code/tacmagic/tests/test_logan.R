# test_logan.R

context("Non-invasive Logan graphical method")

test_that("DVR_all_ref_Logan() produces the same results as existing tools", {

  # Prepare tac data ----------------------------------------------------------
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic")
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)

  AD06_tac_nc <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=F)

  # Calculate Logan DVRs with different settings ------------------------------
  nok2_integrate <- DVR_all_ref_Logan(AD06_tac_nc, 
                                      ref="cerebellum", 
                                      k2prime=NULL, 
                                      t_star=24, 
                                      method="integrate")

  k2_integrate <- DVR_all_ref_Logan(AD06_tac_nc, 
                                    ref="cerebellum", 
                                    k2prime=0.2, 
                                    t_star=24, 
                                    method="integrate")

  nok2_trapz <- DVR_all_ref_Logan(AD06_tac_nc, 
                                    ref="cerebellum", 
                                    k2prime=NULL, 
                                    t_star=24, 
                                    method="trapz")

  k2_trapz <- DVR_all_ref_Logan(AD06_tac_nc, 
                                ref="cerebellum", 
                                k2prime=0.2, 
                                t_star=24, 
                                method="trapz")  

  # externally calculated data-------------------------------------------------

  #c("leftfrontal", "rightfrontal", "lefttemporal", "righttemporal", 
  #"leftparietal", "rightparietal", "leftoccipital", "rightoccipital", 
  #"leftcingulate", "rightcingulate", "frontal", "temporal", "parietal", 
  #"occipital", "cingulate", "cerebellum", "totalcortical")

  tpcc_logan_nok2 <- c(1.7315,1.8223,1.7025,1.7985,1.7137,1.7989,1.4318,1.5549,
                     1.9185,1.9504,1.7773,1.7505,1.7567,1.4936,1.9342,1,1.7285)
  
  tpcc_logan_k2 <- c(1.7564,1.8467,1.7251,1.8210,1.7429,1.8282,1.4535,1.5803,
                   1.9468,1.9820,1.8021,1.7731,1.7859,1.5172,1.9642,1,1.7537)

  # tests ---------------------------------------------------------------------
  expect_equal(nok2_integrate[1:17,], tpcc_logan_nok2, tolerance=0.0001)
  expect_equal(nok2_trapz[1:17,], tpcc_logan_nok2, tolerance=0.0001)
  expect_equal(k2_integrate[1:17,], tpcc_logan_k2, tolerance=0.0001)
  expect_equal(k2_trapz[1:17,], tpcc_logan_k2, tolerance=0.0001)


  # can run without error ----------------------------------------------------- 
  nok2_integrate_t0 <- DVR_all_ref_Logan(AD06_tac_nc, 
                                         ref="cerebellum", 
                                         k2prime=NULL, 
                                         t_star=0, 
                                         method="integrate")

})


test_that("plot_ref_logan creates the plots without error", {

  f <- system.file("extdata", "AD06.tac", package="tacmagic")
  fv <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
  AD06_tac <- load_tac(f, format="PMOD")
  AD06_volume <- load_vol(fv, format="voistat")

  AD06 <- tac_roi(tac=AD06_tac,          
                  volumes=AD06_volume, ROI_def=roi_ham_pib(), merge=F, PVC=F)

  AD06_Logan <- DVR_ref_Logan(AD06, target="frontal", ref="cerebellum", 
                              k2prime=0.2, t_star=0) 

  pdf(NULL)
  on.exit(dev.off())
  dev.control(displaylist="enable")

  plot(AD06_Logan)

  p <- recordPlot()

  sample <- as.vector(unlist(unlist(p)[c(123, 124,304, 305, 317, 318,586)]))
  expected <- c("Time (minutes)", "Activity (kBq/cc)", "frontal", "cerebellum",
                "frontal", "cerebellum", "Logan plot")

  skip_on_cran()
  expect_identical(sample, expected)

})


test_that("find_t_star gets right answer for reasonable parameters", {

  x <- c(1,2,3,4,5,6,7,8,9,10)
  y <- c(1,2,3,4,5,6,7,8,9,10)
  
  expect_equal(find_t_star(x,y), 1)

  x[[1]] <- 5

  expect_equal(find_t_star(x,y), 2)

  x[[1]] <- 1
  y[[5]] <- 20

  expect_equal(find_t_star(x,y), 6)

  x[[1]] <- 1
  x[[9]] <- 1

  expect_error(find_t_star(x,y))

  x <- c(1,2,3,4,5,6,7,8,9,10)
  y <- c(-1,-2,-3,-4,-5,-6,-7,-8,-9,-10)

  expect_equal(find_t_star(x,y), 1)

  x[[1]] <- 1.2

  expect_equal(find_t_star(x,y), 2)
  expect_equal(find_t_star(x,y, error=0.15), 1)

})


test_that("dvr() wrapper produces same results as functions it calls", {

  f <- system.file("extdata", "AD06.tac", package="tacmagic")
  fv <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
  AD06_tac <- load_tac(f, format="PMOD")
  AD06_volume <- load_vol(fv, format="voistat")

  AD06 <- tac_roi(tac=AD06_tac,          
                  volumes=AD06_volume, ROI_def=roi_ham_pib(), merge=F, PVC=F)

  a_AD06_Logan <- DVR_ref_Logan(AD06, target="frontal", ref="cerebellum", 
                              k2prime=0.2, t_star=0) 

  b_AD06_Logan <- dvr(AD06, target="frontal", ref="cerebellum", 
                              k2prime=0.2, t_star=0) 

  c_AD06_Logan <- DVR_all_ref_Logan(AD06, ref="cerebellum", 
                              k2prime=0.2, t_star=0) 

  d_AD06_Logan <- dvr(AD06, ref="cerebellum", k2prime=0.2, t_star=0) 

  expect_equal(a_AD06_Logan$DVR, b_AD06_Logan)

  expect_equal(c_AD06_Logan, d_AD06_Logan)

})
