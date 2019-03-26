## ----SetUp, echo = FALSE, eval = TRUE, results = "hide"----

# R options & configuration:
set.seed(9)
rm(list = ls())
suppressMessages(library("knitr"))
suppressMessages(library("ChemoSpec"))
suppressMessages(library("ChemoSpecUtils"))
suppressMessages(library("mclust"))
suppressMessages(library("RColorBrewer"))

options(width =  30) # for pinp specifically (narrow cols)

desc <- packageDescription("ChemoSpec")

# Stuff specifically for knitr:

#opts_chunk$set(eval = FALSE)

## ----Chunk1,  results = "hide", eval = FALSE----
#  source("My_First_ChemoSpec.R")

## ----Chunk2,  results = "hide", eval = FALSE----
#  ssp <- files2SpectraObject(
#    gr.crit = c("sspA", "sspB"),
#    gr.cols = c("red", "blue"),
#    freq.unit = "ppm",
#    int.unit = "peak intensity",
#    descrip = "Subspecies Study",
#    out.file = "subsp")

## ----Chunk3,  results = "hide", eval = FALSE----
#  SubspeciesNMR <- loadObject("subsp.RData")

## ----Chunk5-----------------
data(SrE.IR) # makes the data available
sumSpectra(SrE.IR)

## ----Chunk8, fig.cap = "\\label{plot}Sample plot."----
# We'll make a fancy title here
# and re-use in other plots
myt <- expression(
  bolditalic(Serenoa)~
  bolditalic(repens)~
  bold(Extract~IR~Spectra))
plotSpectra(SrE.IR,
  main = myt,
  which = c(1, 2, 14, 16),
  yrange = c(0, 1.6),
  offset = 0.4,
  lab.pos = 2200)

## ----Chunk10, fig.cap = "\\label{subplot}Detail of the carbonyl region."----
plotSpectra(SrE.IR,
  main = myt,
  which = c(1, 2, 14, 16),
  yrange = c(0, 0.6),
  offset = 0.1,
  lab.pos = 1775,
  xlim = c(1650, 1800))

## ----Chunk9-----------------
# if there are only a few spectra
# show all of the names
SrE.IR$names
# if there are a lot of spectra,
# grep for the desired names
grep("OO", SrE.IR$names)

## ----Chunk10b, fig.cap = "\\label{baseline}Correcting baseline drift."----
SrE2.IR <- baselineSpectra(SrE.IR,
  int = FALSE,
  method = "modpolyfit",
  retC = TRUE)

## ----Chunk18----------------
tmp <- binSpectra(SrE.IR, bin.ratio = 4)
sumSpectra(tmp)

## ----Chunk11----------------
noTD <- removeSample(SrE2.IR,
  rem.sam = c("TD_adSrE"))
sumSpectra(noTD)
grep("TD_adSrE", noTD$names)

## ----Chunk12----------------
SrE <- grep("SrE", SrE2.IR$names)
# show the name(s) that contain "SrE"
SrE2.IR$names[SrE]
SrE # gives the corresponding indices

## ----Chunk14, fig.cap = "\\label{surv}Checking for regions of no interest.", fig.dim = c(7,7), out.width = "\\linewidth", out.height = "\\linewidth"----
surveySpectra(SrE2.IR,
  method = "iqr",
  main = myt,
  by.gr = FALSE)

## ----Chunk14d, fig.cap = "\\label{surv2}Checking for regions of no interest."----
surveySpectra2(SrE2.IR,
  method = "iqr",
  main = myt)

## ----Chunk14a, fig.cap = "\\label{survA}Detail of carbonyl region.", fig.dim = c(7,7), out.width = "\\linewidth", out.height = "\\linewidth"----
surveySpectra(SrE2.IR,
  method = "iqr",
  main = "Detail of Carbonyl Region",
  by.gr = FALSE,
  xlim = c(1650, 1800))

## ----Chunk14b, fig.cap = "\\label{survB}Detail of carbonyl region by group.", fig.dim = c(7,7), out.width = "\\linewidth", out.height = "\\linewidth"----
surveySpectra(SrE2.IR,
  method = "iqr",
  main = "Detail of Carbonyl Region",
  by.gr = TRUE,
  xlim = c(1650, 1800))

## ----Chunk14c, fig.cap = "\\label{survC}Inspection of an uninteresting spectral region.", fig.dim = c(7,7), out.width = "\\linewidth", out.height = "\\linewidth"----
surveySpectra(SrE2.IR,
  method = "iqr",
  main = "Detail of Empty Region",
  by.gr = FALSE,
  xlim = c(1800, 2500),
  ylim = c(0.0, 0.05))

## ----Chunk15----------------
SrE3.IR <- removeFreq(SrE2.IR,
  rem.freq = SrE2.IR$freq > 1800 &
  SrE2.IR$freq < 2500)
sumSpectra(SrE3.IR)

## ----Chunk7, fig.cap = "\\label{gaps}Identifying gaps in a data set."----
check4Gaps(SrE3.IR$freq, SrE3.IR$data[1,])

## ----Chunk19, fig.cap = "\\label{hca}Hierarchical cluster analysis."----
HCA <- hcaSpectra(SrE3.IR, main = myt)

## ----Chunk10a, fig.cap = "\\label{classPCA}Classical PCA scores."----
c_res <- c_pcaSpectra(SrE3.IR,
  choice = "noscale")
plotScores(SrE3.IR, c_res,
  main = myt,
  pcs = c(1,2),
  ellipse = "rob",
  tol = 0.01)

## ----Chunk21, fig.cap = "\\label{robPCA}Robust PCA scores."----
r_res <- r_pcaSpectra(SrE3.IR,
  choice = "noscale")
plotScores(SrE3.IR, r_res,
  main = myt,
  pcs = c(1,2),
  ellipse = "rob",
  tol = 0.01)

## ----Chunk22, fig.cap = "\\label{OD}Diagnostics: orthogonal distances."----
diagnostics <- pcaDiag(SrE3.IR, c_res,
  pcs = 2,
  plot = "OD")

## ----Chunk23, fig.cap = "\\label{SD}Diagnostics: score distances."----
diagnostics <- pcaDiag(SrE3.IR, c_res,
  pcs = 2,
  plot = "SD")

## ----Chunk24, fig.cap = "\\label{scree}Scree plot."----
plotScree(c_res, main = myt)

## ----Chunk24a, fig.cap = "\\label{scree2}Alternate style scree plot."----
plotScree(c_res, style = "alt", main = myt)

## ----Chunk25, fig.cap = "\\label{boot}Bootstrap analysis for no. of principal components."----
out <- cv_pcaSpectra(SrE3.IR,
  pcs = 5)

## ----Chunk26,  results = "hide", eval = FALSE----
#  plotScoresRGL(SrE3.IR, c_res,
#    main = "S. repens IR Spectra",
#    leg.pos = "A",
#    t.pos = "B") # not run - it's interactive!

## ----Chunk27, fig.cap = "\\label{s3D}Plotting scores in 3D using plotScores3D.", fig.dim = c(7,7), out.width = "\\linewidth", out.height = "\\linewidth"----
plotScores3D(SrE3.IR, c_res,
  main = myt,
  ellipse = FALSE)

## ----Chunk29, fig.cap = "\\label{load}Loading plot.", fig.dim = c(7,7), out.width = "\\linewidth", out.height = "\\linewidth"----
plotLoadings(SrE3.IR, c_res,
  main = myt,
  loads = c(1, 2),
  ref = 1)

## ----Chunk30, fig.cap = "\\label{load2}Plotting one loading vs. another."----
res <- plot2Loadings(SrE3.IR, c_res,
  main = myt,
  loads = c(1, 2),
  tol = 0.002)

## ----Chunk30a,  fig.cap = "\\label{splot}s-Plot to identify influential frequencies."----
spt <- sPlotSpectra(SrE3.IR, c_res,
  main = myt,
  pc = 1,
  tol = 0.001)

## ----Chunk30b,  fig.cap = "\\label{splot2}s-Plot detail."----
spt <- sPlotSpectra(SrE3.IR, c_res,
  main = "Detail of s-Plot",
  pc = 1,
  tol = 0.05,
  xlim = c(-0.04, -0.01),
  ylim = c(-1.05, -0.9))

## ----Chunk31,  results = "hide", eval = FALSE----
#  hcaScores(SrE3.IR,  c_res,
#    scores = c(1:5),
#    main = myt)

## ----Chunk35, fig.cap = "\\label{mclust1}mclust chooses an optimal model.", results = "hide"----
model <- mclustSpectra(SrE3.IR, c_res,
  plot = "BIC",
  main = myt)

## ----Chunk36, fig.cap = "\\label{mclust2}mclust's thoughts on the matter.", results = "hide"----
model <- mclustSpectra(SrE3.IR, c_res,
  plot = "proj",
  main = myt)

## ----Chunk37, fig.cap = "\\label{mclust3}Comparing mclust results to the TRUTH.", results = "hide"----
model <- mclustSpectra(SrE3.IR, c_res,
  plot = "errors",
  main = myt,
  truth = SrE3.IR$groups)

## ----Chunk33,  results = "hide", eval = FALSE----
#  # not run - it's interactive!
#  mclust3dSpectra(SrE3.IR, c_res)

## ----Chunk4,  echo = FALSE, fig.cap = "\\label{colors}Recommended color sets in \texttt{ChemoSpec}."----
par(mfrow = c(2,1), mar = c(3, 1, 2, 1))
display.brewer.pal(8, "Set1")
title(main = "ChemoSpec Primary Scheme")
display.brewer.pal(8, "Set2")
title(main = "ChemoSpec Pastel Scheme")
par(mfrow = c(1,1))

