## ----style, echo = FALSE, results = 'asis'---------------------------------
BiocStyle::markdown()

## ----environment, cache=FALSE, echo=FALSE----------------------------------
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("MSnbase"))
suppressPackageStartupMessages(library("zoo"))
suppressPackageStartupMessages(require("Rdisop"))
suppressPackageStartupMessages(require("pRolocdata"))
suppressPackageStartupMessages(require("pRoloc"))
suppressPackageStartupMessages(require("msdata"))
library("grid")
suppressPackageStartupMessages(library("BiocParallel"))

## ----include_forword, echo=FALSE, results="asis"---------------------------
cat(readLines("./Foreword.md"), sep = "\n")

## ----include_bugs, echo=FALSE, results="asis"------------------------------
cat(readLines("./Bugs.md"), sep = "\n")

## ---- eval=FALSE-----------------------------------------------------------
#  library("doParallel")
#  registerDoParallel(3) ## using 3 slave nodes
#  register(DoparParam(), default = TRUE)
#  
#  ## rest of script comes below

## ----readdata, echo=TRUE, cache=FALSE, tidy=FALSE--------------------------
file <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.names = TRUE, pattern = "mzXML$")
rawdata <- readMSData(file, msLevel = 2, verbose = FALSE)

## ----writeMSData, cache = FALSE--------------------------------------------
writeMSData(rawdata, file = paste0(tempfile(), ".mzML"), copy = TRUE)

## ----MSnExp, cache=FALSE, echo=TRUE----------------------------------------
library("MSnbase")
itraqdata
head(fData(itraqdata))

## ----experimentsize, echo=FALSE, cache=FALSE-------------------------------
sz <- sum(sapply(assayData(itraqdata), object.size)) +
  object.size(itraqdata)
sz <- as.numeric(sz)
sz <- round(sz/(1024^2), 2)

## ----Spectrum, cache=FALSE, echo=TRUE--------------------------------------
sp <- itraqdata[["X1"]]
sp

## ----accessors, cache=FALSE, echo=TRUE-------------------------------------
peaksCount(sp)
head(peaksCount(itraqdata))
rtime(sp)
head(rtime(itraqdata))

## ----ReporterIons----------------------------------------------------------
iTRAQ4
TMT10

## ----Chromatogram----------------------------------------------------------
f <- c(system.file("microtofq/MM14.mzML", package = "msdata"))
mtof <- readMSData(f, mode = "onDisk")
mtof_tic <- chromatogram(mtof)
mtof_tic

## ----Chromatogram-continue-------------------------------------------------
mtof_tic[1, 1]

head(intensity(mtof_tic[1, 1]))
head(rtime(mtof_tic[1, 1]))
mz(mtof_tic[1, 1])

## ----Chromatogram-bpc------------------------------------------------------
mtof_bpc <- chromatogram(mtof, aggregationFun = "max")

## ----msmap, eval=FALSE-----------------------------------------------------
#  ## downloads the data
#  library("rpx")
#  px1 <- PXDataset("PXD000001")
#  mzf <- pxget(px1, 7)
#  
#  ## reads the data
#  ms <- openMSfile(mzf)
#  hd <- header(ms)
#  
#  ## a set of spectra of interest: MS1 spectra eluted
#  ## between 30 and 35 minutes retention time
#  ms1 <- which(hd$msLevel == 1)
#  rtsel <- hd$retentionTime[ms1] / 60 > 30 &
#      hd$retentionTime[ms1] / 60 < 35
#  
#  ## the map
#  M <- MSmap(ms, ms1[rtsel], 521, 523, .005, hd, zeroIsNA = TRUE)

## ----msmaplaod, echo=FALSE-------------------------------------------------
mrda <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.names = TRUE, pattern = "M.rda$")
mrda2 <- dir(system.file(package = "MSnbase", dir = "extdata"),
            full.names = TRUE, pattern = "M2.rda$")
load(mrda)
load(mrda2)

## ----msmaphow--------------------------------------------------------------
M

## ----mapheat, fig.cap = "Heat map of a chunk of the MS data."--------------
plot(M, aspect = 1, allTicks = FALSE)

## ----map3d, fig.cap = "3 dimensional represention of MS map data."---------
plot3D(M)

## ----msmap2, eval=FALSE----------------------------------------------------
#  i <- ms1[which(rtsel)][1]
#  j <- ms1[which(rtsel)][2]
#  M2 <- MSmap(ms, i:j, 100, 1000, 1, hd)

## ----m2--------------------------------------------------------------------
M2

## ----map3d2, fig.cap = "3 dimensional represention of MS map data. MS1 and MS2 spectra are coloured in blue and magenta respectively."----
plot3D(M2)

## ----spectrumPlot, fig.keep='high', fig.cap = "Raw MS2 spectrum with details about reporter ions."----
plot(sp, reporters = iTRAQ4, full = TRUE)

## ----bsaSelect, eval=TRUE, echo=FALSE--------------------------------------
## bsasel <- fData(itraqdata)$ProteinAccession == "BSA"
bsasel <- 1:3

## ----subset, echo=TRUE-----------------------------------------------------
sel <- fData(itraqdata)$ProteinAccession == "BSA"
bsa <- itraqdata[sel]
bsa
as.character(fData(bsa)$ProteinAccession)

## ----msnexpPlot, fig.keep='last', fig.cap = "Experiment-wide raw MS2 spectra. The y-axes of the individual spectra are automatically rescaled to the same range. See section \\@ref(sec:norm) to rescale peaks identically."----
plot(bsa, reporters = iTRAQ4, full = FALSE) + theme_gray(8)

## ----chromPlot, fig.keep='high', fig.cap = "Base peak chromatogram."-------
plot(mtof_bpc)

## ----iddf0-----------------------------------------------------------------
library("msdata")
f <- "TMT_Erwinia_1uLSike_Top10HCD_isol2_45stepped_60min_01-20141210.mzid"
idf <- msdata::ident(full.names = TRUE, pattern = f)
iddf <- readMzIdData(idf)
str(iddf)

## ----dups1, echo=FALSE-----------------------------------------------------
iddf[grep("scan=5291", iddf[, "spectrumID"]),
     c("spectrumID", "sequence", "DatabaseAccess")]

## ----dups2, echo=FALSE-----------------------------------------------------
iddf[grep("scan=4936", iddf[, "spectrumID"]),
     c("spectrumID", "sequence", "modName", "modLocation")]

## ----ideda-----------------------------------------------------------------
table(iddf$isDecoy)
table(iddf$chargeState)

## ----idvis-----------------------------------------------------------------
library("ggplot2")
ggplot(data = iddf, aes(x = MS.GF.RawScore, colour = isDecoy)) +
    geom_density() +
    facet_wrap(~chargeState)

## --------------------------------------------------------------------------
iddf <- filterIdentificationDataFrame(iddf)

## ----rediddf---------------------------------------------------------------
iddf2 <- reduce(iddf, key = "spectrumID")

## ----dups3, echo=FALSE-----------------------------------------------------
iddf2[grep("scan=5291", iddf2[, "spectrumID"]),
      c("spectrumID", "sequence", "DatabaseAccess")]

## ----dups4, echo=FALSE-----------------------------------------------------
iddf2[grep("scan=4936", iddf2[, "spectrumID"]),
     c("spectrumID", "sequence", "modName", "modLocation")]

## ----msnexpIdentification, echo=TRUE, cache=FALSE, tidy=FALSE--------------
## find path to a mzXML file
quantFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                 full.name = TRUE, pattern = "mzXML$")
## find path to a mzIdentML file
identFile <- dir(system.file(package = "MSnbase", dir = "extdata"),
                 full.name = TRUE, pattern = "dummyiTRAQ.mzid")
## create basic MSnExp
msexp <- readMSData(quantFile, verbose = FALSE)
head(fData(msexp), n = 2)

## ----msnexpIdentification2, echo=TRUE, cache=FALSE, tidy=FALSE-------------
msexp <- addIdentificationData(msexp, id = identFile)
head(fData(msexp), n = 2)

## ----msnexpIdentification3, echo=TRUE, cache=FALSE, tidy=FALSE-------------
idSummary(msexp)

## ----fragplot0-------------------------------------------------------------
itraqdata2 <- pickPeaks(itraqdata, verbose=FALSE)
i <- 14
s <- as.character(fData(itraqdata2)[i, "PeptideSequence"])

## ----fragplot, fig.cap = "Annotated MS2 spectrum."-------------------------
plot(itraqdata2[[i]], s, main = s)

## ----msnexpIdentification4, echo=TRUE, cache=FALSE, tidy=FALSE-------------
fData(msexp)$sequence
msexp <- removeNoId(msexp)
fData(msexp)$sequence
idSummary(msexp)

## ----calculateFragments, echo=TRUE, cache=FALSE, tidy=FALSE----------------
calculateFragments("ACEK",
                   type = c("a", "b", "c", "x", "y", "z"))

## ----msnexpcalculateFragments, echo=TRUE, cache=FALSE, tidy=FALSE----------
pepseq <- fData(msexp)$sequence[1]
calculateFragments(pepseq, msexp[[1]], type=c("b", "y"))

## ----removePeaks, echo=TRUE, cache=FALSE-----------------------------------
experiment <- removePeaks(itraqdata, t = 400, verbose = FALSE)
ionCount(itraqdata[["X55"]])
ionCount(experiment[["X55"]])

## ----spectrum-clean-plot, echo=FALSE, fig.keep='high', fig.cap = "Same spectrum before (left) and after setting peaks <= 400 to 0."----
p1 <- plot(itraqdata[["X55"]], full = TRUE, plot = FALSE) + theme_gray(5)
p2 <- plot(experiment[["X55"]], full = TRUE, plot = FALSE) + theme_gray(5)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
vplayout <- function(x, y)
  viewport(layout.pos.row = x, layout.pos.col = y)
print(p1,vp=vplayout(1,1))
print(p2,vp=vplayout(1,2))

## ----clean, echo=TRUE, cache=FALSE-----------------------------------------
peaksCount(itraqdata[["X55"]])
peaksCount(experiment[["X55"]])
experiment <- clean(experiment, verbose = FALSE)
peaksCount(experiment[["X55"]])

## ----preprosp, cache=FALSE, echo=FALSE-------------------------------------
int <- c(0,1,1,3,1,1,0,0,0,1,3,7,3,1,0)
mz <- c(113.9,114.0,114.05,114.1,114.15,114.2,114.25,
        114.3,114.35,114.4,114.42,114.48,114.5,114.55,114.6)
ppsp <- new("Spectrum2",intensity=int,mz=mz,centroided=FALSE)
p1 <- plot(ppsp, full = TRUE, plot = FALSE) + theme_gray(5) +
  geom_point(size=3,alpha=I(1/3)) +
  geom_hline(yintercept=3,linetype=2) +
  ggtitle("Original spectrum")
p2 <- plot(removePeaks(ppsp,t=3), full=TRUE, plot = FALSE) +
  theme_gray(5) +
  geom_point(size=3,alpha=I(1/3)) +
  geom_hline(yintercept=3,linetype=2) +
  ggtitle("Peaks < 3 removed")
p3 <- plot(clean(removePeaks(ppsp,t=3)), full = TRUE, plot = FALSE) +
  theme_gray(5) +
  geom_point(size=3,alpha=I(1/3)) +
  geom_hline(yintercept=3,linetype=2) +
  ggtitle("Peaks < 3 removed and cleaned")

## ----preprocPlot, echo=FALSE, fig.cap = "This figure illustrated the effect or the `removePeaks` and `clean` methods. The left-most spectrum displays two peaks, of max height 3 and 7 respectively. The middle spectrum shows the result of calling `removePeaks` with argument `t=3`, which sets all data points of the first peak, whose maximum height is smaller or equal to `t` to 0. The second peak is unaffected. Calling `clean` after `removePeaks` effectively deletes successive 0 intensities from the spectrum, as shown on the right plot."----
grid.newpage()
pushViewport(viewport(layout = grid.layout(3, 1)))
print(p1, vp=vplayout(1, 1))
print(p2, vp=vplayout(2, 1))
print(p3, vp=vplayout(3, 1))

## ----trimMz, echo=TRUE, cache=FALSE----------------------------------------
range(mz(itraqdata[["X55"]]))
experiment <- filterMz(experiment, mzlim = c(112,120))
range(mz(experiment[["X55"]]))
experiment

## ----reporters, echo=TRUE, cache=FALSE-------------------------------------
mz(iTRAQ4)
width(iTRAQ4)

## ----simplesp, cache=FALSE, echo=FALSE, fig.keep='none'--------------------
int <- c(0, 1, 1, 3, 1, 1, 0)
mz <- c(113.9, 114.0, 114.05, 114.1, 114.15, 114.2, 114.25)
ssp <- new("Spectrum2", intensity = int, mz = mz, centroided = FALSE)
p <- plot(ssp, full = TRUE, plot = FALSE)
p <- p + theme_gray(5)

## ----quantitationPlot, echo=FALSE, fig.cap = "The different quantitation methods. See text for details."----
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 2)))
vplayout <- function(x, y)
  viewport(layout.pos.row = x, layout.pos.col = y)
print(p + ggtitle("Quantitation using 'sum'") +
      geom_point(size = 3, alpha = I(1/3), colour = "red"),
      vp = vplayout(1, 1))
print(p + ggtitle("Quantitation using 'max'") +
      geom_point(aes(x = 114.1, y = 3),
                 alpha = I(1/18),
                 colour = "red", size = 3),
      vp = vplayout(1, 2))
print(p +
      ggtitle("Trapezoidation and strict=FALSE") +
      geom_polygon(alpha = I(1/5), fill = "red"),
      vp = vplayout(2, 1))
print(p +
      ggtitle("Trapezoidation and strict=TRUE") +
      geom_polygon(aes(x = c(NA, 114.05, 114.05, 114.1, 114.15, 114.15, NA),
                       y = c(NA, 0, 1, 3, 1, 0, NA)), fill = "red", alpha = I(1/5)),
      vp = vplayout(2,2))

## ----quantify, echo=TRUE, cache=FALSE, tidy=FALSE--------------------------
qnt <- quantify(experiment,
                method = "trap",
                reporters = iTRAQ4,
                strict = FALSE,
                verbose = FALSE)
qnt
head(exprs(qnt))

## ----filterNA, echo=TRUE---------------------------------------------------
table(is.na(qnt))
qnt <- filterNA(qnt, pNA = 0)
sum(is.na(qnt))

## ----removeNa, echo=TRUE, eval=FALSE---------------------------------------
#  whichRow <- which(is.na((qnt))) %% nrow(qnt)
#  qnt <- qnt[-whichRow, ]

## ----readSRMData, echo = TRUE, warning = FALSE-----------------------------
fl <- proteomics(full.names = TRUE, pattern = "MRM")
srm <- readSRMData(fl)

srm

## ----srm-precursorMz-------------------------------------------------------
head(precursorMz(srm))

head(productMz(srm))

## ----pheplus1, echo=TRUE, cache=FALSE--------------------------------------
library(Rdisop)
## Phenylalanine immonium ion
Fim <- getMolecule("C8H10N")
getMass(Fim)
isotopes <- getIsotope(Fim)
F1 <- isotopes[2, 2]
F1

## ----purityCorrect, echo=TRUE, cache=FALSE, tidy = FALSE-------------------
impurities <- matrix(c(0.929, 0.059, 0.002, 0.000,
                       0.020, 0.923, 0.056, 0.001,
                       0.000, 0.030, 0.924, 0.045,
                       0.000, 0.001, 0.040, 0.923),
                     nrow = 4)
qnt.crct <- purityCorrect(qnt, impurities)
head(exprs(qnt))
head(exprs(qnt.crct))

## ----impute----------------------------------------------------------------
## an example MSnSet containing missing values
data(naset)
table(is.na(naset))
## number of NAs per protein
table(fData(naset)$nNA)
x <- impute(naset, "min")
processingData(x)
table(is.na(x))

## ----miximp, echo = FALSE, fig.cap = "Mixed imputation method. Black cells represent presence of quantitation values and light grey corresponds to missing data. The two groups of interest are depicted in green and blue along the heatmap columns. Two classes of proteins are annotated on the left: yellow are proteins with randomly occurring missing values (if any) while proteins in brown are candidates for non-random missing value imputation."----
x <- impute(naset, "zero")
exprs(x)[exprs(x) != 0] <- 1
suppressPackageStartupMessages(library("gplots"))
heatmap.2(exprs(x), col = c("lightgray", "black"),
          scale = "none", dendrogram = "none",
          trace = "none", keysize = 0.5, key = FALSE,
          RowSideColors = ifelse(fData(x)$randna, "orange", "brown"),
          ColSideColors = rep(c("steelblue", "darkolivegreen"), each = 8))

## ----miximp2---------------------------------------------------------------
x <- impute(naset, method = "mixed",
            randna = fData(naset)$randna,
            mar = "knn", mnar = "min")
x

## ----normalise, echo=TRUE, cache=FALSE-------------------------------------
qnt.max <- normalise(qnt, "max")
qnt.sum <- normalise(qnt, "sum")
qnt.quant <- normalise(qnt, "quantiles")
qnt.qrob <- normalise(qnt, "quantiles.robust")
qnt.vsn <- normalise(qnt, "vsn")

## ----normPlot, echo=FALSE, fig.cap = "Comparison of the normalisation *MSnSet* methods. Note that vsn also glog-transforms the intensities."----
.plot <- function(x, ttl = NULL) {
  boxplot(exprs(x),
          main = ifelse(is.null(ttl), processingData(x)@processing[2], ttl),
          cex.main = .8,
          cex.lab = .5,
          cex.axis = .5,
          cex = .8)
  grid()
}
oldmar <- par()$mar
par(mfrow=c(3,2),mar=c(2.9,2.9,2.9,1))
.plot(qnt, ttl = "Non-normalised data")
.plot(qnt.max, ttl = "Maximum")
.plot(qnt.sum, ttl = "Sum")
.plot(qnt.quant, ttl = "Quantile")
.plot(qnt.qrob, ttl = "Robust quantile")
.plot(qnt.vsn, ttl = "vsn")

## ----cvdata, echo=FALSE, cache=FALSE---------------------------------------
sd1 <- apply(log2(exprs(qnt))+10,1,sd)
mn1 <- apply(log2(exprs(qnt))+10,1,mean)
cv1 <- sd1/mn1
sd2 <- apply(exprs(qnt.vsn)+10,1,sd)
mn2 <- apply(exprs(qnt.vsn)+10,1,mean)
cv2 <- sd2/mn2
dfr <- rbind(data.frame(rank=order(mn1),cv=cv1,norm="raw"),
             data.frame(rank=order(mn2),cv=cv2,norm="vsn"))
library("zoo")
## rmed1 <- rollapply(cv1,7,function(x) median(x,na.rm=TRUE))
## rmed2 <- rollapply(cv2,7,function(x) median(x,na.rm=TRUE))
##
## Calling directly rollapply.zoo to make it zoo_1.6-4 compatible.
## The above requires zoo >= 1.7-0, which is as of 15 March 2011
## not yet available on CRAN (only on r-forge).
rmed1 <- zoo:::rollapply.zoo(cv1,7,function(x) median(x,na.rm=TRUE))
rmed2 <- zoo:::rollapply.zoo(cv2,7,function(x) median(x,na.rm=TRUE))
dfr2 <-
  rbind(data.frame(x=seq(1,70,by=(70/length(rmed1))),
                   y=rmed1,norm="raw"),
        data.frame(x=seq(1,70,by=(70/length(rmed1))),
                   y=rmed2,norm="vsn"))

p <- qplot(rank,cv,data=dfr,col=norm) +
  geom_line(data=dfr2,aes(x=x,y=y,colour=norm)) +
  theme_gray(7)

## ----cvPlot, echo=FALSE, fig.cap = "CV versus signal intensity comparison for log2 and vsn transformed data. Lines indicate running CV medians."----
print(p)

## ----prepareMsnsetNormPlot, cache=FALSE, echo=FALSE, keep.fig='none'-------
p <- plot(normalise(experiment[bsasel], "max"),
          reporters = iTRAQ4, full = FALSE, plot = FALSE)
p <- p + theme_gray(7)

## ----msnexpNormPlot, echo=FALSE, fig.cap = "Experiment-wide normalised MS2 spectra. The y-axes of the individual spectra is now rescaled between 0 and 1 (highest peak), as opposed to figure \\@ref(fig:msnexpPlot)."----
print(p)

## ----makeGroups1,echo=FALSE,cache=FALSE------------------------------------
gb <- fData(qnt)$ProteinAccession

## ----makeGroups2,echo=TRUE,cache=FALSE-------------------------------------
gb <- fData(qnt)$ProteinAccession
table(gb)
length(unique(gb))

## ----combineFeatures, echo=TRUE, cache=FALSE-------------------------------
qnt2 <- combineFeatures(qnt, groupBy = gb, fun = "median")
qnt2

## ----count-----------------------------------------------------------------
sc <- quantify(msexp, method = "count")
## lets modify out data for demonstration purposes
fData(sc)$DatabaseAccess[1] <- fData(sc)$DatabaseAccess[2]
fData(sc)$DatabaseAccess
sc <- combineFeatures(sc, groupBy = fData(sc)$DatabaseAccess,
                      fun = "sum")
exprs(sc)

## ----labelfree-------------------------------------------------------------
fData(msexp)[, c("DatabaseAccess", "nprot")]

## ----SIn-------------------------------------------------------------------
siquant <- quantify(msexp, method = "SIn")
processingData(siquant)
exprs(siquant)

## ----compms2plot, fig.cap = "Comparing two MS2 spectra."-------------------
centroided <- pickPeaks(itraqdata, verbose = FALSE)
(k <- which(fData(centroided)[, "PeptideSequence"] == "TAGIQIVADDLTVTNPK"))
mzk <- precursorMz(centroided)[k]
zk <- precursorCharge(centroided)[k]
mzk * zk
plot(centroided[[k[1]]], centroided[[k[2]]])

## ----compareSpectra, tidy=FALSE--------------------------------------------
compareSpectra(centroided[[2]], centroided[[3]],
               fun = "common")
compareSpectra(centroided[[2]], centroided[[3]],
               fun = "cor")
compareSpectra(centroided[[2]], centroided[[3]],
               fun = "dotproduct")

## ----msnexpcompareSpectra--------------------------------------------------
compmat <- compareSpectra(centroided, fun="cor")
compmat[1:10, 1:5]

## ----dendo-----------------------------------------------------------------
plot(hclust(as.dist(compmat)))

## ----incompdiss, echo=TRUE, cache=FALSE, tidy=FALSE------------------------
iTRAQ5
incompdiss <- quantify(itraqdata,
                       method = "trap",
                       reporters = iTRAQ5,
                       strict = FALSE,
                       verbose = FALSE)
head(exprs(incompdiss))

## ----incompdissPlot, echo=FALSE, warning=FALSE, fig.cap ="Boxplot and scatterplot comparing intensities of the 4 reporter ions (or their sum, on the right) and the incomplete dissociation specific peak."----
dfr <- cbind(expand.grid("feature" = featureNames(incompdiss),
                         "reporters" = sub("iTRAQ5\\.", "",
                                           sampleNames(incompdiss)),
                         stringsAsFactors=FALSE),
             "intensity" = as.vector(exprs(incompdiss)))
repsum <- rowSums(exprs(incompdiss)[, 1:4])
dfr2 <- data.frame(iTRAQ1to4 = repsum, iTRAQ5 = exprs(incompdiss)[,5])
p1 <- ggplot(data = dfr, aes(x = reporters,y = log10(intensity))) +
  geom_boxplot() +
  theme_gray(6)
p2 <- ggplot(data = dfr2, aes(x = log10(iTRAQ1to4), y = log10(iTRAQ5))) +
  geom_point(alpha = I(1/2)) +
  geom_abline(intercept = 0, slope = 1, linetype = "dotted") +
  stat_smooth(method = lm, se = FALSE) +
  xlab(label = expression(log[10]~sum~114~to~117)) +
  ylab(label = expression(log[10]~145)) +
  theme_gray(6)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 2)))
print(p1, vp = vplayout(1, 1))
print(p2, vp = vplayout(1, 2))

## ----makeexp12, echo=TRUE, cache=FALSE, tidy = FALSE-----------------------
exp1 <- quantify(itraqdata, reporters = iTRAQ4,
                 verbose = FALSE)
sampleNames(exp1)
centroided(rawdata) <- FALSE
exp2 <- quantify(rawdata, reporters = iTRAQ4,
                 verbose = FALSE)
sampleNames(exp2)

## ----updateFnames, echo=TRUE, cache=FALSE----------------------------------
head(featureNames(exp1))
exp1 <- updateFeatureNames(exp1)
head(featureNames(exp1))
head(featureNames(exp2))
exp2 <- updateFeatureNames(exp2)
head(featureNames(exp2))

## ----comb1, echo=TRUE, cache=FALSE-----------------------------------------
exp12 <- combine(exp1, exp2)
dim(exp1)
dim(exp2)
dim(exp12)

## ----make2exps2, echo=TRUE, cache=FALSE, tidy=FALSE------------------------
set.seed(1)
i <- sample(length(itraqdata), 35)
j <- sample(length(itraqdata), 35)
exp1 <- quantify(itraqdata[i], reporters = iTRAQ4,
                 verbose = FALSE)
exp2 <- quantify(itraqdata[j], reporters = iTRAQ4,
                 verbose = FALSE)
exp1 <- droplevels(exp1)
exp2 <- droplevels(exp2)
table(featureNames(exp1) %in% featureNames(exp2))
exp1 <- combineFeatures(exp1,
                        groupBy = fData(exp1)$ProteinAccession)
exp2 <- combineFeatures(exp2,
                        groupBy = fData(exp2)$ProteinAccession)
head(featureNames(exp1))
head(featureNames(exp2))

## ----renameSamples, echo=TRUE, cache=FALSE---------------------------------
sampleNames(exp1)
exp1 <- updateSampleNames(exp1)
sampleNames(exp1)
sampleNames(exp1) <- c("Ctrl1", "Cond1", "Ctrl2", "Cond2")
sampleNames(exp2) <- c("Ctrl3", "Cond3", "Ctrl4", "Cond4")

## ----fdatanames, echo=TRUE, cache=FALSE------------------------------------
stopifnot(all(fvarLabels(exp1) == fvarLabels(exp2)))
fData(exp1)["BSA", 1:4]
fData(exp2)["BSA", 1:4]

## ----renameFvars, echo=TRUE, cache=FALSE-----------------------------------
exp1 <- updateFvarLabels(exp1)
exp2 <- updateFvarLabels(exp2)
head(fvarLabels(exp1))
head(fvarLabels(exp2))

## ----combine, echo=TRUE, cache=FALSE---------------------------------------
exp12 <- combine(exp1, exp2)
dim(exp12)
pData(exp12)
exprs(exp12)[25:28, ]
exp12

## ----split-----------------------------------------------------------------
data(dunkley2006)
head(pData(dunkley2006))
split(dunkley2006, dunkley2006$replicate)
## or, defining the appropriate annotation variable name
dun <- split(dunkley2006, "replicate")

## ----unsplit---------------------------------------------------------------
dun2 <- unsplit(dun, pData(dunkley2006)$replicate)
compareMSnSets(dunkley2006, dun2)

## ----avg-------------------------------------------------------------------
library("pRolocdata")
data(tan2009r1)
data(tan2009r2)
data(tan2009r3)
msnl <- MSnSetList(list(tan2009r1, tan2009r2, tan2009r3))
avgtan <- averageMSnSet(msnl)
head(exprs(avgtan))
head(fData(avgtan)$disp)
head(fData(avgtan)$nNA)

## ----plot2Davg, fig.cap = "PCA plot of the averaged *MSnSet*. The point sizes are proportional to the dispersion of the protein quantitation across the averaged data."----
disp <- rowMax(fData(avgtan)$disp)
disp[disp == 0] <- max(disp)
range(disp)
library("pRoloc")
plot2D(avgtan, cex = 3 * disp)

## ----sessioninfo, echo=FALSE-----------------------------------------------
sessionInfo()

