library(pamctdp)


### Name: multilingual
### Title: Multilingual Free Responses Data
### Aliases: multilingual
### Keywords: datasets

### ** Examples

# MFACT with pamctdp functions
data(multilingual)
# simple correspondence analysis
sca <- dudi.coa(multilingual$tab,scannf=FALSE,nf=2)
# MFACT analysis 
mfact <- witwit.model(sca,multilingual$rbl,18,weight="mfa",scannf=FALSE,nf=2)
inertia(mfact)$row
# MFACT = ACIBP*homotecia
wibca2mfa(mfact)
# plot of texts
plot(mfact,Trow=FALSE,cframe=0.5)
# plot of words with representation quality on the first plan >= 40%
dev.new()
plot(mfact,ucal=40,all.point=FALSE)
# partial coordinates
parmfact <- partial.wwm(mfact)
#superimposed representation of categorias with age between 35 and 54
#1. points selection
age2 <- names(multilingual$tab)[substr( names(multilingual$tab),3,4)=="35"]
#2. new graphics window
dev.new(width=6,height=8)
#3. superimposed representation
# clic in global points and clic in the top to finish
# plot(parmfact,graph="cols",coleti=age2)



