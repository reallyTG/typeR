## ---- echo = FALSE, message=FALSE, warning=FALSE, results = "hide"-------
library(coreCT)
# extract metadata and convert raw values to Hounsfield Units
ct.slope <- unique(extractHeader(core_426$hdr, "RescaleSlope"))
ct.int   <- unique(extractHeader(core_426$hdr, "RescaleIntercept")) 
HU_426 <- lapply(core_426$img, function(x) x*ct.slope + ct.int)

# Use coreCT::conv to convert Hounsfield Units to densities and quantify component masses, volumes
materials <- conv(HU_426, pixelA = voxDims("core_426")$pixelArea.mm2, thickness = voxDims("core_426")$thickness.mm)

plot(-depth ~ peat.cm3, data = materials, xlab = "Peat volume (cm3; per slice)", ylab = "Depth (cm)")

## ---- message=FALSE, warning=FALSE, results = "hide"---------------------
materials <- convDir("core_426")

plot(-depth ~ peat.cm3, data = materials, xlab = "Peat volume (cm3; per slice)", ylab = "Depth (cm)")

## ---- message=FALSE, warning=FALSE---------------------------------------
HUfreq <- coreHist("core_426")

names(HUfreq)
HUfreq$splits

## ---- message=FALSE, warning=FALSE, results = "hide"---------------------
rootChars <- rootSizeDir("core_426", diameter.classes = c(1, 2.5, 10))

plot(-depth ~ structures, data = rootChars, xlab = "Root structures (per slice)", ylab = "Depth (cm)")

