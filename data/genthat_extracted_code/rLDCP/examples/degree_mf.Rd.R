library(rLDCP)


### Name: degree_mf
### Title: Define generic calculation of fuzzy membership degrees
### Aliases: degree_mf

### ** Examples


w <- degree_mf(triangle_mf(450,450,550),450)

w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                triangle_mf(450,550,600),
                                trapezoid_mf(550,600,800,1000),
                                triangle_mf(800,1000,1300),
                                trapezoid_mf(1000,1300,1500,1500)),450)



