library(scales)


### Name: dichromat_pal
### Title: Dichromat (colour-blind) palette (discrete).
### Aliases: dichromat_pal

### ** Examples

show_col(dichromat_pal("BluetoOrange.10")(10))
show_col(dichromat_pal("BluetoOrange.10")(5))

# Can use with gradient_n to create a continous gradient
cols <- dichromat_pal("DarkRedtoBlue.12")(12)
show_col(gradient_n_pal(cols)(seq(0, 1, length.out = 30)))



