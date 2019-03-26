## ----setup,include=FALSE-------------------------------------------------
knitr::opts_chunk$set( echo = TRUE )
library( Haplin, quietly = TRUE )

## ----eval=FALSE----------------------------------------------------------
#  haplin( my.prepared.gen.data )

## ----eval=FALSE----------------------------------------------------------
#  haplinSlide( my.prepared.gen.data, use.missing = TRUE, winlength = 3 )

## ----eval=FALSE----------------------------------------------------------
#  ?haplin

## ----eval=FALSE----------------------------------------------------------
#  ?haplinSlide

## ----haplinfig1,fig.keep='high',fig.show='hold',fig.width=6,fig.height=5,fig.pos='!hb',fig.cap="Results of trial run no.1"----
dir.exmpl <- system.file( "extdata", package = "Haplin" )
exemplary.file1 <- paste0( dir.exmpl, "/HAPLIN.trialdata.txt" )

trial.data1 <- genDataRead( file.in = exemplary.file1, file.out = "trial_data1",
	dir.out = ".", format = "haplin", n.vars = 0, overwrite = T )
trial.data1.prep <- genDataPreprocess( data.in = trial.data1, design = "triad",
  file.out = "trial_data1_prep", dir.out = ".", overwrite = T )
haplin( trial.data1.prep, use.missing = TRUE, maternal = TRUE )

## ------------------------------------------------------------------------
my.results <- haplin( trial.data1.prep, use.missing = TRUE, maternal = TRUE,
  verbose = FALSE, printout = FALSE )
my.results

## ----haplinfig2,fig.keep='high',fig.show='hold',fig.width=6,fig.height=5,fig.pos='!hb',fig.cap="Results of trial run no.2"----
exemplary.file2 <- paste0( dir.exmpl, "/HAPLIN.trialdata2.txt" )

trial.data2 <- genDataRead( file.in = exemplary.file2, file.out = "trial_data2",
	dir.out = ".", format = "haplin", allele.sep = "", n.vars = 2, overwrite = T )
trial.data2.prep <- genDataPreprocess( data.in = trial.data2, design = "triad",
  file.out = "trial_data2_prep", dir.out = ".", overwrite = T )
haplin( trial.data2.prep, use.missing = TRUE, ccvar = 2, design =
  "cc.triad", reference = "ref.cat", response = "mult" )

## ----haplinslide_read----------------------------------------------------
exemplary.file3 <- paste0( dir.exmpl, "/exmpl_data.ped" )

hapSlide.data <- genDataRead( exemplary.file3, file.out = "hapSlide_data",
	format = "ped", overwrite = T )
hapSlide.data

## ----haplinslide_subset--------------------------------------------------
hapSlide.subset.data <- genDataGetPart( hapSlide.data, design = "cc",
	markers = 1:100, file.out = "hapSlide_subset_data", overwrite = T )
hapSlide.subset.data.prep <- genDataPreprocess( hapSlide.subset.data,
	design = "cc.triad", file.out = "hapSlide_subset_prep", overwrite = T )

## ----haplinslide---------------------------------------------------------
hapSlide.res1 <- haplinSlide( hapSlide.subset.data.prep, use.missing = TRUE,
	ccvar = 10, design = "cc.triad", reference = "ref.cat", response = "mult" )

## ----plot_p_val,fig.keep='high',fig.show='hold',fig.width=8,fig.height=5,fig.pos='!hb',fig.cap="Results of haplinSlide analysis in a plot of the overall p-values"----
all.p.values <- plotPValues( hapSlide.res1 )

## ----plot_p_val2,fig.keep='high',fig.show='hold',fig.width=6,fig.height=5,fig.pos='!hb',fig.cap="Results of haplinSlide analysis in a plot of the overall p-values, for windows with p-values below 0.25"----
all.p.values <- plotPValues( hapSlide.res1, plot.signif.only = TRUE,
	signif.thresh = 0.25 )

## ----show_p_val3---------------------------------------------------------
head( all.p.values )

## ----haplinslide2,fig.width=8,fig.height=5,fig.pos='!hb',fig.cap="Results of haplinSlide analysis in a plot of the 'maternal' p-values, for windows with p-values below 0.2"----
hapSlide.res2 <- haplinSlide( hapSlide.subset.data.prep, use.missing = TRUE,
  ccvar = 10, design = "cc.triad", poo = TRUE, reference = "ref.cat",
  response = "mult" )
all.p.values2 <- plotPValues( hapSlide.res2, which.p.val = "poo",
	plot.signif.only = TRUE, signif.thresh = 0.2 )
head( all.p.values2 )

## ----haplinSlide_plot_RR,fig.keep='high',fig.show='hold',fig.width=8,fig.height=5,fig.pos='!hb',fig.cap="Results of haplinSlide analysis in a plot of the relative risks, for windows with p-values below 0.05. Coding of symbols: 'cdd' means a double allele dose (both parents gave the same allele), while 'cm_cf' is the ratio of the risks calculated for when the minor allele came from the mother to the risk when the minor allele came from the father (RRR = RR_cm / RR_cf)."----
plot( hapSlide.res2, plot.signif.only = TRUE )

## ----haplinSlide_maternal,fig.keep='high',fig.show='hold',fig.width=8,fig.height=5,fig.pos='!hb',fig.cap="Results of haplinSlide analysis in a plot of the relative risks, for windows with p-values below 0.05. The top panels show the relative risks (RR) when a given haplotype was found in the child, while the bottom panels show RR of the disease in the child, when a given haplotype occured in the mother. Coding of symbols: 'c' and 'cdd' means a single and double haplotype dose in the child, respectively; while 'm' and 'mdd' is a single and double haplotype dose in the mother."----
hapSlide.res3 <- haplinSlide( hapSlide.subset.data.prep, use.missing = TRUE,
  ccvar = 10, design = "cc.triad", maternal = TRUE, reference = "ref.cat",
  response = "mult", winlength = 2 )
plot( hapSlide.res3, plot.signif.only = TRUE, signif.thresh = 0.01 )

## ----haplinStrat---------------------------------------------------------
hapStrat.res <- haplinStrat( data = trial.data2.prep, strata = 1, use.missing = TRUE,
  ccvar = 2, design = "cc.triad", reference = "ref.cat", response = "mult" )

## ----haplinStrat_summary-------------------------------------------------
lapply( hapStrat.res, haptable )

## ----haplinStrat_plot,fig.keep='high',fig.show='hold',fig.width=9,fig.height=4,fig.pos='!hb',fig.cap="Results of haplinStrat run."----
plot( hapStrat.res )

## ----haplinStrat_gxe-----------------------------------------------------
gxe( hapStrat.res )

