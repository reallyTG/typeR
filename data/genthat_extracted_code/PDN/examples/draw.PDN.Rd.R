library(PDN)


### Name: draw.PDN
### Title: Draw Personalized Disease Network for one patient with network
###   and ggplot2
### Aliases: draw.PDN

### ** Examples

#Select a subset of data for toy example
comorbidity_data = comorbidity_data[c(1:10),]
survival_data = survival_data[c(1:10),]
#  Getting the names
k1 = datecut(comorbidity_data,survival_data[,1],survival_data[,2])
a = buildnetworks(comorbidity_data,k1)
#Plot PDN for patient 7
nn = names(comorbidity_data)
draw.PDN(a[7,],nn)



