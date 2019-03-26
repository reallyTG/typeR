library(Comp2ROC)


### Name: comp.roc.delong
### Title: Calculate areas and stats
### Aliases: comp.roc.delong
### Keywords: DeLong Hanley Wilcoxon Whitney Mann AUC Areas Z-stats

### ** Examples

## No test: 
data(zhang)
modality1DataColumn = "modality1"
modality2DataColumn = "modality2"
data = read.manually.introduced(zhang, modality1DataColumn, TRUE,
                                modality2DataColumn, TRUE, "status", TRUE)
sim1.ind = unlist(data[1])
sim2.ind = unlist(data[2])  
sim1.sta = unlist(data[3])
sim2.sta = unlist(data[4])
comp.roc.delong(sim1.ind, sim1.sta, sim2.ind, sim2.sta)
## End(No test)



