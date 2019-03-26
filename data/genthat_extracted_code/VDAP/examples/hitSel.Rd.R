library(VDAP)


### Name: hitSel
### Title: Signal Based Hits Selection for VDAP
### Aliases: hitSel
### Keywords: ~hits ~Kd

### ** Examples


protEx.hitSel <- data.frame(Peptides = c("PWRGPWARVGSG","GYNRVGQGSG","PNGYRSGVKGSG","GSG"),
Kd = c(0.2572361,2.8239730,3.3911868,281.3058),C_6uM = c(65011.48,47462.24,24778,2613.03),
C_3uM = c(62637.81,31899.85,21313.67,1161.216),C_1.5uM = c(57893.22,25911.35,10397.99,630.4025))

## Hits selection by RFU signal ##

hitSelRFU <- hitSel(protEx.hitSel,3:5,"GSG",Kd = FALSE)

## Hits selection by calculated Kd ##

hitSelKd <- hitSel(protEx.hitSel,2,"GSG",Kd = TRUE)



