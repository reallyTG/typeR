library(gsw)


### Name: gsw_internal_energy_ice
### Title: Specific Internal Energy of Ice (75-term equation)
### Aliases: gsw_internal_energy_ice

### ** Examples

t_Ih <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
e <- gsw_internal_energy_ice(t_Ih, p)
expect_equal(e/1e5, c(-3.556606992432442, -3.609926216929878, -3.597799043634774,
                    -3.587312078410920, -3.561207060376329, -3.512700418975375))



