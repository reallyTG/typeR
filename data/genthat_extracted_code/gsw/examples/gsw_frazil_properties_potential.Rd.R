library(gsw)


### Name: gsw_frazil_properties_potential
### Title: Properties of Frazil ice i.t.o. potential enthalpy
### Aliases: gsw_frazil_properties_potential

### ** Examples

SA_bulk <- c(     34.7118,   34.8915,   35.0256,   34.8472,   34.7366,   34.7324)
h_pot_bulk <- c(-4.5544e4, -4.6033e4, -4.5830e4, -4.5589e4, -4.4948e4, -4.4027e4)
p <- c(                 10,        50,       125,       250,       600,      1000)
r <- gsw_frazil_properties_potential(SA_bulk, h_pot_bulk, p)
expect_equal(r$SA_final, c(39.098258701462051, 39.343217598625756, 39.434254585716296,
                         39.159536295126657, 38.820511558004590, 38.542322667924459))
expect_equal(r$CT_final, c(-2.155553336670014, -2.200844802695826, -2.264077329325076,
                         -2.344567015865174, -2.598559540430464, -2.900814843304696))
expect_equal(r$w_Ih_final, c(0.112190640891586, 0.113150826758543, 0.111797588975174,
                           0.110122251260246, 0.105199838799201, 0.098850365110330))



