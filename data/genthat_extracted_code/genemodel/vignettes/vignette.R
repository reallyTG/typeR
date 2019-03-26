## ---- echo=F-------------------------------------------------------------
library(genemodel)

## ---- eval=F-------------------------------------------------------------
#  install_bitbucket("greymonroe/genemodel")
#  library(genemodel)

## ---- eval=T-------------------------------------------------------------
data("AT5G62640")

## ---- eval=T-------------------------------------------------------------
head(AT5G62640, 15)

## ---- fig.width=7.5, fig.height=2----------------------------------------
genemodel.plot(model=AT5G62640, start=25149433, bpstop=25152541, orientation="reverse", xaxis=T)

## ------------------------------------------------------------------------
spl1<-data.frame(
  type=c("5' utr", "coding_region", "intron", "coding_region", "intron", "coding_region","3' utr"), 
  coordinates=c("1-50", "50-100", "100-150", "150-200", "200-250", "250-300","300-350"))

spl2<-data.frame(
  type=c("5' utr", "coding_region", "intron","coding_region","3' utr"), coordinates=c("1-50", "50-100", "100-250", "250-300","300-350"))
par(mfrow=c(2,1))
genemodel.plot(model=spl1, start=1, bpstop=350, orientation="reverse", xaxis=T)
genemodel.plot(model=spl2, start=1, bpstop=350, orientation="reverse", xaxis=F)

## ---- fig.width=7.5, fig.height=2----------------------------------------
genemodel.plot(model=AT5G62640, start=25149433, bpstop=25152541, orientation="reverse", xaxis=T)
mutation.plot(25150214, 25150214, text="P->S", col="black", drop=-.15, haplotypes=c("red", "blue"))
mutation.plot(25150659, 25150659, text="V->S", col="black", drop=-.15, haplotypes=c("red"))
mutation.plot(25150639, 25150639, text="L->P", col="black", drop=-.35, haplotypes=c("blue"))

