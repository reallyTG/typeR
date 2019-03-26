## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('asgr/ProFound')
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
evalglobal=FALSE

## ---- eval=evalglobal----------------------------------------------------
#  library(ProFit)
#  library(ProFound)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  image = readFITS(system.file("extdata", 'KiDS/G266035fitim.fits', package="ProFit"))$imDat
#  segim_old = readFITS(system.file("extdata", 'KiDS/G266035segim.fits', package="ProFit"))$imDat
#  segim_new = profoundMakeSegim(image, plot=TRUE)
#  profoundSegimPlot(image, segim_old)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  segim_new_expand=profoundMakeSegimExpand(image, segim_new$segim, skycut=-1, expandsigma=5, dim=c(31,31), expand=1, plot=TRUE)
#  profoundSegimPlot(image, segim_old)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  segim_new_expand=profoundProFound(image, plot=TRUE)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  image = readFITS(system.file("extdata", 'KiDS/G278109fitim.fits', package="ProFit"))$imDat
#  segim_old = readFITS(system.file("extdata", 'KiDS/G278109segim.fits', package="ProFit"))$imDat
#  segim_new = profoundMakeSegim(image, plot=TRUE)
#  profoundSegimPlot(image, segim_old)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  segim_new = profoundMakeSegim(image, tolerance = Inf, plot=TRUE)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  segim_new_diff = profoundMakeSegim(profoundImDiff(image), skycut=2, plot=TRUE)

## ---- eval=evalglobal----------------------------------------------------
#  unique(segim_new_diff$segim[segim_new$segim==1])

## ---- eval=evalglobal----------------------------------------------------
#  sqrt(rowSums((segim_new_diff$segstats[1:2,c("xcen","ycen")]-segim_new$segstats[c(1,1),c("xcen","ycen")])^2))

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  segim_new$segim[segim_new_diff$segim==2]=max(segim_new$segim)+1
#  profoundSegimPlot(image, segim_new$segim)

## ---- eval=evalglobal, fig.width=5, fig.height=5, dpi=40-----------------
#  segim_new_expand=profoundMakeSegimExpand(image, segim_new$segim, skycut=-1, expandsigma=5, dim=c(31,31), expand=1, plot=TRUE)
#  profoundSegimPlot(image, segim_old)

