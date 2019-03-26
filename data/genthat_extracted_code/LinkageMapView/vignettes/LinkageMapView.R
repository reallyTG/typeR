## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse=TRUE,comment="#>")

## ------------------------------------------------------------------------
library(LinkageMapView)
data(carrot)
head(carrot)

## ------------------------------------------------------------------------
library(qtl)
data(hyper)
class(hyper)
summary(hyper)

## ------------------------------------------------------------------------
outfile = file.path(tempdir(), "hyper.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15))

## ---- out.width = "680px",echo=FALSE-------------------------------------
knitr::include_graphics("hyper.png")

## ------------------------------------------------------------------------
outfile = file.path(tempdir(), "hyper_dupnbr.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15),dupnbr = TRUE)

## ---- out.width = "680px",echo=FALSE-------------------------------------
knitr::include_graphics("hyper_dupnbr.png")

## ------------------------------------------------------------------------
outfile = file.path(tempdir(), "hyper_showonly.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15),lcol="green",lcex=2,lfont=2,
    rcol="red",rcex=2,rfont=3,
    showonly=c("D1Mit123","D4Mit80","D6Mit135","D15Mit156"))

## ---- out.width = "680px",echo=FALSE-------------------------------------
knitr::include_graphics("hyper_showonly.png")

## ------------------------------------------------------------------------
outfile = file.path(tempdir(), "hyper_titles.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15),col.lgtitle = "blue",cex.lgtitle=2,
    col.main = "red",main="Overall Title for the Output Map")

## ---- out.width = "680px",echo=FALSE-------------------------------------
knitr::include_graphics("hyper_titles.png")

## ------------------------------------------------------------------------
## plot a carrot comparative linkage map
## kindly provided by Massimo Iorizzo:
## Cavagnaro et al. BMC Genomics 2014, 15:1118
data(carrot)
# make a df to pass qtl info
qtldf <- data.frame(
  chr = character(),
  qtl = character(),
  so = numeric(),
  si = numeric(),
  ei = numeric(),
  eo = numeric(),
  col = character(),
  stringsAsFactors = FALSE
)
qtldf <- rbind(qtldf,
               data.frame(
                 chr = "70349LG3",
                 qtl = "RTPE-Q1",
                 so = 36.6,
                 si = 37,
                 ei = 37,
                 eo = 38,
                 col="red"
               ))
# make a list to pass label options
flist <- list()
locus <- c("BSSR-094", "K0149", "K0627", "K2161", "ESSR-087", "ESSR-057")
font  <- c(2)   #bold
flist[[1]] <- list(locus = locus, font = font)
locus <- c("F3H", "FLS1")
font  <- c(4)   #bold italic
flist[[2]] <- list(locus = locus, font = font)
locus <- c("P3", "P1", "Raa1")
font  <- c(3)   #italic
col <- c("red")
flist[[3]] <- list(locus = locus, font = font, col = col)

outfile = file.path(tempdir(), "carrot.pdf")
lmv.linkage.plot(
  carrot,
  outfile = outfile,
  ruler = TRUE,
  lgtitle = c("2170", "70349", "10117"),
  maxnbrcolsfordups = 2,
  markerformatlist = flist,
  lg.col = "lightblue1",
  pdf.height = 16,
  pdf.width = 10,
  revthese = c("70349LG3"),
  qtldf=qtldf
)


## ---- out.width = "500px",echo=FALSE-------------------------------------
knitr::include_graphics("carrot.png")

## ------------------------------------------------------------------------
## do a density map with default colors and customize the axis
data(oat)

## draw tickmarks at each cM from 0 to largest position of linkage groups to be drawn
maxpos <- floor(max(oat$Position[oat$Group == "Mrg01" | oat$Group == "Mrg02"]))
at.axis <- seq(0, maxpos)

## put labels on ruler at every 10 cM
axlab <- vector()
      for (lab in 0:maxpos) {
        if (!lab %% 10) {
          axlab <- c(axlab, lab)
        }
        else {
          axlab <- c(axlab, NA)
        }
      }

outfile = file.path(tempdir(), "oat_denmap.pdf")
lmv.linkage.plot(oat,outfile,mapthese=c("Mrg01","Mrg02"),denmap=TRUE, cex.axis = 1, at.axis = at.axis, labels.axis = axlab)

## ---- out.width = "120px",echo=FALSE-------------------------------------
knitr::include_graphics("oat_denmap.png")

