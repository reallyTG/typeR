library(ROC632)


### Name: DLBCLpatients
### Title: The data concerning the clinical information of the DLBCL
###   patients
### Aliases: DLBCLpatients
### Keywords: datasets diffuse large-b-cell lymphoma Rosenwald

### ** Examples

data(DLBCLpatients)

### Kaplan and Meier estimation of the patient survival
plot(survfit(Surv(t, f) ~ 1, data = DLBCLpatients),
 xlab="Survival time (in years)", ylab="Patient survival",
 mark.time=FALSE)



