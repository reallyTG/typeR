library(pals)


### Name: continuous
### Title: Miscellaneous colormaps
### Aliases: continuous cubehelix gnuplot tol.rainbow jet parula coolwarm
###   warmcool cividis

### ** Examples


pal.bands(coolwarm, cubehelix, gnuplot, jet, parula, tol.rainbow, cividis)

if(FALSE){

# ----- coolwarm -----
pal.test(coolwarm) # Minimal mach banding
# Note the mach banding gray line in the following:
# pal.volcano(colorRampPalette(c("#3B4CC0", "lightgray", "#B40426")))

# ----- cubehelix -----
# Full range of colors. Pink is overwhelming. Not the best choice.
pal.test(cubehelix)

# Mostly blues/greens. Dark areas severely too black. 
# Similar, but more saturated. See: http://inversed.ru/Blog_2.htm
pal.volcano(function(n) cubehelix(n, start=.25, r=-.67, hue=1.5))

# Dark colors totally lose structure of the volcano peak.
op <- par(mfrow=c(2,2), mar=c(2,2,2,2))
image(volcano, col = cubehelix(51), asp = 1, axes=0, main="cubehelix")
image(volcano, col = cubehelix(51, start=.25, r=-.67, hue=1.5), asp = 1, axes=0, main="cubehelix")
image(volcano, col = rev(cubehelix(51)), asp = 1, axes=0, main="cubehelix")
image(volcano, col = rev(cubehelix(51, start=.25, r=-.67, hue=1.5)), 
                                   asp = 1, axes=0, main="cubehelix")
par(op)

# ----- gnuplot -----
pal.test(gnuplot)

# ----- jet -----
# pal.volcano(jet)
pal.test(jet)

# ----- parula -----
# pal.volcano(parula)
pal.test(parula)

# ----- tol.rainbow -----
# pal.volcano(tol.rainbow)
pal.test(tol.rainbow)

} 

# ----- cividis -----
# pal.volcano(cividis)
pal.test(cividis)




