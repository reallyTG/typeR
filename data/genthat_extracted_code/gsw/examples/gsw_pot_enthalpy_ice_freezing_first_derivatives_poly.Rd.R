library(gsw)


### Name: gsw_pot_enthalpy_ice_freezing_first_derivatives_poly
### Title: First Derivatives of Potential Enthalpy (Polynomial version)
### Aliases: gsw_pot_enthalpy_ice_freezing_first_derivatives_poly

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_pot_enthalpy_ice_freezing_first_derivatives_poly(SA, p)
expect_equal(r$pot_enthalpy_ice_freezing_SA/1e2,
      c(-1.183498006918154, -1.184135169530602, -1.184626138334419,
      -1.184032656542549, -1.183727371435808, -1.183805326863513))
expect_equal(r$pot_enthalpy_ice_freezing_p/1e-3,
      c(-0.202934280214689, -0.203136950111241, -0.203515960539503,
      -0.204145112153220, -0.205898365024147, -0.207885289186464))



