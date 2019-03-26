## ----style, echo = FALSE, results = 'asis'---------------------------------
library(BiocStyle)
BiocStyle::markdown()

## ----libraries, message = FALSE--------------------------------------------
library("MSnbase")
library("msdata")
library("magrittr")

fl <- dir(system.file("sciex", package = "msdata"), full.names = TRUE)[2]
basename(fl)
data_prof <- readMSData(fl, mode = "onDisk", centroided = FALSE)

## ----serine-msdata---------------------------------------------------------
## Define the mz and retention time ranges
serine_mz <- 106.049871
mzr <- c(serine_mz - 0.01, serine_mz + 0.01)
rtr <- c(175, 187)

## Filtering the object
serine <- data_prof %>%
	filterRt(rtr) %>%
	filterMz(mzr)

## ----serine-plot, fig.align = "center", fig.cap = "MS profile data for serine. Upper panel shows the base peak chromatogram (BPC), lower panel the individual signals in the retention time - m/z space. The horizontal dashed red line indicates the theoretical m/z of the [M+H]+ adduct of serine."----
plot(serine, type = "XIC")
abline(h = serine_mz, col = "red", lty = 2)

## ----serine-spectrum24, fig.align = "center", fig.cap = "On of the spectra for serine in profile mode."----
plot(serine[[22]])

## ----simple-pickPeaks, fig.align = "center", warning = FALSE, fig.cap = "Centroided data for serine."----
data_cent <- data_prof %>%
	pickPeaks()

serine_cent <- data_cent %>%
	filterRt(rtr) %>%
	filterMz(mzr)

## Plot the centroided data for serine
plot(serine_cent, type = "XIC")
abline(h = serine_mz, col = "red", lty = 2)


## ----proline, fig.align = "center", warning = FALSE, fig.cap = "Centroided data for proline."----
prol_mz <- 116.070608
prol_mzr <- c(prol_mz - 0.01, prol_mz + 0.01)
prol_rtr <- c(165, 175)

proline <- data_prof %>%
	pickPeaks() %>%
	filterRt(prol_rtr) %>%
	filterMz(prol_mzr)

plot(proline, type = "XIC")
abline(h = prol_mz, col = "red", lty = 2)

## ----smoothSG--------------------------------------------------------------
data_sg <- data_prof %>%
	smooth(method = "SavitzkyGolay", halfWindowSize = 4L)

## ----smoothSG-pp-serine, warning = FALSE, fig.align = "center", fig.cap = "Centroided data for serine after smoothing with a Savitzky-Golay filter."----

data_sg_cent <- data_sg %>%
	pickPeaks %>%
	filterRt(rtr) %>%
	filterMz(mzr)

## Plot the centroided data for serine
plot(data_sg_cent, type = "XIC")
abline(h = serine_mz, col = "red", lty = 2)

## ----smoothSG-pp-proline, warning = FALSE, fig.align = "center", fig.cap = "Centroided data for proline after smoothing with a Savitzky-Golay filter."----
prol_sg_cent <- data_sg %>%
	pickPeaks %>%
	filterRt(prol_rtr) %>%
	filterMz(prol_mzr)

plot(prol_sg_cent, type = "XIC")
abline(h = prol_mz, col = "red", lty = 2)


## ----rtsmooth, message = FALSE, warning = FALSE----------------------------
## Subset to the data for proline, smooth it in rt dimension and
## perform the centroiding
proline_c_cent <- data_prof %>%
	filterRt(prol_rtr) %>%
	combineSpectraMovingWindow() %>%
	pickPeaks() %>%
	filterMz(prol_mzr)

## ----proline-rtsmooth, message = FALSE, warning = FALSE, fig.align = "center", fig.cap = "Centroided data for proline after smoothing in retention time dimension."----
plot(proline_c_cent, type = "XIC")
abline(h = prol_mz, col = "red", lty = 2)

## ----refineMz--------------------------------------------------------------
## Use pickPeaks with descendPeak m/z refinement
data_sg_cent_mz <- data_sg %>%
	pickPeaks(refineMz = "descendPeak")

## ----refineMz-serine, message = FALSE, warning = FALSE, fig.align = "center", fig.cap = "Smoothed and centroided data for serine without (left) and with m/z refinement (right). The horizontal red dashed line indicates the theoretical m/z for the [M+H]+ ion and the vertical red dotted line the position of the largest signal for serine."----
## Extract the data for serine
serine_sg_cent <- data_sg_cent %>%
	filterRt(rtr) %>%
	filterMz(mzr)

serine_sg_cent_mz <- data_sg_cent_mz %>%
	filterRt(rtr) %>%
	filterMz(mzr)

## Plot the data
layout(matrix(1:4, ncol = 2))
## No m/z refinement
plot(serine_sg_cent, type = "XIC", layout = NULL)
abline(h = serine_mz, col = "red", lty = 2)
abline(v = rtime(serine_sg_cent)[22], col = "red", lty = 3)
## With m/z refinement
plot(serine_sg_cent_mz, type = "XIC", layout = NULL)
abline(h = serine_mz, col = "red", lty = 2)
abline(v = rtime(serine_sg_cent_mz)[22], col = "red", lty = 3)

## ----serine-diff-mz-raw, warning = FALSE, message = FALSE------------------
## only centroided
mz(filterMz(filterRt(data_cent, rtr), mzr))[[22]] - serine_mz

## ----serine-diff-mz-sg, warning = FALSE, message = FALSE-------------------
## smoothed and centroided
mz(serine_sg_cent)[[22]] - serine_mz

## ----serine-diff-mz-sg-ref, warning = FALSE, message = FALSE---------------
## smoothed and centroided with m/z refinement
mz(serine_sg_cent_mz)[[22]] - serine_mz


## ----refineMz-proline, message = FALSE, warning = FALSE, fig.align = "center", fig.cap = "Smoothed and centroided data for proline without (left) and with m/z refinement (right). The horizontal red dashed line indicates the theoretical m/z for the [M+H]+ ion and the vertical red dotted line the position of the maximum signal."----

proline_sg_cent <- data_prof %>%
	smooth(method = "SavitzkyGolay", halfWindowSize = 4L) %>%
	pickPeaks() %>%
	filterRt(prol_rtr) %>%
	filterMz(prol_mzr)

proline_sg_cent_mz <- data_prof %>%
	smooth(method = "SavitzkyGolay", halfWindowSize = 4L) %>%
	pickPeaks(refineMz = "descendPeak") %>%
	filterRt(prol_rtr) %>%
	filterMz(prol_mzr)

layout(matrix(1:4, ncol = 2))
plot(proline_sg_cent, type = "XIC", layout = NULL)
abline(h = prol_mz, col = "red", lty = 2)
abline(v = rtime(proline_sg_cent_mz)[16], col = "red", lty = 3)

plot(proline_sg_cent_mz, type = "XIC", layout = NULL)
abline(h = prol_mz, col = "red", lty = 2)
abline(v = rtime(proline_sg_cent_mz)[16], col = "red", lty = 3)

## ----proline-diff-mz, warning = FALSE, message = FALSE---------------------
## only centroiding
mz(filterMz(filterRt(data_cent, prol_rtr), prol_mzr))[[16]] - prol_mz

## smoothed and centroided
mz(proline_sg_cent)[[16]] - prol_mz

## smoothed and centroided with m/z refinement
mz(proline_sg_cent_mz)[[16]] - prol_mz


