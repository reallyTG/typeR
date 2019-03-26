library(gsw)


### Name: gsw_frazil_properties_potential_poly
### Title: Properties of Frazil ice i.t.o. potential enthalpy (polynomial
###   version)
### Aliases: gsw_frazil_properties_potential_poly

### ** Examples

SA_bulk <- c(     34.7118,   34.8915,   35.0256,   34.8472,   34.7366,   34.7324)
h_pot_bulk <- c(-4.5544e4, -4.6033e4, -4.5830e4, -4.5589e4, -4.4948e4, -4.4027e4)
p <- c(                10,        50,       125,       250,       600,      1000)
r <- gsw_frazil_properties_potential_poly(SA_bulk, h_pot_bulk, p)
expect_equal(r$SA_final, c(39.098264696022831, 39.343217436835218, 39.434244243586633,
                         39.159511498029801, 38.820458704205542, 38.542256756176229))
expect_equal(r$CT_final, c(-2.155537691991377, -2.200841508940901, -2.264094318382661,
                         -2.344613208230164, -2.598663953454472, -2.900948531145453))
expect_equal(r$w_Ih_final, c(0.112190777010854, 0.113150823111566, 0.111797356032850,
                           0.110121687760246, 0.105198620534670, 0.098848824039493))



