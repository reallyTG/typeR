library(ROC632)


### Name: DLBCLgenes
### Title: The data concerning the gene expressions of the DLBCL patients
### Aliases: DLBCLgenes
### Keywords: gene expressions diffuse large-b-cell lymphoma Rosenwald

### ** Examples

data(DLBCLpatients)
data(DLBCLgenes)

### Patients survival according to the two subgroups defined by using
### the median of the first gene
plot(survfit(Surv(t, f) ~ I(DLBCLgenes[,1] > median(DLBCLgenes[,1])),
 data = DLBCLpatients), xlab="Survival time (in years)",
 ylab="Patient survival", mark.time=FALSE)



