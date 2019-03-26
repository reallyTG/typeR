# test_suvr.R

context("SUVR calculation")

test_that("suvr() calculates SUVR as expected, from a sample file", {

  f_ans_nc <- system.file("extdata", "AD06_man_fullROI.csv", 
                          package="tacmagic")
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic")
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  ans <- read.csv(f_ans_nc)

  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)

  calculated_tac <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=F)

  # this SUVR_def includes varying frame lengths so is a good test
  calculated_result <- suvr(calculated_tac, c(3000, 3300, 3600), "cerebellum")

  SUVR <- c(2.070908798, 2.200106515, 2.043683307, 2.176933294, 2.054232043, 
  	        2.169382405, 1.659831416, 1.827764715, 2.348674364, 2.396374707,
  	        2.136008796, 2.110140275, 2.112264146, 1.744257967, 2.371747235, 1,	
  	        2.073093282, 1.788911547, 1.755388731, 1.77227164, 0.902194996, 
  	        2.03576762)
  ROIs <- c("leftfrontal", "rightfrontal", "lefttemporal", "righttemporal", 
            "leftparietal", "rightparietal", "leftoccipital", "rightoccipital", 
            "leftcingulate", "rightcingulate", "frontal", "temporal", 
            "parietal", "occipital", "cingulate", "cerebellum", 
            "totalcortical", "leftdeep", "rightdeep", "deep", "ventricles", 
            "whitematter")
  manual <- data.frame(row.names=ROIs, SUVR)

  expect_equal(manual, calculated_result)

})

test_that("suvr_auc() produces similar results as suvr()", {
  
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic")
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)

  calculated_tac <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=F)

  calculated_result <- suvr_auc(calculated_tac, c(3000, 3300, 3600), 
                                "cerebellum")

  SUVR <- c(2.070908798, 2.200106515, 2.043683307, 2.176933294, 2.054232043, 
            2.169382405, 1.659831416, 1.827764715, 2.348674364, 2.396374707,
            2.136008796, 2.110140275, 2.112264146, 1.744257967, 2.371747235, 1, 
            2.073093282, 1.788911547, 1.755388731, 1.77227164, 0.902194996, 
            2.03576762)

  ROIs <- c("leftfrontal", "rightfrontal", "lefttemporal", "righttemporal", 
            "leftparietal", "rightparietal", "leftoccipital", "rightoccipital", 
            "leftcingulate", "rightcingulate", "frontal", "temporal", 
            "parietal", "occipital", "cingulate", "cerebellum", 
            "totalcortical", "leftdeep", "rightdeep", "deep", "ventricles", 
            "whitematter")

  manual <- data.frame(row.names=ROIs, SUVR)

  expect_equal(manual, calculated_result, tol=0.01)
})
