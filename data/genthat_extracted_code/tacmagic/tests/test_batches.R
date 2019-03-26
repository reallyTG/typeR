# test_batches.R

context("batch_tm produces expected results")

test_that("tac_roi() accurately calculates weighted averages from PMOD .tac and 
	      .voistat files", {
  
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic")
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_pvc <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=T)

  Fake1 <- AD06_tac_pvc
  Fake2 <- AD06_tac_pvc
  Fake1[1:34, c(3:17, 19:24)] <- Fake1[1:34, c(3:17, 19:24)] + 1
  Fake2[1:34, c(3:17, 19:24)] <- Fake2[1:34, c(3:17, 19:24)] + 2

  batch_sim <- list("Fake1"=Fake1, "AD06"=AD06_tac_pvc, "Fake2"=Fake2)

  models_to_run <- c("SUVR", "Logan")
  batch_result <- batch_tm(batch_sim, 
  	                       models=models_to_run, 
  	                       SUVR_def=c(3000, 3300, 3600),
  	                       ref="cerebellum",
  	                       k2prime=0.2,
  	                       t_star=24)

  expect_error(batch_tm(batch_sim, models=c("SUVR", "not"), 
                        SUVR_def=c(3000, 3300, 3600), ref="cerebellum",
                        k2prime=0.2, t_star=24))

  expect_equal(length(roi_ham_full()) * length(models_to_run), 
               length(batch_result))
  expect_equal(3, nrow(batch_result))

  expect_equal(as.numeric(unlist(suvr(Fake1, SUVR_def=c(3000, 3300, 3600),
                                      ref="cerebellum"))), 
               as.numeric(unlist(t(batch_result[1,1:22]))))
  expect_equal(as.numeric(unlist(suvr(AD06_tac_pvc, 
                                      SUVR_def=c(3000, 3300, 3600),
                                      ref="cerebellum"))), 
               as.numeric(unlist(t(batch_result[2,1:22]))))

})

test_that("batch_voistat() loads 3 participants and produces same result as 
           individual load_voistat()", {
  

  participants <- c(system.file("extdata", "AD06_BPnd_BPnd_Logan.voistat", 
                                 package="tacmagic"),
                    system.file("extdata", "AD07_BPnd_BPnd_Logan.voistat", 
                                 package="tacmagic"),
                    system.file("extdata", "AD08_BPnd_BPnd_Logan.voistat", 
                                 package="tacmagic"))

  batchtest <- batch_voistat(participants=participants, ROI_def=roi_ham_pib(), 
                             dir="", filesuffix="", varname="Logan") 

  vs_f <- system.file("extdata", "AD06_BPnd_BPnd_Logan.voistat", 
                      package="tacmagic")
  vs <- load_voistat(vs_f, roi_ham_pib(), model="Logan")

  expect_equal(as.numeric(unlist(vs)), as.numeric(unlist(batchtest[1,])))

})

test_that("batch_load() loads 3 particpants and produces same result as 
           individual load_tac()", {

  participants <- c(system.file("extdata", "AD06.tac", package="tacmagic"),
                    system.file("extdata", "AD07.tac", package="tacmagic"),
                    system.file("extdata", "AD08.tac", package="tacmagic"))

  batchtest <- batch_load(participants, tac_file_suffix="")

  AD06 <- load_tac(system.file("extdata", "AD06.tac", package="tacmagic"))
  AD07 <- load_tac(system.file("extdata", "AD07.tac", package="tacmagic"))
  AD08  <- load_tac(system.file("extdata", "AD08.tac", package="tacmagic"))

  expect_identical(names(batchtest), participants)
  expect_identical(AD06, batchtest[[1]])
  expect_identical(AD07, batchtest[[2]])
  expect_identical(AD08, batchtest[[3]])

})

test_that("batch_load() with merging loads 3 particpants with same result as 
           individual load_tac() and tac_roi()", {

  participants <- c(system.file("extdata", "AD06.tac", package="tacmagic"),
                    system.file("extdata", "AD07.tac", package="tacmagic"),
                    system.file("extdata", "AD08.tac", package="tacmagic"))

  participants <- strtrim(participants, nchar(participants) - 4)

  batchtest2 <- batch_load(participants, tac_file_suffix=".tac", roi_m=TRUE,
                           vol_file_suffix="_TAC.voistat", 
                           vol_format="voistat", merge=TRUE, PVC=FALSE,
                           ROI_def=roi_ham_stand())
  
  AD07 <- load_tac(system.file("extdata", "AD07.tac", package="tacmagic"))
  AD07_vol <- load_vol(system.file("extdata", "AD07_TAC.voistat", 
                       package="tacmagic"))
  AD07_m <- tac_roi(AD07, AD07_vol, roi_ham_stand(), PVC=FALSE, merge=TRUE)

  expect_identical(AD07_m, batchtest2[[2]])

})

test_that("custom functions can be passed to batch_tm()", {

  # Needed helper function (exists as new_table in tacmagic but not exported)
  new_table_out <- function(tac, varname="VALUE") {
    VALUE <- rep(NA, (length(names(tac)) - 2))
    VALUEtable <- data.frame(row.names=names(tac)[-(1:2)], VALUE) 
    names(VALUEtable) <- varname
    return(VALUEtable)
  }

  # the "custom function"
  maxi <- function(tac, ...) {
    table <- new_table_out(tac, "maxi")

    for (ROI in names(tac)[-(1:2)]) {
      maximum <- max(tac[,ROI])
      table[ROI, "maxi"] <- maximum
    }
    return(table)
  }

  #load data
  f_raw_tac <- system.file("extdata", "AD06.tac", package="tacmagic")
  f_raw_vol <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
  tac <- load_tac(f_raw_tac)
  vol <- load_vol(f_raw_vol)
  AD06_tac_pvc <- tac_roi(tac, vol, roi_ham_full(), merge=F, PVC=T)
  Fake1 <- AD06_tac_pvc
  Fake2 <- AD06_tac_pvc
  Fake1[1:34, c(3:17, 19:24)] <- Fake1[1:34, c(3:17, 19:24)] + 1
  Fake2[1:34, c(3:17, 19:24)] <- Fake2[1:34, c(3:17, 19:24)] + 2
  batch_sim <- list("Fake1"=Fake1, "AD06"=AD06_tac_pvc, "Fake2"=Fake2)

  #batch call
  batch_result <- batch_tm(batch_sim, models=c("SUVR"), custom_model=maxi,
                          SUVR_def=c(3000, 3300, 3600), ref="cerebellum",
                          k2prime=0.2, t_star=0)

  
  expect_equal(as.numeric(unlist(suvr(AD06_tac_pvc, 
                                      SUVR_def=c(3000, 3300, 3600),
                                      ref="cerebellum"))), 
               as.numeric(unlist(t(batch_result[2,1:22]))))

  expect_equal(max(AD06_tac_pvc$leftfrontal), 
               batch_result[2,"leftfrontal_custom"])
                          
})
