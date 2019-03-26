library(Polychrome)

tem<- 1:12
Polychrome:::xform(tem)

names(tem) <- paste("C", 1:12, sep='')
Polychrome:::xform(tem)

tem <- topo.colors(12, alpha=0.6)
all(tem == Polychrome:::xform(tem, alpha=TRUE))

set.seed(236746)
tem <- sample(colors(), 12)
Polychrome:::xform(tem)
Polychrome:::xform(tem, alpha=TRUE)

### make sure we just have color names here to test the auto conversion
tem

swatch(tem)
ranswatch(tem)
rancurves(tem)
ranpoints(tem)
uvscatter(tem)
luminance(tem)
plothc(tem)
plotpc(tem)
swatchHue(tem)
swatchLuminance(tem)

computeDistances(tem)
plotDistances(tem, pch=16)

colorNames(tem)
isccNames(tem)

