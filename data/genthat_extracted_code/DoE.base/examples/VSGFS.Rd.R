library(DoE.base)


### Name: VSGFS
### Title: VSGFS: an experiment using an optimized orthogonal array in 72
###   runs
### Aliases: VSGFS
### Keywords: array design

### ** Examples

## code used for creating the data frame
## option levordold is needed, because the level ordering 
## changed (improved) with version 0.27 
## and the design was originally created with an earlier version
## Not run: 
##D   VSGFS <- oa.design(ID=L72.2.43.3.8.4.1.6.1, 
##D    nlevels=c(2,2,2,3,2,3,4), 
##D    columns=c(4,22,37,46,41,48,52), 
##D    factor.names=list(Light=c("Lght-","Lght+"),
##D 		ShakFreq=c("SF-","SF+"),
##D 		InocSize=c("IS-","IS+"),
##D 		FilledVol=c("FV-","FV0", "FV+"), 
##D 		CM=c("CM-","CM+"),
##D 		Sugar=c("Suc", "Gluc", "Mannit"),
##D            CDs=c("CD1","CD2","CD3","CD4")),
##D    seed = 9, randomize=TRUE, levordold=TRUE)
##D 
##D response <- as.data.frame(scan(what=list(Biomass=0, Content=0, Yield=0), sep=" ")) 
##D 5.80 24.13 139.98
##D 4.97 16.96 84.28
##D 1.28 21.08 26.99
##D 6.83 17.71 120.95
##D 0.86 21.28 18.30
##D 4.09 18.86 77.14
##D 2.39 17.08 40.81
##D 4.05 17.84 72.23
##D 5.84 17.74 103.61
##D 3.38 18.08 61.11
##D 0.40 24.82 9.93
##D 3.86 18.10 69.88
##D 4.58 21.29 97.49
##D 6.29 17.32 108.91
##D 4.85 15.50 75.17
##D 1.25 23.14 28.92
##D 2.09 18.43 38.51
##D 4.26 17.75 75.62
##D 4.78 18.53 88.57
##D 6.63 17.82 118.14
##D 0.77 18.79 14.47
##D 4.89 18.23 89.15
##D 4.53 17.69 80.11
##D 4.27 18.05 77.07
##D 3.90 15.84 61.77
##D 4.15 18.73 77.74
##D 3.95 17.12 67.63
##D 6.92 16.86 116.68
##D 5.00 16.96 84.80
##D 0.37 21.79 8.06
##D 2.36 19.57 46.18
##D 5.11 18.13 92.66
##D 4.69 17.38 81.50
##D 1.20 19.57 23.49
##D 1.76 17.98 31.65
##D 6.21 17.03 105.76
##D 5.63 15.71 88.43
##D 3.98 18.42 73.32
##D 2.31 19.38 44.76
##D 1.86 18.41 34.25
##D 4.22 17.93 75.68
##D 2.77 17.17 47.55
##D 0.40 23.10 9.24
##D 1.42 18.89 26.83
##D 1.54 17.44 26.86
##D 5.03 17.40 87.53
##D 8.70 14.41 125.38
##D 3.21 19.29 61.92
##D 5.36 18.46 98.93
##D 3.87 16.89 65.35
##D 7.70 18.60 143.20
##D 1.71 17.67 30.22
##D 4.38 16.79 73.54
##D 2.24 19.61 43.92
##D 3.79 19.35 73.35
##D 3.09 18.67 57.70
##D 1.57 17.64 27.70
##D 5.43 18.45 100.19
##D 3.86 17.09 65.96
##D 7.44 19.07 141.85
##D 5.87 17.13 100.53
##D 2.65 17.51 46.39
##D 6.14 15.85 97.34
##D 6.32 14.80 93.56
##D 5.19 16.53 85.78
##D 5.09 17.30 88.04
##D 4.40 17.52 77.08
##D 1.68 21.89 36.78
##D 0.93 23.06 21.45
##D 1.79 22.88 40.95
##D 2.64 18.38 48.52
##D 7.78 16.22 126.19
##D 
##D 
##D VSGFS <- add.response(VSGFS, response)
##D VSGFS$Sugar <- relevel(VSGFS$Sugar, "Suc")
##D VSGFS$FilledVol <- relevel(VSGFS$FilledVol, "FV0")
##D VSGFS$FilledVol <- relevel(VSGFS$FilledVol, "FV-")
## End(Not run)



