library(deisotoper)


### Name: deisotoper
### Title: Construct a Deisotoper Object
### Aliases: deisotoper deisotope.list plot.deisotoper print.deisotoper
###   dot.deisotoper summary.deisotoper config.deisotoper

### ** Examples

# EXAMPLE 1
# standart configurated deisotoper
dtoper <- deisotoper()

# return the configuration of dtoper
config <- config.deisotoper(dtoper)

# example data
x <- list(mZ = c(110.07172, 111.07504, 129.10249, 130.08649, 147.11302,
   149.04506, 167.05571, 175.11923, 181.06099, 199.07158, 216.09814, 
   223.15556, 239.09503, 251.15036, 261.15579, 262.13, 280.14053,
   281.14398, 285.00974, 299.06165, 303.02039, 328.11386, 332.20789,
   344.97641, 345.14056, 350.21866, 355.06995, 360.22412, 368.17529,
   373.08078, 415.03656, 418.99521, 430.2774, 431.28107, 464.26218,
   473.3085, 476.18176, 479.20718, 481.25989, 497.21811, 521.27063,
   521.77087, 540.7804, 559.31946, 560.32391, 580.32739, 582.30688,
   592.28766, 592.35815, 593.34113, 608.25214, 610.30243, 610.36755,
   611.30554, 611.37042, 630.35724, 631.36115, 642.572, 643.054,
   643.569, 644.062, 644.557, 681.37762, 684.31494, 691.36011,
   709.37109, 709.4353, 710.44037, 712.3092, 721.33459, 754.33899,
   774.36261, 790.38892, 791.39124, 792.39221, 813.4679, 820.40479,
   823.41522, 824.40546, 825.39423, 826.39734, 840.47681, 841.43036,
   841.47949, 896.4137, 903.47253, 904.47565, 905.47632, 906.47607,
   924.46271, 951.51038, 969.52002, 970.52283, 1038.50195, 1041.53308,
   1042.53845, 1080.55493, 1081.54773),
          intensity = c(378322, 32496.6, 85689.6, 46440.3, 49645.2, 
          25102.5, 32516.2, 83497.2, 74653.1, 37228, 196053, 83826.4,
          112718, 114812, 88089.5, 61521.3, 220054, 58888.5, 280334,
          122311, 14953.2, 26959.6, 24854, 27122.9, 86216.1, 63360.3,
          358968, 47393.5, 37893.2, 16532.9, 17259, 37250.4, 33679.8,
          21243.6, 17854.9, 51232.4, 12738.8, 19515.4, 31560.1, 48772.3,
          66481.2, 23353.6, 11994, 15211, 9883.29, 14753.7, 17304.7,
          51575.9, 10917.6, 40518.3, 15107.3, 62106.4, 72496.1, 9430.4,
          10289.3, 34831.3, 41981.1, 17000, 25000, 12000, 9000, 4000,
          9579.9, 10392.3, 13507.4, 38200.9, 29990.5, 9304.39, 19849, 
          10678.6, 8452.85, 14519.3, 111717, 185030, 56020.8, 3387.69,
          9478.08, 7878.29, 3167.8, 20670.7, 2774.25, 31114.4, 3385.92,
          4656.8, 3687.15, 65332.5, 207097, 68080.9, 11934.3, 3630.86,
          9201.02, 47579.2, 19125.8, 3439.48, 15082.1, 8280.57, 4170.47,
          2603.17),
          title = "TP filtered inserted example 2 of protViz::deisotoper.",
          rtinseconds = 1581,
          charge = 2,
          scan = 1,
          id = 1,
          pepmass = 592.8093)

# deisotope the data
xd <- deisotope(dtoper, x)
summary.deisotoper(dtoper)

# plot the example data and the deisotoped data
op <- par(mfrow=c(2,2))
plot.deisotoper(x, xd)
plot.deisotoper(x, xd, xlim=c(275,285))
plot.deisotoper(x, xd, xlim=c(790,795))
plot.deisotoper(x, xd, xlim=c(901,910))
par(op)

# return the annotated spectrum of the above deisotoped data
print.deisotoper(dtoper)



# EXAMPLE 2
# standart configurated deisotoper with changed delta and decharging
dtoper2 <- deisotoper(delta = 0.005, decharge = TRUE)

# return the configuration of dtoper2
config2 <- config.deisotoper(dtoper2)

## Not run: 
##D # return the GraphViz dot graphs of the above deisotoped data
##D xdot <- dot.deisotoper(dtoper)
##D 
##D # draws the isotopic cluster graphs in the browser (html)
##D   if(require(DiagrammeR)){
##D     lapply(xdot, DiagrammeR::grViz)
##D   }
## End(Not run)




