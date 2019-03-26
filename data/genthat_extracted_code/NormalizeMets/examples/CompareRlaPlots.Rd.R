library(NormalizeMets)


### Name: CompareRlaPlots
### Title: CompareRlaPlots
### Aliases: CompareRlaPlots

### ** Examples

data(UVdata)
# Not RUN due to user input; we set k=1 each and saved normalized data as uv_ruvrandclust
# uv_ruvrand_norm<-NormQcmets(featuredata=UVdata$featuredata,
#                            method="ruvrandclust",
#                            qcmets=which(UVdata$metabolitedata$neg_control==1),
#                            k=1)
data("uv_ruvrandclust")
lfeaturedata<-list(unadj=UVdata$featuredata,ruv=uv_ruvrandclust$featuredata,
   ruvuv=uv_ruvrandclust$uvdata)
#CompareRlaPlots(lfeaturedata,
#                groupdata=interaction(UVdata$sampledata$temperature,UVdata$sampledata$instrument),
#                normmeth=c("Unadjusted:", "RUVrandclust normalized:", 
#                           "RUVrandclust: removed uv:"),
#               yrange=c(-3,3))




