library(swephR)


### Name: Section6
### Title: Section 6: Eclipses, Risings, Settings, Meridian Transits,
###   Planetary Phenomena
### Aliases: Section6 swe_sol_eclipse_when_loc swe_lun_eclipse_when_loc
###   swe_lun_eclipse_how swe_lun_eclipse_when swe_rise_trans_true_hor
###   swe_pheno_ut swe_pheno swe_azalt swe_azalt_rev swe_refrac_extended
###   swe_heliacal_ut swe_vis_limit_mag swe_heliacal_pheno_ut
###   swe_topo_arcus_visionis swe_heliacal_angle

### ** Examples

data(SE)
swe_sol_eclipse_when_loc(1234567,SE$FLG_MOSEPH,c(0,50,10),FALSE)
swe_lun_eclipse_when_loc(1234567,SE$FLG_MOSEPH,c(0,50,10),FALSE)
swe_lun_eclipse_how(1234580.19960447,SE$FLG_MOSEPH,c(0,50,10))
swe_lun_eclipse_when(1234567,SE$FLG_MOSEPH,SE$ECL_CENTRAL,FALSE)
swe_rise_trans_true_hor(1234567.5,SE$SUN,"",SE$FLG_MOSEPH,0,c(0,50,10),1013.25,15,0)
swe_pheno_ut(1234567,1,SE$FLG_MOSEPH)
swe_pheno(1234567,1,SE$FLG_MOSEPH)
swe_azalt(1234567,SE$EQU2HOR,c(0,50,10),15,1013.25,c(186,22))
swe_azalt_rev(1234567,SE$ECL2HOR,c(0, 50,10),c(123,2))
swe_refrac_extended(2,0,1013.25,15,-0.065,SE$TRUE_TO_APP)
swe_heliacal_ut(1234567,c(0,50,10),c(1013.25,15,50,0.25),c(25,1,1,1,5,0.8),"sirius",
  SE$HELIACAL_RISING,SE$HELFLAG_HIGH_PRECISION+SE$FLG_MOSEPH)
swe_vis_limit_mag(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),'sirius',
  SE$HELFLAG_HIGH_PRECISION+SE$FLG_MOSEPH)
swe_heliacal_pheno_ut(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),'sirius',
  SE$HELIACAL_RISING,SE$HELFLAG_HIGH_PRECISION+SE$FLG_MOSEPH)
swe_topo_arcus_visionis(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),
  SE$HELFLAG_HIGH_PRECISION+SE$HELFLAG_OPTICAL_PARAMS,-1,124,2,120,0,-45)
swe_heliacal_angle(1234567.5,c(0,50,10),c(1013.25,15,20,0.25),c(25,1,1,1,5,0.8),
  SE$HELFLAG_HIGH_PRECISION+SE$HELFLAG_OPTICAL_PARAMS,-1,124,120,0,-45)



