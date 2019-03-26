library(cpr)


### Name: get_surface
### Title: Get Two-Dimensional Control Net and Surface from n-dimensional
###   Control Nets
### Aliases: get_surface

### ** Examples

## Extract the control net and surface from a cpr_cn object.
a_cn <- cn(pdg ~ btensor(list(day, age), df = list(15, 3), order = list(3, 2)),
           data = spdg)

cn_and_surface <- get_surface(a_cn, n = 50)
str(cn_and_surface, max.level = 2)

par(mfrow = c(1, 2))
with(cn_and_surface$cn, 
     plot3D::persp3D(unique(Var1), 
                     unique(Var2), 
                     matrix(z,
                            nrow = dplyr::n_distinct(Var1), 
                            ncol = dplyr::n_distinct(Var2)),
                     main = "Control Net")
     )
with(cn_and_surface$surface, 
     plot3D::persp3D(unique(Var1), 
                     unique(Var2), 
                     matrix(z,
                            nrow = dplyr::n_distinct(Var1), 
                            ncol = dplyr::n_distinct(Var2)),
                     main = "Surface")
     ) 



