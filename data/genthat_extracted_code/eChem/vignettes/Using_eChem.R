## ---- echo = FALSE, include = FALSE--------------------------------------
library(eChem)

## ---- eval = FALSE-------------------------------------------------------
#  cv1 = simulateCV()

## ------------------------------------------------------------------------
cv2 = simulateCV(n = 2, scan.rate = 0.1, t.units = 1000, x.units = 100)

## ------------------------------------------------------------------------
str(cv2)

## ---- eval = FALSE-------------------------------------------------------
#  lsv1 = simulateLSV(stir.rate = "fast")

## ---- eval = FALSE-------------------------------------------------------
#  ca1 = simulateCA(pulses = "double", t.1 = 5, t.2 = 10, t.end = 15)

## ---- eval = FALSE-------------------------------------------------------
#  cc1 = simulateCC(ca1)

## ------------------------------------------------------------------------
cv2_sample = sampleCV(cv2, data.reduction = 10)
str(cv2_sample)

## ----out.width="50%", fig.align = "center"-------------------------------
plotPotential(cv2, main_title = "Potential Profile for a Simulated Cyclic Voltammogram")

## ----out.width="50%", fig.align = "center"-------------------------------
plotDiffusion(cv2, t = 8)

## ----out.width="50%", fig.align = "center"-------------------------------
plotGrid(cv2)

## ----out.width="50%", fig.align = "center"-------------------------------
plotDiffGrid(cv2, species = c(TRUE, FALSE, FALSE), scale.factor = 0.25)

## ----out.width="50%", fig.align="center"---------------------------------
plotCV(filenames = list(cv2, cv2_sample), 
       legend_text = c("full data", "reduced data"), 
       line_colors = c("black", "blue"), 
       line_types = c(1, 1))

## ----out.width="50%", fig.align="center"---------------------------------
annotateCV(cv2)

## ---- eval = FALSE-------------------------------------------------------
#  animateCV(cv1, out_type = "gif", out_name = "cv1")

