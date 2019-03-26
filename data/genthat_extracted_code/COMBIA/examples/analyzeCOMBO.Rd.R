library(COMBIA)


### Name: analyzeCOMBO
### Title: This function calculates significant synergy/antagonism
###   according to Bliss or Loewe model and creates scientific publication
###   ready graphs.
### Aliases: analyzeCOMBO

### ** Examples

fl <- system.file("extdata", "testData.csv", package="COMBIA")
wellR <- list(c("l3:l10","m3:m10","b3:k10", "l13:l20","m13:m20","b13:k20", 
           "l23:l30","m23:m30","b23:k30", "l33:l40","m33:m40","b33:k40") )
mdl <- "bliss"
xConc <- c(0.00,  0.20,  0.39,  0.78,  1.56,  3.12,  6.25, 12.50, 25.00, 50) 
yConc <- c(128,  64,  32,  16,   8,   4,   2,   0)
xDrug <- "A"
yDrug <- "B"
cellLine <-"Cell"
analyzeCOMBO(filename = c(fl), model = "bliss", inputFormates = "macsynergy", 
                 wells = wellR, yConcentration = yConc, xConcentration = xConc,
                 xDrug = xDrug, yDrug=yDrug, cellLine = cellLine, nBoot=500)




