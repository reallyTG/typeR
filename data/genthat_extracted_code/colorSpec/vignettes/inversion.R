
## ----setup, echo=FALSE, results="hide"-----------------------------------
require("knitr",quietly=TRUE)
opts_chunk$set(fig.path="figs/ag2-", fig.align="center",
  fig.width=7, fig.height=7, comment="")
knit_hooks$set(output = function(x, options) {
  paste('\\begin{Soutput}\n', x, '\\end{Soutput}\n', sep = '')
})
options(width=90)
if(!file.exists("figs")) dir.create("figs")


## ----packs, echo=TRUE, message=FALSE-------------------------------------
library( colorSpec )
source( "invert-help.R" )  # for plotOriginalPlusEstimates() and plotReparam3()


## ----block0, echo=TRUE, message=TRUE-------------------------------------
wave  = 400:700
E.eye = product( illuminantE(1,wave), "material", xyz1931.1nm, wavelength=wave )


## ----fig1, echo=TRUE,  message=TRUE, fig.pos="H", fig.height=3, fig.width=9, out.width='1.0\\linewidth', fig.cap='(a) the original responsivities of `E.eye`, and their sum. (b) the reparameterization to interval [0,1].  (c) the equalized responsivities, and their sum.'----
specnames( E.eye ) = c('xE','yE','zE')
plotReparam3( E.eye )


## ----block1, echo=TRUE, message=FALSE------------------------------------
NCSU = readSpectra( system.file( 'extdata/objects/NCSU.txt', package='colorSpec' ) )
NCSU6 = resample( subset( NCSU, c(18,32,54,62,142,170) ), wave=wave )


## ----block2, echo=TRUE, message=FALSE------------------------------------
XYZ = product( NCSU6, E.eye, wavelength=wave )
est.eq   = invert( E.eye, XYZ, method='centroid', alpha=1 )
est.uneq = invert( E.eye, XYZ, method='centroid', alpha=NULL )


## ----fig2, echo=TRUE, fig.pos="H", fig.height=4, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle; the equalized estimate is dashed; and the unequalized estimate is dotted.  Both estimates use the centroid method.'----
plotOriginalPlusEstimates( list(NCSU6,est.eq,est.uneq), ymax=0.9 )


## ----fig3, echo=TRUE, message=TRUE, fig.pos="H", fig.height=4, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle; the centroid estimate is dashed; and the Hawkyard estimate is dotted.  Both estimates are equalized, and the illuminant is E.'----
est.c = invert( E.eye, XYZ, method='centroid', alpha=1 )
est.h = invert( E.eye, XYZ, method='Hawkyard', alpha=1 )
plotOriginalPlusEstimates( list(NCSU6,est.c,est.h) )


## ----fig4, echo=TRUE, fig.pos="H", fig.height=4.5, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle, and the centroid estimate is dashed. The light source is Illuminant E.'----
lambda = c(-Inf,450, -Inf,500, -Inf,550, 650,Inf, 600,Inf, 550,Inf )
nearedge = rectangularMaterial( lambda, 0.98, wave )  # chromatic amplitude = 0.98
XYZ   = product( nearedge, E.eye, wavelength=wave )
est.c = invert( E.eye, XYZ, method='centroid' )
# range( extradata(est.c)$estim.precis )    # est.c$estim.precis also works
plotOriginalPlusEstimates( list(nearedge,est.c), ymax=1.1 )


## ----fig5, echo=TRUE, fig.pos="H", fig.height=6.75, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle; the centroid estimate is dashed. The light source is Illuminant E.'----
lambda = c(600,450, 650,500, 450,500, 500,550, 550,600, 600,650 )
lambda = c( lambda, 500,525, 525,550, 550,575 )
nearschro = rectangularMaterial( lambda, 0.98, wave ) # chromatic amplitude = 0.98
XYZ = product( nearschro, E.eye, wavelength=wave )
est.c = invert( E.eye, XYZ, method='centroid' )
# range( extradata(est.c)$estim.precis )      # est.c$estim.precis also works
plotOriginalPlusEstimates( list(nearschro,est.c), ymax=1.1, mfrow=c(3,3) )


## ----fig6, echo=TRUE,  message=TRUE, fig.pos="H", fig.height=3, fig.width=9, out.width='1.0\\linewidth', fig.cap='(a) the original responsivities of `F10.eye`, and their sum. (b) the reparameterization to interval [0,1].  (c) the equalized responsivities, and their sum.'----
F10.eye = product( subset(Fs.5nm,'F10'), "material", xyz1931.1nm, wavelength=wave )
specnames( F10.eye ) = c('xF10','yF10','zF10')
plotReparam3( F10.eye )


## ----fig7, echo=TRUE, fig.pos="H", fig.height=4, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle, and the equalized estimate is dashed. The light source is Illuminant F10.'----
XYZ    = product( NCSU6, F10.eye, wavelength=wave )
est.eq = invert( F10.eye, XYZ, method='centroid', alpha=1 )
# range( extradata(est.eq)$estim.precis )    # est.eq$estim.precis also works
plotOriginalPlusEstimates( list(NCSU6,est.eq), ymax=0.9 )


## ----fig8, echo=TRUE,  message=TRUE, fig.pos="H", fig.height=3, fig.width=9, out.width='1.0\\linewidth', fig.cap='(a) the original responsivities of E.Flea2, and their sum. (b) the reparameterization to interval [0,1].  (c) the equalized responsivities, and their sum.'----
E.Flea2 = product( illuminantE(1,wave), "material", Flea2.RGB, wavelength=wave )
specnames( E.Flea2 ) = c('rE','gE','bE')
plotReparam3( E.Flea2 )


## ----fig9, echo=TRUE, fig.pos="H", fig.height=4, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle; the equalized estimate is dashed.  The light source is Illuminant E, and the camera is a Flea2.'----
RGB    = product( NCSU6, E.Flea2, wavelength=wave )
est.eq = invert( E.Flea2, RGB, method='centroid', alpha=1 )
# range( extradata(est.eq)$estim.precis )     # est.eq$estim.precis also works
plotOriginalPlusEstimates( list(NCSU6,est.eq), ymax=0.9 )


## ----fig10, echo=TRUE,  message=TRUE, fig.pos="H", fig.height=3, fig.width=9, out.width='1.0\\linewidth', fig.cap='(a) the original responsivities of `E.flea`, and their sum. (b) the reparameterization to interval [0,1].  (c) the equalized responsivities, and their sum.'----
A.Flea2 = product( A.1nm, "material", Flea2.RGB, wavelength=wave )
specnames( A.Flea2 ) = c('rA','gA','bA')
P.Flea2 = product( planckSpectra(9000), "material", Flea2.RGB, wavelength=wave )
specnames( P.Flea2 ) = c('rP','gP','bP')
PEA.Flea2 = bind( P.Flea2, E.Flea2, A.Flea2 )
plotReparam3( PEA.Flea2 )


## ----fig11, echo=TRUE,  message=TRUE, fig.pos="H", fig.height=4, fig.width=8, out.width='1.0\\linewidth', fig.cap='The original reflectance spectrum is solid linestyle; the equalized estimate is dashed; and the unequalized estimate is dotted.  Both estimates use the centroid method.'----
response = product( NCSU6, PEA.Flea2, wavelength=wave )
est.eq   = invert( PEA.Flea2, response, method='centroid', alpha=1 )
# range( extradata(est.eq)$estim.precis )    # est.eq$estim.precis also works
plotOriginalPlusEstimates( list(NCSU6,est.eq), ymax=0.9 )


## ----fig12, echo=TRUE,  message=TRUE, fig.pos="H", fig.height=5, fig.width=10, out.width='1.0\\linewidth', fig.cap='(a) the original responsivities of the standard observer `eye`, and their sum. (b) the reparameterization to interval [0,1].  (c) the equalized responsivities, and their sum.'----
eye   = resample( xyz1931.1nm, wave )
spec  = planckSpectra( c(3000,4000), wave )
spec  = bind( spec, daylightSpectra( c(5000,6504,9000), wave ) )
spec  = bind( spec, planckSpectra( 11000, wave ) )
XYZ   = product( spec, eye )
est.c = invert( eye, XYZ )  
plotOriginalPlusEstimates( list(spec,est.c), mfrow=c(2,3), ymax=NA )








