library(rLDCP)


### Name: pm_infer
### Title: Call the g function
### Aliases: pm_infer

### ** Examples


cp_depth <- cp("cp_depth", c("far",
                           "bit far",
                           "good",
                           "close",
                           "very close"))

g_depth <- function(u,y){
   y$w <- degree_mf(fuzzy_partitions(triangle_mf(450,450,550),
                                              triangle_mf( 450,550,600),
                                              trapezoid_mf(550,600,800, 1000),
                                              triangle_mf( 800,1000,1300),
                                              trapezoid_mf( 1000,1300,1500,1500)),u)
 y
}

pm_depth  <- pm(y=cp_depth, g=g_depth)
pm_depth   <- pm_infer(pm_depth, 650)




