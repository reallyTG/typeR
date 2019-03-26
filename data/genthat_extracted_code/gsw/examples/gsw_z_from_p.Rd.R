library(gsw)


### Name: gsw_z_from_p
### Title: Height from Pressure
### Aliases: gsw_z_from_p

### ** Examples

z <- gsw_z_from_p(c(10, 50, 125, 250, 600,1000), 4)
expect_equal(z/1e2, c(-0.099445834469453, -0.497180897012550, -1.242726219409978,
                    -2.484700576548589, -5.958253480356214, -9.920919060719987))



