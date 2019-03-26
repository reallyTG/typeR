## ----setup, echo=FALSE, results="hide"--------------------------------------------------
library("knitr")
opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)

## ---------------------------------------------------------------------------------------
require(pals)
pal.bands(coolwarm, parula, ocean.haline, brewer.blues, cubicl, kovesi.rainbow, ocean.phase, brewer.paired(12), stepped,
          main="Colormap suggestions")

## ---------------------------------------------------------------------------------------
labs=c('alphabet','alphabet2', 'glasbey','kelly','polychrome', 'stepped', 'tol', 'watlington')
op=par(mar=c(0,5,3,1))
pal.bands(alphabet(), alphabet2(), glasbey(), kelly(),
  polychrome(), stepped(), tol(), watlington(), labels=labs, show.names=FALSE)
par(op)
pal.bands(coolwarm, viridis, parula, n=200)

## ---------------------------------------------------------------------------------------
pal.channels(parula, main="parula")

## ---------------------------------------------------------------------------------------
pal.cluster(alphabet2(), main="alphabet2")

## ---------------------------------------------------------------------------------------
pal.csf(parula, main="parula")

## ---------------------------------------------------------------------------------------
# smooth palettes usually easy to compress
p1 <- coolwarm(255)
cool2 <- pal.compress(coolwarm)
p2 <- colorRampPalette(cool2)(255)
pal.bands(p1, p2, cool2,
  labels=c('original','compressed', 'basis'), main="coolwarm")
pal.maxdist(p1,p2) # 2.08


## ---------------------------------------------------------------------------------------
#pal.cube(cubehelix)
#pal.cube(polychrome())

## ---------------------------------------------------------------------------------------
op <- par(mfrow=c(1,2), mar=c(1,1,2,2))
pal.heatmap(alphabet, n=26, main="alphabet")
pal.heatmap(alphabet2, n=26, main="alphabet2")
par(op)

## ---------------------------------------------------------------------------------------
pal.map(brewer.paired, n=12, main="brewer.paired")

## ---------------------------------------------------------------------------------------
pal.safe(parula, main="parula")

## ---------------------------------------------------------------------------------------
pal.scatter(polychrome, n=36, main="alphabet")

## ---------------------------------------------------------------------------------------
pal.sineramp(parula, main="parula")

## ---------------------------------------------------------------------------------------
op <- par(mfrow=c(3,1), mar=c(1,1,2,1))
pal.sineramp(jet, main="jet")
pal.sineramp(tol.rainbow, main="tol.rainbow")
pal.sineramp(kovesi.rainbow, main="kovesi.rainbow")
par(op)

## ---------------------------------------------------------------------------------------
pal.test(parula)
pal.test(viridis) # dark colors are poor

## ---------------------------------------------------------------------------------------
pal.volcano(parula)
pal.volcano(viridis)

## ---------------------------------------------------------------------------------------
pal.zcurve(parula, main="parula")

## ---------------------------------------------------------------------------------------
require(ggplot2)
require(pals)
require(reshape2)
ggplot(melt(volcano), aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile() + 
  scale_fill_gradientn(colours=coolwarm(100), guide = "colourbar")

## ---------------------------------------------------------------------------------------
# Discrete
pal.bands(alphabet, alphabet2, cols25, glasbey, kelly, polychrome, stepped, tol, watlington,
          main="Discrete", show.names=FALSE)


# Misc
pal.bands(coolwarm,warmcool,cubehelix,gnuplot,jet,parula,tol.rainbow,cividis)


# Niccoli
pal.bands(cubicyf,cubicl,isol,linearl,linearlhot,
          main="Niccoli")


# Qualtitative
pal.bands(brewer.accent(8), brewer.dark2(8), brewer.paired(12), brewer.pastel1(9),
          brewer.pastel2(8), brewer.set1(9), brewer.set2(8), brewer.set3(10),
          labels=c("brewer.accent", "brewer.dark2", "brewer.paired", "brewer.pastel1",
                   "brewer.pastel2", "brewer.set1", "brewer.set2", "brewer.set3"),
          main="Brewer qualitative")


# Sequential
pal.bands(brewer.blues, brewer.bugn, brewer.bupu, brewer.gnbu, brewer.greens,
          brewer.greys, brewer.oranges, brewer.orrd, brewer.pubu, brewer.pubugn,
          brewer.purd, brewer.purples, brewer.rdpu, brewer.reds, brewer.ylgn,
          brewer.ylgnbu, brewer.ylorbr, brewer.ylorrd,
          main="Brewer sequential")


# Diverging
pal.bands(brewer.brbg, brewer.piyg, brewer.prgn, brewer.puor, brewer.rdbu,
          brewer.rdgy, brewer.rdylbu, brewer.rdylgn, brewer.spectral,
          main="Brewer diverging")


# Ocean
pal.bands(ocean.thermal, ocean.haline, ocean.solar, ocean.ice, ocean.gray,
          ocean.oxy, ocean.deep, ocean.dense, ocean.algae, ocean.matter,
          ocean.turbid, ocean.speed, ocean.amp, ocean.tempo, ocean.phase,
          ocean.balance, ocean.delta, ocean.curl, main="Ocean")


# Matplotlib
pal.bands(magma, inferno, plasma, viridis, main="Matplotlib")


# Kovesi
op = par(mar=c(1,10,2,1))
pal.bands(kovesi.cyclic_grey_15_85_c0, kovesi.cyclic_grey_15_85_c0_s25,
kovesi.cyclic_mrybm_35_75_c68, kovesi.cyclic_mrybm_35_75_c68_s25,
kovesi.cyclic_mygbm_30_95_c78, kovesi.cyclic_mygbm_30_95_c78_s25,
kovesi.cyclic_wrwbw_40_90_c42, kovesi.cyclic_wrwbw_40_90_c42_s25,
kovesi.diverging_isoluminant_cjm_75_c23, kovesi.diverging_isoluminant_cjm_75_c24,
kovesi.diverging_isoluminant_cjo_70_c25, kovesi.diverging_linear_bjr_30_55_c53,
kovesi.diverging_linear_bjy_30_90_c45, kovesi.diverging_rainbow_bgymr_45_85_c67,
kovesi.diverging_bkr_55_10_c35, kovesi.diverging_bky_60_10_c30,
kovesi.diverging_bwr_40_95_c42, kovesi.diverging_bwr_55_98_c37,
kovesi.diverging_cwm_80_100_c22, kovesi.diverging_gkr_60_10_c40,
kovesi.diverging_gwr_55_95_c38, kovesi.diverging_gwv_55_95_c39,
kovesi.isoluminant_cgo_70_c39, kovesi.isoluminant_cgo_80_c38,
kovesi.isoluminant_cm_70_c39, kovesi.rainbow_bgyr_35_85_c72, kovesi.rainbow_bgyr_35_85_c73,
kovesi.rainbow_bgyrm_35_85_c69, kovesi.rainbow_bgyrm_35_85_c71,
main="Kovesi")

pal.bands(kovesi.linear_bgy_10_95_c74,
kovesi.linear_bgyw_15_100_c67, kovesi.linear_bgyw_15_100_c68,
kovesi.linear_blue_5_95_c73, kovesi.linear_blue_95_50_c20,
kovesi.linear_bmw_5_95_c86, kovesi.linear_bmw_5_95_c89,
kovesi.linear_bmy_10_95_c71, kovesi.linear_bmy_10_95_c78,
kovesi.linear_gow_60_85_c27, kovesi.linear_gow_65_90_c35,
kovesi.linear_green_5_95_c69, kovesi.linear_grey_0_100_c0,
kovesi.linear_grey_10_95_c0, kovesi.linear_kry_5_95_c72,
kovesi.linear_kry_5_98_c75, kovesi.linear_kryw_5_100_c64,
kovesi.linear_kryw_5_100_c67, kovesi.linear_ternary_blue_0_44_c57,
kovesi.linear_ternary_green_0_46_c42, kovesi.linear_ternary_red_0_50_c52,
main="Kovesi linear"
)
par(op)


# Bivariate
bivcol <- function(pal){
  tit <- substitute(pal)
  pal <- pal()
  ncol <- length(pal)
  nx <- sqrt(length(pal))
  image(matrix(1:ncol, nrow=sqrt(ncol)), axes=FALSE, col=pal)
  mtext(tit)
}
op <- par(mfrow=c(3,4), mar=c(1,1,2,1))
bivcol(stevens.pinkgreen)
bivcol(stevens.bluered)
bivcol(stevens.pinkblue)
bivcol(stevens.greenblue)
bivcol(stevens.purplegold)
bivcol(brewer.orangeblue)
bivcol(brewer.pinkblue)
bivcol(tolochko.redblue)
bivcol(arc.bluepink)
bivcol(census.blueyellow)
par(op)


