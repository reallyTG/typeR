### R code from vignette source 'deisotoper.Rnw'

###################################################
### code chunk number 1: deisotoper.Rnw:44-45
###################################################
options(prompt = "R> ", continue = "+  ", width = 70, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: deisotoper.Rnw:77-93
###################################################
peaklist <- list(mZ = c(362.0196, 362.0214, 362.0233, 362.0251,
  362.0270, 362.0288, 362.0307, 363.0164, 363.0183, 
  363.0202, 363.0220, 363.0239, 363.0257, 363.0276, 364.0156,
  364.0174, 364.0193, 364.0212, 364.0230, 364.0249, 364.0268,364.0286),
  intensity = c(208, 519, 858, 1009, 873, 551, 237, 284, 665, 1067,
  1195, 939, 485, 109, 321, 605, 1446, 2339, 2480, 1802, 559, 168))

peaklist <- list(
  mZ = c(636.2465, 636.2508, 636.2551, 636.2594, 636.2637, 636.2680, 636.2724, 636.2767, 636.2810, 636.2853, 636.2896, 636.2939, 636.2982, 636.3025, 636.3068, 636.3111, 637.2558, 637.2601, 637.2644, 637.2687, 637.2731, 637.2774, 637.2817, 637.2860, 637.2903, 637.2947, 637.2990, 637.3033, 638.2762, 638.2805, 638.2849, 638.2892, 638.2935),
  intensity = c(506, 10420, 15754, 38867, 136295, 423890, 750226, 1018163, 838389, 501517, 188589, 51669, 17388, 14255, 4033, 2541, 652, 3043, 14262, 50218, 105484, 165082, 172807, 115814, 59915, 17850, 4219, 1341, 1369, 2067, 2333, 1974, 1211)
  )


peaklist <- list(
  mZ = c(695.3586, 695.3636, 695.3685, 695.3734, 695.3783, 695.3832, 695.3882, 695.3931, 695.3980, 695.4029, 695.4079, 696.3692, 696.3741, 696.3791, 696.3840, 696.3889, 696.3939, 696.3988, 696.4037, 697.3569, 697.3618, 697.3668, 697.3717, 697.3767, 697.3816),
intensity = c(129, 849, 4148, 13688, 24213, 32592, 26475, 15754, 5862, 1613, 358, 371, 1156, 2947, 4869, 5348, 3605, 1817, 526, 755, 1479, 1934, 1805, 1201, 541))


###################################################
### code chunk number 3: deisotoper.Rnw:99-100
###################################################
plot(peaklist$mZ, peaklist$intensity, type = 'h')


###################################################
### code chunk number 4: deisotoper.Rnw:108-119
###################################################
isotope1 <- 1:11
mean(peaklist$mZ[isotope1])
x <- peaklist$mZ[isotope1]
y <- peaklist$intensity[isotope1]

peak <- data.frame(logy=log(y), x=x)

x.mean <- mean(peak$x)
peak$xc <- peak$x - x.mean

(fit <- lm(logy ~ xc + I(xc^2), data= peak))


###################################################
### code chunk number 5: deisotoper.Rnw:127-138
###################################################
op <- par(mfrow=c(1,2))

plot(logy ~ xc, data=peak)
xx <- with(peak, seq(min(xc), max(xc), length=20))
lines(xx , predict(fit, data.frame(xc=xx)), col=2)

plot(peak$xc + x.mean, exp(peak$logy))
lines(xx + x.mean, exp(predict(fit, data.frame(xc = xx))), col=2)
x0 <- -fit$coefficients[2] / (2 *fit$coefficients[3])
abline(v=x0 + x.mean)
axis(3, x0 + x.mean, round(x0 + x.mean,4))


###################################################
### code chunk number 6: deisotoper.Rnw:143-172
###################################################
plot(peaklist$mZ, peaklist$intensity, type = 'h')

profileFit <- function(x, y){
  peak <- data.frame(logy=log(y), x=x)

  x.mean <- mean(peak$x)
  peak$xc <- peak$x - x.mean

  fit <- lm(logy ~ xc + I(xc^2), data= peak)
  xx <- with(peak,seq(min(xc), max(xc), length=20))
 
  #plot(peak$xc + x.mean, exp(peak$logy))
  lines(xx + x.mean, exp(predict(fit, data.frame(xc = xx))), col=2)
  x0 <- -fit$coefficients[2] / (2 *fit$coefficients[3])
  #abline(v=x0 + x.mean)
  #axis(3, x0 + x.mean, round(x0 + x.mean,4))
  
   x0 + x.mean
}

#op<-par(mfrow=c(1,3))
set.seed(1)
isotopes <- kmeans(peaklist$mZ, 3, nstart=length(peaklist$mZ))


rv <- sapply(1:3, function(id){
  profileFit(peaklist$mZ[isotopes$cl == id], 
             peaklist$intensity[isotopes$cl == id])})
axis(3, rv, round(rv, 4))


###################################################
### code chunk number 7: deisotoper.Rnw:182-183
###################################################
library(deisotoper)


###################################################
### code chunk number 8: deisotoper.Rnw:188-192
###################################################
x0 <- list(mZ = c(1, 2, 2.5, 3), intensity = rep(1, 4),
          pepmass=600, charge=2)
x1 <- list(mZ = c(1.01, 2, 2.5, 3), intensity = rep(1, 4),
          pepmass=600, charge=2)


###################################################
### code chunk number 9: deisotoper.Rnw:196-197
###################################################
dtoper <- deisotoper()


###################################################
### code chunk number 10: deisotoper.Rnw:201-204
###################################################
(xd0 <- deisotope(dtoper, x0))
print(dtoper)
(xd1 <- deisotope(dtoper, x1))


###################################################
### code chunk number 11: deisotoper.Rnw:208-211
###################################################
op <- par(mfrow=c(1,2))
plot.deisotoper(x0, xd0)
plot.deisotoper(x1, xd1)


###################################################
### code chunk number 12: deisotoper.Rnw:215-216
###################################################
print(dtoper)


###################################################
### code chunk number 13: deisotoper.Rnw:222-263
###################################################
# EXAMPLE 2
# example data
x <- list(
  mZ = c(110.07172, 111.07504, 129.10249, 130.08649, 147.11302,
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


###################################################
### code chunk number 14: deisotoper.Rnw:266-267
###################################################
plot(x$mZ, x$intensity, type='h')


###################################################
### code chunk number 15: deisotoper.Rnw:272-283
###################################################
eps <- 0.025

rv <- (lapply(1:3, function(charge){
  diff.mZ <- diff(x$mZ)
  idx <- which( (1 / charge - eps) < diff.mZ 
                & diff.mZ  < (1 / charge + eps))
  
  diff.mZ[idx] - (1 / charge)
}))

rv


###################################################
### code chunk number 16: deisotoper.Rnw:289-298
###################################################
# standart configurated deisotoper
dtoper <- deisotoper(delta = 0.15)

# return the configuration of dtoper
config <- config.deisotoper(dtoper)

# deisotope the data
xd <- deisotope(dtoper, x)
summary.deisotoper(dtoper)


###################################################
### code chunk number 17: deisotoper.Rnw:301-308
###################################################
# plot the example data and the deisotoped data
op <- par(mfrow=c(4, 1))
plot.deisotoper(x, xd)
plot.deisotoper(x, xd, xlim = c(279, 285))
plot.deisotoper(x, xd, xlim = c(789.5, 793))
plot.deisotoper(x, xd, xlim = c(902.5, 908))
par(op)


###################################################
### code chunk number 18: deisotoper.Rnw:313-331
###################################################
charge <- 1;

(eps <- as.numeric(
  as.character(config$Value[which(config$Configuration == "Delta")])))

diff.mZ <- (1 / charge - eps) < diff(x$mZ) & diff(x$mZ) < (1 / charge + eps)
idx <- which( diff.mZ )

op <- par(mfrow=c(5, 3))

rv <- lapply(idx, function(i){
  m0 <- x$mZ[i] -1 
  m1 <- m0 + 2
  
  try(plot.deisotoper(x=x, y=xd, xlim=c(m0,m1),
                  ylim=range(x$intensity[(i-1):(i+2)],
                             -xd$intensity[which(m0 < xd$mZ & xd$mZ < m1)])))
})


###################################################
### code chunk number 19: deisotoper.Rnw:336-355
###################################################
charge <- 2;
(eps <- as.numeric(
  as.character(config$Value[which(config$Configuration == "Delta")])))

diff.mZ <- diff(x$mZ)
idx <- which( (1 / charge - eps) < diff.mZ  & diff.mZ  < (1 / charge + eps))

(diff.mZ[idx]) 

op <- par(mfrow=c(2, 3))

rv <- lapply(idx, function(i){
  m0 <- x$mZ[i] -1 
  m1 <- m0 + 2
  
  try(plot.deisotoper(x=x, y=xd, xlim=c(m0,m1),
                  ylim=range(x$intensity[(i-1):(i+2)],
                             -xd$intensity[which(m0 < xd$mZ & xd$mZ < m1)])))
})


###################################################
### code chunk number 20: sessioninfo
###################################################
toLatex(sessionInfo())


