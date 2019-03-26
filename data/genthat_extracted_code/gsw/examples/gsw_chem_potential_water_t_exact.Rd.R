library(gsw)


### Name: gsw_chem_potential_water_t_exact
### Title: Chemical Potential of Water in Seawater
### Aliases: gsw_chem_potential_water_t_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,       50,      125,      250,      600,      1000)
pot <- gsw_chem_potential_water_t_exact(SA, t, p)
expect_equal(pot, c(-8.545561146284534, -8.008085548342105, -5.103980139874876,
                  -0.634067782745442, 3.335566803473286, 7.555434445971858))



