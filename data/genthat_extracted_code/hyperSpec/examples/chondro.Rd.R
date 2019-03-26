library(hyperSpec)


### Name: chondro
### Title: Raman spectra of 2 Chondrocytes in Cartilage A Raman-map
###   (laterally resolved Raman spectra) of chondrocytes in cartilage.
### Aliases: chondro
### Keywords: datasets

### ** Examples



chondro

## do baseline correction
baselines <- spc.fit.poly.below (chondro)
chondro <- chondro - baselines

## area normalization
chondro <- chondro / colMeans (chondro)

## substact common composition
chondro <- chondro - quantile (chondro, 0.05)

cols <- c ("dark blue", "orange", "#C02020")
plotmap (chondro, clusters ~ x * y, col.regions = cols)

cluster.means <- aggregate (chondro, chondro$clusters, mean_pm_sd)
plot (cluster.means, stacked = ".aggregate", fill = ".aggregate", col = cols)

## plot nucleic acid bands
plotmap (chondro[, , c( 728, 782, 1098, 1240, 1482, 1577)],
       col.regions = colorRampPalette (c ("white", "gold", "dark green"), space = "Lab") (20))




