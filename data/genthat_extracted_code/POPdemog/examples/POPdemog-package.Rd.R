library(POPdemog)


### Name: POPdemog-package
### Title: Plot Population Demographic History
### Aliases: POPdemog-package POPdemog
### Keywords: Population demographic history

### ** Examples

###Tennessen's standard model
"macs 2025 15000000 -i 10 -r 3.0e-04 -t 0.00069 -T -I 4 10 1006 1008 1 0 
-n 4 0.205 -n 1 58.00274 -n 2 70.041 -n 3 187.55 -eg 0.9e-10 1 482.46 
-eg 1.0e-10 2 570.18 -eg 1.1e-10 3 720.23 -em 1.2e-10 1 2 0.731 
-em 1.3e-10 2 1 0.731 -em 1.4e-10 3 1 0.2281 -em 1.5e-10 1 3 0.2281 
-em 1.6e-10 2 3 0.9094 -em 1.7e-10 3 2 0.9094 -eg 0.007 1 0 
-en 0.007001 1 1.98 -eg 0.007002 2 89.7668 -eg 0.007003 3 113.3896
-eG 0.031456 0 -en 0.031457 2 0.1412 -en 0.031458 3 0.07579
-eM 0.031459 0 -ej 0.03146 3 2 -en 0.0314601 2 0.2546
-em 0.0314602 2 1 4.386 -em 0.0314603 1 2 4.386 -eM 0.0697669 0
-ej 0.069767 2 1 -en 0.0697671 1 1.98 -en 0.2025 1 1 -ej 0.9575923 4 1
-em 0.06765 2 4 32 -em 0.06840 2 4 0" -> std_model_Tennessen.cmd
#plot the demographic graph
par(mfrow = c(1,2))
PlotMS(input.cmd = std_model_Tennessen.cmd, type = "macs", N4 = 10000, size.scale = "log", 
log.base = 50, inpos = c(1,4,7,9), time.scale = "log10year", 
col.pop = c("brown", "blue", "gold3", "forestgreen"), 
pops = c("AFR", "EUR", "ASIA", "ARC"), 
cex.lab = 1, cex.axis = 1, xlab = "", length.arrowtip = 0.1)
title("Demographic histoy")
PlotMS(input.cmd = std_model_Tennessen.cmd, type = "macs", N4 = 10000,
time.scale = "log10year", plot.out = FALSE, demo.out = TRUE)->out;
PlotMig(time_pt = 2, demograph_out = out$demograph_out,mig_par = out$mig_par, 
col.pop = c("brown", "blue", "gold3", "forestgreen"), size.scale = "topology");
legend("topleft", legend = c("AFR", "EUR", "ASIA", "ARC"), 
col = c("brown", "blue", "gold3", "forestgreen"), pch = 20, bty = "n")
title("Migrations at 200 years ago");


###Archaic introgrssion model
"./ms 44 1 -r 20000 50000000 -t 30000 -I 6 20 20 1 1 1 1 -en 0 1 1
-en 0 2 1 -en 0 3 1e-10 -en 0 4 1e-10 -en 0 5 1e-10 -en 0 6 1e-10
-es 0.0125 2 0.97 -en 0.02500025 7 0.25 -en 0.02500025 2 1 -ej 0.05 4 3
-ej 0.05 6 5 -en 0.05000025 3 0.25 -en 0.05000025 5 0.25 -ej 0.0500025 5 3
-en 0.050005 3 0.25 -ej 0.075 2 1 -en 0.0750025 1 1 -ej 0.1 7 3
-en 0.1000025 3 0.25 -ej 0.3 3 1 -en 0.3000025 1 1" -> test.1.ms.cmd
PlotMS(input.cmd = test.1.ms.cmd, type = "ms", N4 = 10000,
time.scale = "kyear", length.arrowtip = 0.1, inpos = c(1,2,5,4.5,5.5,6,3),
col.pop = c("brown", "blue", "forestgreen", rainbow(10)[6:9]));


###Migration model from ms.
"./ms 15 100 -t 3.0 -I 6 0 7 0 0 8 0 -m 1 2 2.5 -m 2 1 2.5 -m 2 3 2.5
-m 3 2 2.5 -m 4 5 2.5 -m 5 4 2.5 -m 5 6 2.5 -m 6 5 2.5 -em 2.0 3 4 2.5
-em 2.0 4 3 2.5" -> test.2.ms.cmd
PlotMS(input.cmd = test.2.ms.cmd, type = "ms", N4 = 10000, col.pop = "gray",
col.arrow = "black", length.arrowtip = 0.1, lwd.arrow = 2);



