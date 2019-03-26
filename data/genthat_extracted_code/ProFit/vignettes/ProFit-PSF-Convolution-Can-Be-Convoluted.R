## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
library(ProFit)

## ------------------------------------------------------------------------
fwhm.psf = 3
dim = rep(ceiling(fwhm.psf*10),2)
dim = dim + (1-(dim %% 2))
# More accurate than profitMakeGaussianPSF, just slower
psf = profitCubaSersic(mag=0,re=fwhm.psf/2,nser=0.5,dim=dim)
print(sum(psf))
fwhm.srcs = c(1,3,9)
refsrcidx = 2
nsrcs = length(fwhm.srcs)
src = list()
conv = list()
for(i in 1:nsrcs) 
{
  src[[i]] = profitCubaSersic(mag=0,re=fwhm.srcs[i]/2,nser=0.5,dim=dim)
  conv[[i]] = profitConvolvePSF(src[[i]], psf)
  print(sum(conv[[i]]))
}

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(psf)

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(conv[[1]])

## ------------------------------------------------------------------------
conv.exact = list()
for(i in 1:nsrcs) 
{
  conv.exact[[i]] = profitCubaSersic(mag=0,re=sqrt(fwhm.psf^2+fwhm.srcs[i]^2)/2,nser=0.5,dim=dim)
  print(sum(conv.exact[[i]]))
}

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(conv[[1]]-conv.exact[[1]],magmap=F,zlim=c(-1,1)*2e-3)

## ------------------------------------------------------------------------
diffrels = list()
for(i in 1:nsrcs)
{
  diffrels[[i]] = (conv[[i]]-conv.exact[[i]])/conv.exact[[i]]
  cens = ceiling(dim/2)
  print(diffrels[[i]][cens[1]+0:5,cens[2]]) 
}

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(diffrels[[1]],magmap=F,zlim=c(-1,1)*5e-2)

## ------------------------------------------------------------------------
psfat = profitMakeModel(modellist = list(sersic = list(xcen = dim[1]/2, 
        ycen = dim[2]/2, mag = 0, re = fwhm.psf/2, nser = 0.5, axrat = 1, 
        ang = 0)), dim = dim, rough = TRUE)$z
conv.at = list()
diffrels.at = list()
for(i in 1:nsrcs)
{
  conv.at[[i]] = profitConvolvePSF(src[[i]],psfat)
  diffrels.at[[i]] = (conv.at[[i]]-conv.exact[[i]])/conv.exact[[i]]
  print(diffrels.at[[i]][cens[1]+0:5,cens[2]])
}

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(diffrels.at[[1]],magmap=F,zlim=c(-1,1)*5e-2)

## ------------------------------------------------------------------------
finesample=3L
dimfine = finesample*dim
psffine = profitCubaSersic(mag=0,re=finesample*fwhm.psf/2,nser=0.5,dim=dimfine)
print(sum(psffine))
srcfine = psffine
convfine = profitConvolvePSF(srcfine, psffine)
print(sum(convfine))

## ------------------------------------------------------------------------
diffrelfine = (profitDownsample(convfine,finesample)-conv.exact[[refsrcidx]])/conv.exact[[refsrcidx]]
print(diffrelfine[cens[1]+0:5,cens[2]])

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(diffrelfine,magmap=F,zlim=c(-1,1)*5e-2/finesample^2)
#  print(diffrels[[refsrcidx]][cens[1]+0:5,cens[2]]/diffrelfine[cens[1]+0:5,cens[2]])

## ------------------------------------------------------------------------
subpsfs = list()
subimgs = list()
subrows = seq(1,to=dimfine[1],by=finesample)
subcols = seq(1,to=dimfine[2],by=finesample)
subcens = dimfine/2
idx = 1
conv.efficient = matrix(0,dim[1],dim[2])
for(i in 1:finesample)
{
  xoffset = i - finesample/2 - 0.5
  xrange = c(1,dimfine[1]) + xoffset
  xrange[1] = max(1,xrange[1])
  xrange[2] = min(dimfine[1],xrange[2])
  xrange = xrange[1]:xrange[2]
  for(j in 1:finesample)
  {
    yoffset = j - finesample/2 - 0.5
    yrange = c(1,dimfine[2]) + yoffset
    yrange[1] = max(1,yrange[1])
    yrange[2] = min(dimfine[2],yrange[2])
    yrange = yrange[1]:yrange[2]
    # Integer offset of the previously finesampled PSF
    # Which is a subpixel offset at the original image scale
    subpsfs[[idx]] = matrix(0,dimfine[1],dimfine[2])
    subpsfs[[idx]][xrange,yrange] = psffine[xrange-xoffset,yrange-yoffset]
    subpsfs[[idx]] = profitDownsample(subpsfs[[idx]],finesample)
    subimgs[[idx]] = psffine[subrows + i -1, subcols + j - 1]
    conv.efficient = conv.efficient + profitConvolvePSF(subimgs[[idx]],subpsfs[[idx]])
    idx = idx + 1
  }
}
print(range(conv.efficient - profitDownsample(convfine,finesample)))

## ------------------------------------------------------------------------
angs = c(psf=20,src=65)
axrats = c(psf=0.8,src=0.4)
fwhm.src=5
fwhms = c(psf=fwhm.psf,src=fwhm.src)
psf = profitCubaSersic(mag=0,re=fwhm.psf/2,nser=0.5,dim=dim,ang=angs["psf"], axrat=axrats["psf"])
src = profitCubaSersic(mag=0,re=fwhm.src/2,nser=0.5,dim=dim,ang=angs["src"], axrat=axrats["src"])

costh = cos((angs+90)*pi/180)
sinth = sin((angs+90)*pi/180)

fwhm.conv = c(x=sum(fwhms^2*costh*abs(costh)),
              y=sum(fwhms^2*sinth*abs(sinth)))
fwhm.conv = sign(fwhm.conv)*sqrt(abs(fwhm.conv))
ang.conv = atan2(fwhm.conv["y"],fwhm.conv["x"])*180/pi-90

conv = profitCubaSersic(mag=0,re=sqrt(fwhm.src/2),nser=0.5,dim=dim,ang=angs["src"], axrat=axrats["src"])


