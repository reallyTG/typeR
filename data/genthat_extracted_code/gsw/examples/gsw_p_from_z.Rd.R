library(gsw)


### Name: gsw_p_from_z
### Title: Pressure from height (75-term equation)
### Aliases: gsw_p_from_z

### ** Examples

z <- -c(10, 50, 125, 250, 600, 1000)
latitude <- 4
p <- gsw_p_from_z(z, latitude)
expect_equal(p/1e3, c(0.010055726724518, 0.050283543374874, 0.125731858435610,
                    0.251540299593468, 0.604210012340727, 1.007990337692001))



