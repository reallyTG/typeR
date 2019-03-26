## ----setup, include = FALSE----------------------------------------------
library(tacmagic)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
# Filename is a character string of the file's path on your computer.
filename <- system.file("extdata", "AD06.tac", package="tacmagic")
# Note: This file can also serve as a template if the TAC data is in some other 
# format that is not yet supported.

AD06_tac <- load_tac(filename, format="PMOD")

## ------------------------------------------------------------------------
summary(AD06_tac) 

AD06_tac[1:5,1:5] # the first 5 frames of the first 3 ROIs

## ------------------------------------------------------------------------
filename_acq <- system.file("extdata", "AD06.acqtimes", package="tacmagic")
filename_voistat <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")

tac2 <- load_tac(filename_voistat, format="voistat", acqtimes=filename_acq)

all.equal(AD06_tac, tac2)

## ------------------------------------------------------------------------
f_magia <- system.file("extdata", "AD06_tac_magia.mat", package="tacmagic")

AD06_tac_magia <- load_tac(f_magia, format="magia", 
                           time_unit="seconds", activity_unit="kBq/cc")

AD06_tac_magia[1:5,1:5]

## ------------------------------------------------------------------------
manual <- data.frame(start=c(0:4), end=c(2:6), ROI1=c(10.1:14.2), ROI2=c(11:15))
manual_tac <- as.tac(manual, time_unit="minutes", activity_unit="kBq/cc")

summary(manual_tac)

## ------------------------------------------------------------------------
AD06_volume <- load_vol(filename_voistat, format="voistat")

roi_ham_pib()[1:2] # The first 2 definitions of merged ROIs, as an example.

AD06 <- tac_roi(tac=AD06_tac,           # The TAC file we loaded above.
                volumes=AD06_volume,    # Volume information loaded.
                ROI_def=roi_ham_pib(),  # ROI definitions for the Hammers atlas
                merge=F,                # T to also return atomic ROIs
                PVC=F                   # to use _C ROIs (PMOD convention)            
                )

AD06[1:5,1:5]

## ---- fig.show='hold', fig.height=4.5, fig.width=6.5, fig.align='center'----
plot(AD06,                                                    # TAC data
     ROIs=c("frontal", "temporal", "parietal", "cerebellum"), # ROIs to plot
     time="minutes",                   # Convert x axis from seconds to minutes
     title="PIB time activity curves for AD06"        # A title for the plot
     )

## ------------------------------------------------------------------------
AD06_SUVR <- suvr(AD06,                       # TAC data
                  SUVR_def=c(3000,3300,3600), # = 50-70 minute window
                  ref="cerebellum"            # reference region in TAC data
                  )

AD06_SUVR


## ------------------------------------------------------------------------
AD06_altSUVR <- suvr_auc(AD06, SUVR_def=c(3000,3300,3600), ref="cerebellum")

all.equal(AD06_SUVR, AD06_altSUVR) # Should be similar but not exact


## ------------------------------------------------------------------------
AD06_DVR_fr <- DVR_ref_Logan(AD06, 
                             target="frontal", # target ROI
                             ref="cerebellum", # reference region
                             k2prime=0.2,      # suitable k2' for tracer
                             t_star=0,        # 0 to find, or can specify frame
                             )

AD06_DVR_fr$DVR


## ---- fig.show='hold', fig.height=4.5, fig.width=6.5, fig.align='center'----
plot(AD06_DVR_fr)


## ------------------------------------------------------------------------
AD06_DVR <- DVR_all_ref_Logan(AD06, ref="cerebellum", k2prime=0.2, t_star=23)

AD06_DVR


## ------------------------------------------------------------------------
ADO6_frontal_DVR <- dvr(AD06, target="frontal", ref="cerebellum", k2prime=0.2, 
                        t_star=23)


## ------------------------------------------------------------------------

participants <- c(system.file("extdata", "AD06.tac", package="tacmagic"),
                   system.file("extdata", "AD07.tac", package="tacmagic"),
                   system.file("extdata", "AD08.tac", package="tacmagic"))

tacs <- batch_load(participants, dir="", tac_file_suffix="")

# Since the PMOD TAC files used here have 2 copies of ROIs, with and without 
# PVC, we can use split_pvc to keep the PVC-corrected verions. If we had used 
# roi_m here to combine ROIs, we could have specified to use the PVC versions 
# in batch_load() with PVC = TRUE.
tacs <- lapply(tacs, split_pvc, PVC=TRUE)
 
batch <- batch_tm(tacs, models=c("SUVR", "Logan"), ref="Cerebellum_r_C",
                  SUVR_def=c(3000,3300,3600), k2prime=0.2, t_star=23)


## ------------------------------------------------------------------------
fake_DVR[1:5,]


## ------------------------------------------------------------------------
cutoffs <- cutoff_aiz(fake_DVR, c("ROI1_DVR", "ROI2_DVR", "ROI3_DVR", "ROI4_DVR"))

cutoffs


## ------------------------------------------------------------------------
positivity_table <- pos_anyroi(fake_DVR, cutoffs)

positivity_table


