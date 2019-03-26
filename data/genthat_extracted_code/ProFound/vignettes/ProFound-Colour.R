## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('asgr/ProFound')
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
evalglobal=FALSE

## ------------------------------------------------------------------------
library(ProFound)

## ---- eval=evalglobal----------------------------------------------------
#  VISTA_K=readFITS(system.file("extdata", 'VISTA_K.fits', package="magicaxis"))
#  VST_r=readFITS(system.file("extdata", 'VST_r.fits', package="magicaxis"))
#  GALEX_NUV=readFITS(system.file("extdata", 'GALEX_NUV.fits', package="magicaxis"))

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimageWCS(VISTA_K)
#  magimageWCS(VST_r)
#  magimageWCS(GALEX_NUV)

## ---- eval=evalglobal----------------------------------------------------
#  pro_K=profoundProFound(VISTA_K, magzero=30)
#  pro_r=profoundProFound(VST_r, magzero=0)
#  pro_NUV=profoundProFound(GALEX_NUV, magzero=20.08) #Ugly zero point I know- see Driver et al 2016 Table 3!

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  plot(pro_K)
#  plot(pro_r)
#  plot(pro_NUV)

## ---- eval=evalglobal----------------------------------------------------
#  VST_r_warpK=magwarp(VST_r, header_out=VISTA_K$hdr)
#  GALEX_NUV_warpK=magwarp(GALEX_NUV, header_out=VISTA_K$hdr)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimageWCS(VISTA_K)
#  magimageWCS(VST_r_warpK)
#  magimageWCS(GALEX_NUV_warpK)

## ---- eval=evalglobal----------------------------------------------------
#  sum(VST_r$imDat)
#  sum(VST_r_warpK$image)
#  
#  sum(GALEX_NUV$imDat)
#  sum(GALEX_NUV_warpK$image)

## ---- eval=evalglobal----------------------------------------------------
#  pro_r_warpK=profoundProFound(VST_r_warpK, segim=pro_K$segim, magzero=0, iters=0)
#  pro_NUV_warpK=profoundProFound(GALEX_NUV_warpK, segim=pro_K$segim, magzero=20.08, iters=0)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  plot(pro_K)
#  plot(pro_r_warpK)
#  plot(pro_NUV_warpK)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(pro_NUV_warpK$segstats$mag-pro_K$segstats$mag, pro_r_warpK$segstats$mag-pro_K$segstats$mag, xlab='NUV-K', ylab='r-K')

## ---- eval=evalglobal----------------------------------------------------
#  multi=profoundMultiBand(inputlist=list(GALEX_NUV_warpK, VST_r_warpK, VISTA_K), magzero=c(20.08,0,30), iters_tot=0, detectbands='K', multibands=c('NUV','r','K'))

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(pro_NUV_warpK$segstats$mag, multi$cat_tot$mag_NUVt, grid=TRUE)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  profoundSegimPlot(multi$pro_detect$image, multi$pro_detect$group$groupim)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(multi$cat_grp$mag_rg, multi$cat_tot[match(multi$cat_grp$groupID, multi$cat_tot$segID),"mag_rt"], grid=TRUE, log='', xlab='Group Mag', ylab='Total Mag')
#  abline(0,1,col='red')

## ---- eval=evalglobal----------------------------------------------------
#  merge_cat=profoundCatMerge(segstats=multi$cat_tot, groupstats=multi$cat_grp, groupsegID=multi$pro_detect$group$groupsegID, groupID_merge=1)
#  multi$cat_tot[1:5,c('segID', 'mag_rt')]
#  multi$cat_grp[1:5,c('groupID', 'mag_rg')]
#  merge_cat[1:5,c('segID', 'mag_rt', 'origin')]

## ---- eval=evalglobal----------------------------------------------------
#  multi$pro_detect$group$groupsegID[1,"segID"][[1]]

## ---- eval=evalglobal----------------------------------------------------
#  merge_cat_col=multi$cat_col[multi$cat_col$segID %in% merge_cat$segID,]

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(merge_cat$mag_rt, merge_cat_col$mag_rc, xlab='Total Mag', ylab='Colour Mag', grid=TRUE)
#  abline(0,1,col='red')

## ---- eval=evalglobal----------------------------------------------------
#  segim_r=profoundSegimWarp(segim_in=pro_K$segim, header_in=VISTA_K$hdr, header_out=VST_r$hdr)
#  segim_NUV=profoundSegimWarp(segim_in=pro_K$segim, header_in=VISTA_K$hdr, header_out=GALEX_NUV$hdr)

## ---- eval=evalglobal----------------------------------------------------
#  pro_r_warpK2=profoundProFound(VST_r, segim=segim_r, magzero=0, iters=0)
#  pro_NUV_warpK2=profoundProFound(GALEX_NUV, segim=segim_NUV, magzero=20.08, iters=0)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  plot(pro_K)
#  plot(pro_r_warpK2)
#  plot(pro_NUV_warpK2)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(pro_r_warpK$segstats$mag[match(pro_r_warpK2$segstats$segID,pro_r_warpK$segstats$segID)], pro_r_warpK2$segstats$mag, grid=TRUE, xlab='r Image Warp / mag', ylab='r Segim Warp / mag')
#  magplot(pro_NUV_warpK$segstats$mag[match(pro_NUV_warpK2$segstats$segID,pro_NUV_warpK$segstats$segID)], pro_NUV_warpK2$segstats$mag, grid=TRUE, xlab='NUV Image Warp / mag', ylab='NUV Segim Warp / mag')

