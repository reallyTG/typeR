library(seqinr)


### Name: waterabs
### Title: Light absorption by the water column
### Aliases: waterabs
### Keywords: datasets

### ** Examples

data(waterabs)

d <- 100*seq(from = 0, to = 150, by = 1) # depth in cm
lambda <- waterabs$lambda                # wavelength in nm
abs <- waterabs$absorption               # absorption coefficient cm-1
#
# Smooth signal with cubic splines
#
  tmp <- spline(lambda, abs, n = 255)
  lambda <- tmp$x
  abs <- tmp$y

  zun <- sapply(abs,function(x) 10^(-x*d))
  z <- sapply(nrow(zun):1, function(x) zun[x,])
#
# Set up world coordinates:
#
  plot.new()
  plot.window(xlim = range(lambda), ylim = range(d), xaxs = "i",  yaxs = "i")
#
# Annotate:
#
  title(ylab = 'Depth under water surface (m)', xlab = "Wavelength (nm)",
  main = "Light absorption by the water column")
  axis(2 , at = seq(0, 15000, l = 7),
      labels = rev(c("0","25","50","75","100","125","150")), las = 1)
  axis(1,at=(3:6)*100,labels= TRUE)
#
# Show me rainbow colors:
#
  alpha <- 1
  coul=c(rep(rgb(1,1,1, alpha = alpha), 181),
    rev(hsv(h=seq(0,5/6,l=320),alpha = alpha)))
  rect(seq(200,699), 0, seq(201,700), 15000 , col = coul, border = coul)
#
# Grey scale:
#
  ngris <- 5
  image(x = lambda, y = d, z = z, col = rgb(1:ngris, 1:ngris, 1:ngris, alpha = 0.7*(ngris:1),
  max = ngris),
  axes = F, add = TRUE,
  breaks = seq(from = min(z), to = max(z), length = ngris + 1))

#
# Contour lines:
#
  contour(x = lambda, y = d, z = z, add = TRUE, drawlabels = TRUE,labcex= 0.75,
  col='black',
  levels = seq(from = min(z), to = max(z), length = ngris + 1))
  box()




