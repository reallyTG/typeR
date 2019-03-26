## ----echo=FALSE, error=FALSE, message=FALSE, warning=FALSE---------------
library(colourvision)

## ----echo=FALSE----------------------------------------------------------
spider<-read.table("615ad.ProcSpec.transmission", nrows=3000, skip=100)

## ------------------------------------------------------------------------
spider.smooth<-spec.denoise(spider)

## ----echo=FALSE, fig.cap = "Figure 1. Effect of `spec.denoise( )` applied to a reflectance curve.", fig.align="center", fig.width=8, fig.height=4, dev='svg', out.width='600px'----
par(mfrow=c(1,2), mar=c(5, 4, 4, 2) + 0.1)
plot(spider, ylim=c(0,50), xlim=c(300,700), type="l",
     ylab="Reflectance (%)", xlab="Wavelength (nm)",
     main="before")
plot(spider.smooth, ylim=c(0,50), xlim=c(300,700), type="l",
     ylab="Reflectance (%)", xlab="Wavelength (nm)", main="after")

## ------------------------------------------------------------------------
human<-photor(lambda.max = c(420,530,560), lambda = seq(400, 700, 1))

## ----echo=FALSE, fig.cap = "Figure 2. Estimated photoreceptor sensitivity curves based on the wavelength of maximum sensitivity using `photor( )` function.", fig.align="center", fig.width=4, fig.height=4, dev='svg', out.width='300px'----
plot(human[,2]~human[,1], type="l", ylim=c(0,1),
     col="blue", lwd=2,
     ann = FALSE,
     mgp = c(3, 0.7, 0))
mtext(side = 2, text = "Sensitivity", line = 2.5)
mtext(side = 1, text = "Wavelength(nm)", line = 2.5)
lines(human[,3]~human[,1], col="green", lwd=2)
lines(human[,4]~human[,1], col="red", lwd=2)

## ------------------------------------------------------------------------
R<-logistic(x0=500, L=80, k=0.04)

## ----echo=FALSE, fig.cap = "Figure 3. Simulated reflectance spectrum using the `logistic( )` function.", fig.align="center", fig.width=5, fig.height=4, dev='svg', out.width='400px'----
plot(R, ylim=c(0,100),xlim=c(300,700), xlab="Wavelength (nm)", ylab="Reflectance (%)", type="l")

## ----echo=FALSE----------------------------------------------------------
D65energy<-read.csv("D65energy.csv")

## ----echo=TRUE-----------------------------------------------------------
D65photon<-energytoflux(D65energy)

## ----echo=FALSE, fig.cap = "Figure 4. CIE D65 in photon energy (left) and quantum flux units (right)", fig.align="center", fig.width=8, fig.height=4, dev='svg', out.width='600px'----
par(mfrow=c(1,2),mar=c(5, 5, 4, 2) + 0.1)
plot(D65energy, xlim=c(300,700), type="l",
     ylab=expression("Spectral energy"~(uW~cm^-2*nm^-1)), xlab="Wavelength (nm)",
     main="CIE D65")
plot(D65photon, xlim=c(300,700), type="l",
     ylab=expression("Photon flux"~(umol~m^-2*s^-1)), xlab="Wavelength (nm)", main="CIE D65")


## ----Qcatches------------------------------------------------------------
R<-logistic(x=seq(300,700,1), x0=500, L=80, k=0.04)
data("bee")
data("D65")

Qcatch1<-Q(R=R,I=D65,C=bee[c(1,2)],interpolate=TRUE,nm=seq(300,700,1))
Qcatch2<-Q(R=R,I=D65,C=bee[c(1,3)],interpolate=TRUE,nm=seq(300,700,1))
Qcatch3<-Q(R=R,I=D65,C=bee[c(1,4)],interpolate=TRUE,nm=seq(300,700,1))

## ----Qrcatches-----------------------------------------------------------
data("Rb")

Qr1<-Qr(R=R,Rb=Rb, I=D65,C=bee[c(1,2)],interpolate=TRUE,nm=seq(300,700,1))
Qr2<-Qr(R=R,Rb=Rb, I=D65,C=bee[c(1,3)],interpolate=TRUE,nm=seq(300,700,1))
Qr3<-Qr(R=R,Rb=Rb, I=D65,C=bee[c(1,4)],interpolate=TRUE,nm=seq(300,700,1))

## ----echo=FALSE----------------------------------------------------------
X<-seq(1,10,by=0.1)
logY<-log(X)
hyperY<-X/(X+1)

## ----echo=FALSE, fig.cap="Figure 5. Relationship between photoreceptor input and output typically used in colour vision models.", fig.align="center", fig.width=5, fig.height=4, dev='svg', out.width='400px'----
#par(cex.axis=0.9, cex.lab=0.9)
plot(logY~X, xlab="q", ylab="E", type="l", lwd=2, ylim=c(0,max(logY)))
lines(hyperY~X,col="red", lwd=2)
legend(x=1,y=max(logY),
       legend=c("log(q)","q/(q+1)"),
       bty="n", col=c("black","red"),
       lty=1, xjust=0, cex=0.9)

## ------------------------------------------------------------------------
colour_space(n=3, type="length", length=1, edge=NA, q=c(Qr1,Qr2,Qr3))

## ------------------------------------------------------------------------
data("bee")
data("Rb")
data("D65")

## ----echo=FALSE, fig.cap = "Figure 6. *Apis mellifera* photoreceptor sensitivity curves [a; data from @Peitsch:1992p214], background reflectance spectrum [b; data from @Gawryszewski:2012jv], and CIE D65 standard illuminant (c).", fig.align="center", fig.width=15, fig.height=5, dev='svg', out.width='700px'----
par(mfrow=c(1,3))
plot(bee[,2]~bee[,1], type="l", ylim=c(0,100),
     #ylab="Absorbance(%)",
     #xlab="Wavelength(nm)",
     col="violet", lwd=2, cex.axis=1, cex.lab=1,
     ann = FALSE,
     mgp = c(3, 0.7, 0))
mtext(side = 2, text = "Sensitivity(%)", line = 2.5, cex=1)
mtext(side = 1, text = "Wavelength(nm)", line = 2.5, cex=1)

lines(bee[,3]~bee[,1], col="blue", lwd=2)
lines(bee[,4]~bee[,1], col="green", lwd=2)
text("a)", x=305,y=98, cex=1.5)

plot(Rb[,2]~Rb[,1], type="l", ylim=c(0,100),
#     ylab="Reflectance(%)",
#     xlab="Wavelength(nm)",
     lwd=2, cex.axis=1, cex.lab=1,
     ann = FALSE,
     mgp = c(3, 0.7, 0))
mtext(side = 2, text = "Reflectance(%)", line = 2.5, cex=1)
mtext(side = 1, text = "Wavelength(nm)", line = 2.5, cex=1)
text("b)", x=305,y=98, cex=1.5)


plot(D65[,2]~D65[,1], type="l", ylim=c(0,5), xlim=c(300,700),
     #ylab="Photon flux (??mol/m2/s)",
     #xlab="Wavelength(nm)",
     lwd=2, cex.axis=1, cex.lab=1,
     ann = FALSE,
     mgp = c(3, 0.7, 0))
mtext(side = 2, text = expression("Photon flux"~(umol~m^-2*s^-1)), line = 2.5, cex=1)
mtext(side = 1, text = "Wavelength(nm)", line = 2.5, cex=1)
text("c)", x=305,y=4.9, cex=1.5)

## ------------------------------------------------------------------------
midpoint<-seq(from = 500, to = 600, 10)
W<-seq(300, 700, 1)
R<-data.frame(W)
for (i in 1:length(midpoint)) {
  R[,i+1]<-logistic(x = seq(300, 700, 1), x0=midpoint[[i]], L = 70, k=0.04)[,2]+5
}
names(R)[2:ncol(R)]<-midpoint

## ----echo=FALSE, fig.cap = "Figure 7. Simulated reflectance spectra.", fig.align="center", fig.width=5, fig.height=4, dev='svg', out.width='400px'----
plot(R[,2]~R[,1], ylim=c(0,100),xlim=c(300,700), xlab="Wavelength (nm)", ylab="Reflectance (%)", type="n", cex=0.9)
colours<-rainbow(n=(ncol(R)-1))
for(i in 2:ncol(R)) {
  lines(R[,i]~R[,1],col=colours[[ncol(R)-i+1]])
}

## ------------------------------------------------------------------------
CTTKmodel3<-CTTKmodel(R=R, I=D65, C=bee, Rb=Rb)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(CTTKmodel3), caption = "Table 1. `CTTKmodel()` output of a trichromatic animal, showing the relative quantum catches (Qr), photoreceptor outputs (E), colour locus coordinates (X), and the chromaticity distance of stimulus in relation to the background (deltaS)")

## ------------------------------------------------------------------------
EMmodel3<-EMmodel(type="length",R=R,I=D65,Rb=Rb,C=bee)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(EMmodel3), caption = "Table 2. `EMmodel()` output of a trichromatic animal, showing the relative quantum catches (Qr), photoreceptor outputs (E), colour locus coordinates (X), and the chromaticity distance of stimulus in relation to the background (deltaS)")

## ------------------------------------------------------------------------

RNLmodel3<-RNLmodel(model="log",photo=3,R1=R,Rb=Rb,I=D65,C=bee,
                    noise=TRUE,e=c(0.13,0.06,0.11))


## ------------------------------------------------------------------------

RNLmodel3.1<-RNLmodel(model="log", photo=3, R1=R, Rb=Rb, I=D65, C=bee,
                    noise=FALSE, n=c(1,2,1), v=0.1)

## ------------------------------------------------------------------------
R2<-logistic(x = seq(300, 700, 1), x0=512, L = 70, k=0.01)
RNLmodel3.2<-RNLmodel(model="log", photo=3, R1=R, R2=R2, Rb=Rb, I=D65, C=bee, noise=FALSE, n=c(1,2,1), v=0.1)

## ---- echo=TRUE----------------------------------------------------------
head(RNLmodel3.2)

## ------------------------------------------------------------------------
C<-bee
C[,2]<-C[,2]/max(C[,2])
C[,3]<-C[,3]/max(C[,3])
C[,4]<-C[,4]/max(C[,4])

## ------------------------------------------------------------------------
Rb.grey <- data.frame(300:700, rep(0.1, length(300:700)))

## ------------------------------------------------------------------------
thres<-RNLthres(photo=3, Rb=Rb, I=D65, C=C,
       noise=TRUE, e = c(0.13, 0.06, 0.12))

## ----echo=FALSE, results='asis'------------------------------------------
knitr::kable(head(thres), caption = "Table 3. `RNLthres()` output, showing wavelength (`nm`), threshold values (`T`) and log of the sensitivity values (`S`).")

## ------------------------------------------------------------------------
CTTKmodel3<-CTTKmodel(photo=3,R=R,Rb=Rb,I=D65,C=bee)

ANY.CTTKmodel3any<-GENmodel(photo=3, type="length", length=1,R=R,Rb=Rb,I=D65,C=bee, vonKries = TRUE, func=function(x){x/(1+x)}, unity=FALSE,recep.noise=FALSE)

## ----echo=FALSE, results='asis'------------------------------------------
knitr::kable(head(ANY.CTTKmodel3any), caption = "Table 4. `GENmodel( )` output, with model parameters based on the same set of assumptions as in Chittka (1992)")

## ----echo=FALSE, fig.cap="Figure 8. Photoreceptors outputs represented as vectors in a colour space. Each colour vision model uses differently arranged vectors. As long as pairwise angles between vectors are identical, vector arrangements have no biological significance.", fig.align="center", fig.width=8, fig.height=4, dev='svg', out.width='600px'----
q<-c(0.8,0.8,0.1)
x<-(sqrt(3)/2)*(q[[3]]-q[[1]])
y<-q[[2]]-0.5*(q[[1]]+q[[3]])

par(mfrow=c(1,2), cex=0.8)
plot(y~x, ylim=c(-1.3,1.3), xlim=c(-1.3,1.3), asp=1, xlab="X1",ylab="X2",
     main="CTTKmodel")
arrows(x0=0,y0=0,x1=0,y1=1, length = 0.10)
arrows(x0=0,y0=0,x1=-0.86660254,y1=-0.5, length = 0.10)
arrows(x0=0,y0=0,x1=0.86660254,y1=-0.5, length = 0.10)
graphics::text(x=0,y=1,labels="E1",pos=3)
graphics::text(x=-0.86660254,y=-0.5,labels="E2", pos=1)
graphics::text(x=0.86660254,y=-0.5, labels="E3", pos=4)

cp<-colour_space(n=3, type="length", length=1, q=q)
plot(cp$coordinates[[2]]~cp$coordinates[[1]],
     ylim=c(-1.3,1.3), xlim=c(-1.3,1.3), asp=1, xlab="X1",ylab="X2",
     main="GENmodel")
v1<-cp$vector_matrix[,1]
v2<-cp$vector_matrix[,2]
v3<-cp$vector_matrix[,3]
arrows(x0=0,y0=0,x1=v1[[1]],y1=v1[[2]], length = 0.10)
arrows(x0=0,y0=0,x1=v2[[1]],y1=v2[[2]], length = 0.10)
arrows(x0=0,y0=0,x1=v3[[1]],y1=v3[[2]], length = 0.10)

text(x=v1[[1]],y=v1[[2]],labels="E1",pos=1)
text(x=v2[[1]],y=v2[[2]],labels="E2",pos=1)
text(x=v3[[1]],y=v3[[2]],labels="E3",pos=3)

## ----message=FALSE, warning=FALSE----------------------------------------
RNLmodel3<-RNLmodel(model="log",photo=3,R1=R,Rb=Rb,I=D65,C=bee,
                    noise=TRUE,e=c(0.13,0.06,0.11))

ANY.RNLmodel3any<-GENmodel(photo=3, type="length", length=1,R=R,Rb=Rb,I=D65,C=bee, vonKries = TRUE, func=function(x){x/(1+x)}, unity=FALSE,recep.noise=TRUE, noise.given=TRUE,e=c(0.13,0.06,0.11))

## ----echo=FALSE, results='asis'------------------------------------------
knitr::kable(head(RNLmodel3[,c("E1_R1","E2_R1","E3_R1","X1_R1","X2_R1","deltaS")]), caption = "Table 5. `RNLmodel( )` results, showing photoreceptor outputs (Ei_R1), colour locus coordinates (Xi_R1), and the chromaticity distance to the background (deltaS).")

## ----echo=FALSE, results='asis'------------------------------------------
knitr::kable(head(ANY.RNLmodel3any[,c("E1","E2","E3","X1","X2","deltaS")]), caption = "Table 6. `GENmodel( )` based on receptor noise but with a different transformation between photoreceptor input and output. Model results showing photoreceptor outputs (Ei_R1), colour locus coordinates (Xi_R1), and the chromaticity distance to the background (deltaS).")

## ------------------------------------------------------------------------
dS<-deltaS(CTTKmodel3)
dS

## ----corrplot, echo=TRUE, fig.cap="Figure 9. Graphical representation of chromaticity distances using `corrplot` package. Size and colour of circles denote chromaticity distances between each reflectance spectra.", fig.align="center", fig.width=4, fig.height=4, dev='svg', out.width='400px'----
library(corrplot)
corrplot(corr=dS, is.corr=FALSE)

## ----echo=TRUE, fig.cap="Figure 10. @Chittka:1992p128 colour hexagon representing the colour space boundaries of a thrichroamtic animal (*Apis mellifera*). Circles denotes colour locus of simulated reflectance spectra (Figure 7).", fig.align="center", fig.width=3, fig.height=3, dev='svg', out.width='300px'----
par(mar=c(1,1,1,1))
colours<-rainbow(n=(ncol(R)-1))
plot(CTTKmodel3, cex=0.5, col=colours)

## ----echo=TRUE, fig.cap="Figure 11. @ENDLER:2005p538 colour triangle representing the colour space boundaries of a trichromatic animal (*Apis mellifera*). Circles denotes colour locus of simulated reflectance spectra (Figure 7).", fig.align="center", fig.width=3, fig.height=3, dev='svg', out.width='300px'----
par(mar=c(1,1,1,1))
plot(EMmodel3, cex=0.8, col=colours)

## ----echo=TRUE-----------------------------------------------------------
par(mar=c(5, 4, 4, 2) + 0.1)

## ----echo=TRUE, fig.cap="Figure 12. Receptor Noise Limited Model colour space of a trichromatic animal (*Apis mellifera*). Circles denote colour locus of simulated reflectance spectra (Figure 7). Vectors represent photoreceptor outputs.", fig.align="center", fig.width=4, fig.height=4, dev='svg', out.width='300px'----
plot(RNLmodel3, cex=0.8, pch=16, col=colours)

## ----echo=TRUE, fig.cap="Figure 13. Threshold spectral sensitivity of a trichromatic animal (*Apis mellifera*) based on receptor noise (`RNLthres( )` function).", fig.align="center", fig.width=4, fig.height=4, dev='svg', out.width='300px'----
plot(thres)

## ------------------------------------------------------------------------
library(rgl)
CTTKmodel4<-CTTKmodel(R=R, I=D65, C=photor(c(350,420,490,560),beta.band=FALSE), Rb=Rb)

## ----echo=FALSE----------------------------------------------------------
library(rgl)
par3d(windowRect=c(100,100,800,800))

## ----echo=TRUE-----------------------------------------------------------
library(rgl)
plot3d(CTTKmodel4, s.col = colours, size=4)

## ----echo=FALSE----------------------------------------------------------
rgl.viewpoint(theta = 30, phi = 10, zoom=0.8)
rgl.snapshot("CTTKmodel4.png")
rgl.close()

## ----echo=FALSE, dev="png", out.width='400px', fig.align="center", fig.cap = "Figure 14. @Chittka:1992p186 hexagonal trapezohedron representing the colour space boundaries of a tetrachromatic animal. Circles denotes colour locus of simulated reflectance spectra (Figure 7)."----
knitr::include_graphics('./CTTKmodel4.png', auto_pdf = FALSE)

## ------------------------------------------------------------------------
EMmodel4<-EMmodel(R=R, I=D65, C=photor(c(350,420,490,560),beta.band=FALSE), Rb=Rb)

## ----echo=FALSE----------------------------------------------------------
library(rgl)
par3d(windowRect=c(100,100,800,800))

## ----echo=TRUE-----------------------------------------------------------
plot3d(EMmodel4, s.col = colours, size=4)

## ----echo=FALSE----------------------------------------------------------
library(rgl)
rgl.viewpoint(theta = 0, phi = 30, zoom=0.8)
rgl.snapshot("EMmodel4.png")
rgl.close()

## ----echo=FALSE, dev="png", out.width='400px', fig.align="center", fig.cap = "Figure 15. @ENDLER:2005p538 tetrahedron representing the colour space boundaries of a tetrachromatic animal. Circles denotes colour locus of simulated reflectance spectra (Figure 7)."----
knitr::include_graphics('./EMmodel4.png', auto_pdf = FALSE)

## ------------------------------------------------------------------------
RNLmodel4<-RNLmodel(model="log", R1=R, I=D65, C=photor(c(350,420,490,560),beta.band=FALSE), Rb=Rb, noise=TRUE, e=c(0.1,0.07,0.07,0.05))

## ----echo=FALSE----------------------------------------------------------
library(rgl)
par3d(windowRect=c(100,100,800,800))

## ----echo=TRUE-----------------------------------------------------------
plot3d(RNLmodel4, xlab="", ylab="", zlab="", col = colours, size=4)

## ----echo=FALSE----------------------------------------------------------
rgl.viewpoint(theta = 30, phi = 10, zoom=1)
rgl.snapshot("RNLmodel4.png")
rgl.close()

## ----echo=FALSE, dev="png", out.width='400px', fig.align="center", fig.cap = "Figure 16. Receptor Noise Limited Model colour space of a tetrachromatic animal. Circles denote colour locus of simulated reflectance spectra (Figure 7). Vectors represent photoreceptor outputs."----
knitr::include_graphics('./RNLmodel4.png', auto_pdf = FALSE)

## ----echo=TRUE, fig.cap="Figure 17. Radar plot representing `CTTKmodel( )` photoreceptor inputs of a pentachromatic animal. Each polygon denotes a reflectance spectrum in Figure 7.", fig.align="center", fig.width=4, fig.height=4, dev='svg', out.width='300px'----
CTTKmodel5<-CTTKmodel(R=R, I=D65, C=photor(c(350,410,470,530,590),beta.band=FALSE), Rb=Rb)
radarplot(CTTKmodel5, item="Qr", item.labels=TRUE, border=colours)

## ----echo=TRUE, fig.cap="Figure 18. Radar plot representing `CTTKmodel( )` photoreceptor outputs of a pentachromatic animal. Each polygon denotes a reflectance spectrum in Figure 7.", fig.align="center", fig.width=4, fig.height=4, dev='svg', out.width='300px'----
radarplot(CTTKmodel5, item="E", item.labels=TRUE, ann=FALSE, xaxt = "n", yaxt = "n", ylim=c(-1.2,1.2), xlim=c(-1.2,1.2), border=colours)

