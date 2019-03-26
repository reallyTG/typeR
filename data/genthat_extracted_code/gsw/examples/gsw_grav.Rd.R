library(gsw)


### Name: gsw_grav
### Title: Gravitational Acceleration
### Aliases: gsw_grav

### ** Examples

lat <- c(-90, -60, -30, 0)
grav <- gsw_grav(lat)
expect_equal(grav, c(9.832186205884799, 9.819178859991149,
                     9.793249257048750, 9.780327000000000))



