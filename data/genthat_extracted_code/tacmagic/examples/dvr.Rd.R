library(tacmagic)


### Name: dvr
### Title: Distribution volume ratio (DVR) for one or more ROIs
### Aliases: dvr

### ** Examples

f <- system.file("extdata", "AD06.tac", package="tacmagic")
fv <- system.file("extdata", "AD06_TAC.voistat", package="tacmagic")
AD06_tac <- load_tac(f, format="PMOD")
AD06_volume <- load_vol(fv, format="voistat")
AD06 <- tac_roi(tac=AD06_tac, volumes=AD06_volume, ROI_def=roi_ham_pib(),  
                merge=FALSE, PVC=FALSE)  

AD06_DVRs <- dvr(AD06, ref="cerebellum", k2prime=0.2, t_star=23)

AD06_DVR <- dvr(AD06, target="frontal", ref="cerebellum", 
             k2prime=0.2, t_star=23)



