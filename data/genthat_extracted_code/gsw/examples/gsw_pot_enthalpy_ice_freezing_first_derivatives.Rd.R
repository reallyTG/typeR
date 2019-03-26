library(gsw)


### Name: gsw_pot_enthalpy_ice_freezing_first_derivatives
### Title: First Derivatives of Potential Enthalpy
### Aliases: gsw_pot_enthalpy_ice_freezing_first_derivatives

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_pot_enthalpy_ice_freezing_first_derivatives(SA, p)
expect_equal(r$pot_enthalpy_ice_freezing_SA/1e2,
      c(-1.183484968590718, -1.184125268891200, -1.184619267864844,
      -1.184026131143674, -1.183727706650925, -1.183814873741961))
expect_equal(r$pot_enthalpy_ice_freezing_p/1e-3,
      c(-0.202880939983260, -0.203087335312542, -0.203473018454630,
      -0.204112435106666, -0.205889571619502, -0.207895691215823))



