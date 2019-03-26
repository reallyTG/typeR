library(secr)


### Name: deermouse
### Title: Deermouse Live-trapping Datasets
### Aliases: deermouse deermouse.ESG deermouse.WSG ESG.0 ESG.b ESG.h2 ESG.t
###   WSG.0 WSG.b WSG.h2 WSG.t
### Keywords: datasets

### ** Examples


par(mfrow = c(1,2), mar = c(1,1,4,1))
plot(deermouse.ESG, title = "Peromyscus data from East Stuart Gulch",
    border = 10, gridlines = FALSE, tracks = TRUE)
plot(deermouse.WSG, title = "Peromyscus data from Wet Swizer Gulch",
    border = 10, gridlines = FALSE, tracks = TRUE)

closure.test(deermouse.ESG, SB = TRUE)

## reveal multiple captures
table(trap(deermouse.ESG), occasion(deermouse.ESG))
table(trap(deermouse.WSG), occasion(deermouse.WSG))




