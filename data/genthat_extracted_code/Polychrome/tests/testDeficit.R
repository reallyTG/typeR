library(Polychrome)
library(colorspace)

#########################################
## Test the background algorithm

## checking the conversion between RGB and sRGB
y <- seq(0, 1, length=500)
liny <- Polychrome:::srgb2rgb(y)
plot(y, liny)

yback <- Polychrome:::rgb2srgb(liny)
plot(y, yback)
abline(0,1)
summary(y - yback)

## comparing with colorspace

p36 <- palette36.colors(36)
srgb <- hex2RGB(p36)
mat <- srgb@coords
linrgb <- as(srgb, "RGB")
linmat <- Polychrome:::srgb2rgb(mat)
summary(linmat - linrgb@coords) # all 0, so we are doing the same thing

## since our structures have row vectors instead of columns,
## we need to transpose stuff
xyz <- linmat %*% t(Polychrome:::RGB2XYZ)
rgb.back <- xyz %*% t(Polychrome:::XYZ2RGB)
summary(linmat - rgb.back) # accurate to 4 decimal places

## multiple options for convertiong XYZ spoace to LMS perceptual space

## check that these are projections
all(Polychrome:::lms2lmsd == Polychrome:::lms2lmsd %*% Polychrome:::lms2lmsd)
all(Polychrome:::lms2lmsp == Polychrome:::lms2lmsp %*% Polychrome:::lms2lmsp)
all(Polychrome:::lms2lmst == Polychrome:::lms2lmst %*% Polychrome:::lms2lmst)

## check the complete round trip
M <- Polychrome:::backward(Polychrome:::forward(mat))
summary(round(M - mat, 3))


#########################################
## Test user-visible commands

## three input types
p36 <- palette36.colors(36)
srgb <- hex2RGB(p36)
class(srgb)
mat <- srgb@coords

## check that each one works
daltMat <- colorDeficit(mat, target="deut") # matrix conversion
daltRGB <- colorDeficit(srgb, target="deut") # object conversion
all(daltMat == daltRGB@coords) # agreement

daltP36 <- colorDeficit(p36, "deut") # hex string conversion
all(daltP36 == hex(daltRGB)) # agreement

# invariance
reup <- colorDeficit(daltMat, "deut")
all(daltMat == reup) # why false?
summary(daltMat - reup)

sndP36 <- hex(new("sRGB", coords=reup))

opar <- par(mfrow=c(3,1))
swatch(p36)
swatch(daltP36)
swatch(sndP36)
par(opar)

swatchHue(daltP36)
uvscatter(daltP36)
luminance(daltP36)
plotDistances(daltP36, cex=2)


cp <- createPalette(25, c("#111111", "#eeeeee"),
                    target="deuteranope", M=10000)
swatch(cp)
plotDistances(cp)

cp <- createPalette(25, c("#111111", "#eeeeee"),
                    target="prot", M=10000)
swatch(cp)
plotDistances(cp)

cp <- createPalette(25, c("#111111", "#eeeeee"),
                    target="trit", M=10000)
swatch(cp)
plotDistances(cp)

