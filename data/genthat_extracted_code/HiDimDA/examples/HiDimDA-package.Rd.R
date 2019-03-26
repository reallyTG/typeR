library(HiDimDA)


### Name: HiDimDA-package
### Title: High Dimensional Discriminant Analysis
### Aliases: HiDimDA-package HiDimDA
### Keywords: HiDimDA

### ** Examples


# train the four main classifiers with their default setings 
# on Alon's colon data set (after a logarithmic transformation), 
# selecting genes by the Expanded HC scheme 

# Pre-process and select the genes to be used in the classifiers

log10genes <- log10(AlonDS[,-1]) 
SelectionRes <- SelectV(log10genes,AlonDS$grouping)
genesused <- log10genes[SelectionRes$vkpt]

# Train classifiers

DiaglldaRule <- Dlda(genesused,AlonDS$grouping)     
FactldaRule <- RFlda(genesused,AlonDS$grouping)     
MaxUldaRule <- Mlda(genesused,AlonDS$grouping)     
ShrkldaRule <- Slda(genesused,AlonDS$grouping)     

# Get in-sample classification results

predict(DiaglldaRule,genesused,grpcodes=levels(AlonDS$grouping))$class         	       
predict(FactldaRule,genesused,grpcodes=levels(AlonDS$grouping))$class         	       
predict(MaxUldaRule,genesused,grpcodes=levels(AlonDS$grouping))$class         	       
predict(ShrkldaRule,genesused,grpcodes=levels(AlonDS$grouping))$class         	       

# Compare classifications with true assignments

cat("Original classes:\n")
print(AlonDS$grouping)             		 

# Show set of selected genes

cat("Genes kept in discrimination rule:\n")
print(colnames(genesused))             		 
cat("Number of selected genes =",SelectionRes$nvkpt,"\n")



