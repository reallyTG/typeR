library(TCGAretriever)


### Name: get_clinical_data
### Title: Retrieve Clinical Information from a TCGA Study
### Aliases: get_clinical_data

### ** Examples

clinic_data <- get_clinical_data("blca_tcga_all")
if (nrow(clinic_data) >= 6 & ncol(clinic_data) >= 5) {
clinic_data[1:6,1:5]
hist(as.numeric(clinic_data$AGE), 
col = "darkorange", 
xlab = "Age", 
main = "Bladder Cancer, age of diagnosis")
}



