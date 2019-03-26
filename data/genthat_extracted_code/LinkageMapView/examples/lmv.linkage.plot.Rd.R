library(LinkageMapView)


### Name: lmv.linkage.plot
### Title: LinkageMapView plotting function
### Aliases: lmv.linkage.plot

### ** Examples


## take a cross object from r/qtl and produce linkage map
## on chr 1,4,6,15

library(qtl)
data(hyper)
outfile = file.path(tempdir(), "hyper.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15))

## color some of the markers for emphasis

library(qtl)
data(hyper)

# make a list to pass label options
flist <- list()
locus <- c("D1Mit123","D1Mit105","D6Mit273","D15Mit56","D15Mit156")
col   <- c("red")
flist[[1]] <- list(locus=locus,col=col)

outfile = file.path(tempdir(), "hyperred.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15),markerformatlist=flist)

## change some of the pdf options and chromosome color
## changing linkage group title color (col.lgtitle) to same as
## foreground pdf color

library(qtl)
data(hyper)

outfile = file.path(tempdir(), "hyperlg.pdf")
lmv.linkage.plot(hyper,outfile,
mapthese=c(1,4,6,15),
pdf.bg="black",pdf.fg="white",col.lgtitle="white",
pdf.height=8,pdf.title="myhyper",lg.col="tan")

## change all label colors and fonts

library(qtl)
data(hyper)

outfile = file.path(tempdir(), "hypercol.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15),
lcol="blue",lfont=2,lcex=1.2,rcol="red",rfont=3,rcex=2)

## make a dataframe to pass sections of chr to col
## use a ruler instead of printing positions as labels
## only allow one column for duplicate markers at same position
## (default is 3)

library(qtl)
data(hyper)

chr = c(1, 4, 6, 15)
s = c(82,35,9.8,7.7)
e = c(94,47,21.9,13.1)
col = c("pink","blue","blue","green")
sectcoldf <-  data.frame(chr, s, e, col,stringsAsFactors = FALSE)

outfile = file.path(tempdir(), "hyperruler.pdf")
lmv.linkage.plot(hyper,outfile,mapthese=c(1,4,6,15),
ruler=TRUE,maxnbrcolsfordups = 1, sectcoldf=sectcoldf)

## plot qtls also out of a r/qtl scanone object
## plot marker names on left (instead of right) of chr 4 and 7

library(qtl)
data(hyper)

# create scanone df for testing
hyper <-
 calc.genoprob(hyper,
               step = 2.0,
               map.function = "haldane",
               stepwidth = "fixed")
hyper.scanone <- scanone(hyper)

outfile = file.path(tempdir(), "testrqtlhyper2.pdf")
lmv.linkage.plot(hyper,
   outfile, mapthese=c(1,4,6,7,15),
   qtlscanone = hyper.scanone,
   posonleft = c(TRUE,FALSE,TRUE,FALSE,TRUE))

## Not run: 
##D ## plot a carrot comparative linkage map
##D ## kindly provided by Massimo Iorizzo:
##D ## Cavagnaro et al. BMC Genomics 2014, 15:1118
##D 
##D # make a df to pass qtl info
##D qtldf <- data.frame(
##D   chr = character(),
##D   qtl = character(),
##D   so = numeric(),
##D   si = numeric(),
##D   ei = numeric(),
##D   eo = numeric(),
##D   col = character(),
##D   stringsAsFactors = FALSE
##D )
##D qtldf <- rbind(qtldf,
##D                data.frame(
##D                  chr = "70349LG3",
##D                  qtl = "RTPE-Q1",
##D                  so = 36.6,
##D                  si = 37,
##D                  ei = 37,
##D                  eo = 38,
##D                  col="red"
##D                ))
##D # make a list to pass label options
##D flist <- list()
##D locus <- c("BSSR-094", "K0149", "K0627", "K2161", "ESSR-087", "ESSR-057")
##D font  <- c(2)   #bold
##D flist[[1]] <- list(locus = locus, font = font)
##D locus <- c("F3H", "FLS1")
##D font  <- c(4)   #bold italic
##D flist[[2]] <- list(locus = locus, font = font)
##D locus <- c("P3", "P1", "Raa1")
##D font  <- c(3)   #italic
##D col <- c("red")
##D flist[[3]] <- list(locus = locus, font = font, col = col)
##D filename <- system.file("extdata", "Carrot.csv", package="LinkageMapView")
##D outfile = file.path(tempdir(), "carrot.pdf")
##D lmv.linkage.plot(
##D   mapthis = filename,
##D   outfile = outfile,
##D   ruler = TRUE,
##D   lgtitle = c("2170", "70349", "10117"),
##D   maxnbrcolsfordups = 1,
##D   markerformatlist = flist,
##D   lg.col = "lightblue1",
##D   pdf.width =10,
##D   revthese = c("70349LG3"),
##D   qtldf=qtldf
##D )
## End(Not run)

## do a density map with default colors
data(oat)

outfile = file.path(tempdir(), "oat_Mrg01.pdf")
lmv.linkage.plot(oat,outfile,mapthese=c("Mrg01","Mrg02"),denmap=TRUE)

## Not run: 
##D ## do a density map and provide your own colors with lmvdencolor helper
##D data(oat)
##D ##
##D outfile = file.path(tempdir(), "oat_Mrg01_YlGn.pdf")
##D 
##D sectcoldf <- lmvdencolor(oat,colorin =
##D colorRampPalette(RColorBrewer::brewer.pal(8, "YlGn"))(5))
##D 
##D lmv.linkage.plot(oat,outfile,denmap=TRUE,sectcoldf=sectcoldf)
## End(Not run)



