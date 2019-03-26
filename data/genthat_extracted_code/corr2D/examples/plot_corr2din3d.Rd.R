library(corr2D)


### Name: plot_corr2din3d
### Title: 3D plot of two-dimensional correlation spectra.
### Aliases: plot_corr2din3d

### ** Examples

   data(FuranMale, package = "corr2D")
   twod <- corr2d(FuranMale, Ref1 = FuranMale[1, ], corenumber = 1)
   
   plot_corr2din3d(Mat = Re(twod$FT), specx = twod$Ref1,
       specy = twod$Ref1, reduce = 2, scalex = -175, scaley = -175,
       zlim = c(-1.5, 2.2)*10^-3, projection = FALSE,
       border = gray(0.2), theta = 25, phi = 15, add.legend = FALSE,
       Col = fields::tim.colors(64))
   



