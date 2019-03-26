library(gsw)


### Name: gsw_frazil_ratios_adiabatic_poly
### Title: Ratios of SA, CT and p changes when Frazil Ice Forms (polynomial
###   form)
### Aliases: gsw_frazil_ratios_adiabatic_poly

### ** Examples

SA <- c(  34.7118,   34.8915,   35.0256,   34.8472,   34.7366,   34.7324)
p <- c(        10,        50,       125,       250,       600,      1000)
w_Ih <- c(    0.9,      0.84,       0.4,      0.25,      0.05,      0.01)
r <- gsw_frazil_ratios_adiabatic_poly(SA, p, w_Ih)
expect_equal(r$dSA_dCT_frazil, c(3.035308957896530, 1.932631198810934, 0.613220785586734,
                               0.516106221687200, 0.436657158542033, 0.425827675768018))
expect_equal(r$dSA_dP_frazil/1e-6, c(-0.197512213108610, -0.133280971893621, -0.045599951957139,
                                   -0.038820466574251, -0.033548047632788, -0.033352365425407))
expect_equal(r$dCT_dP_frazil/1e-7, c(-0.650715350062703, -0.689634794137768, -0.743613932027895,
                                   -0.752179782823459, -0.768292629045686, -0.783236208526200))



