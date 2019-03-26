library(PDN)


### Name: draw.PDN.circle
### Title: Draw Personalized Disease Network for one patient
### Aliases: draw.PDN.circle

### ** Examples

#Select a subset of data for toy example
comorbidity_data = comorbidity_data[c(1:10),]
survival_data = survival_data[c(1:10),]
#  Find date cuts
k1 = datecut(comorbidity_data,survival_data[,1],survival_data[,2])
#  Build networks
a = buildnetworks(comorbidity_data,k1)

#  Graph individual patients
datark = t(apply(comorbidity_data,1,rank))
dak = sort(datark[1,])
#  draw PDN for the first patient
draw.PDN.circle(a[1,],dak)
#  draw PDN for the whole comorbidity data set
par(mfrow=c(2,5))
for(i in 1 : nrow(a)){
 dak = apply(datark,2,sort)
 draw.PDN.circle(a[i,],dak[i,])
 title(main=paste("Patient",i))
}



