library(gsw)


### Name: gsw_frazil_ratios_adiabatic
### Title: Ratios of SA, CT and p changes when Frazil Ice Forms
### Aliases: gsw_frazil_ratios_adiabatic

### ** Examples

SA <- c(  34.7118,   34.8915,   35.0256,   34.8472,   34.7366,   34.7324)
p <- c(        10,        50,       125,       250,       600,      1000)
w_Ih <- c(    0.9,      0.84,       0.4,      0.25,      0.05,      0.01)
r <- gsw_frazil_ratios_adiabatic(SA, p, w_Ih)
expect_equal(r$dSA_dCT_frazil, c(3.035152370800401, 1.932548405396193, 0.613212115809003,
                               0.516103092738565, 0.436656742034200, 0.425827266533876))
expect_equal(r$dSA_dP_frazil/1e-6, c(-0.197406834470366, -0.133213926580032, -0.045580136143659,
                              -0.038806356507548, -0.033541272953744, -0.033350141194082))
expect_equal(r$dCT_dP_frazil/1e-7, c(-0.650401727338347, -0.689317412221414, -0.743301297684333,
                                   -0.751910946738026, -0.768138213038669, -0.783184728059898))



