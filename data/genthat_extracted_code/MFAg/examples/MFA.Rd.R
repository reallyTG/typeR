library(MFAg)


### Name: MFA
### Title: Multiple Factor Analysis (MFA)
### Aliases: MFA
### Keywords: Multiple Factor Analysis MFA

### ** Examples

data(DataMix) # set of mixed data
 
Matriz = DataMix[,2:ncol(DataMix)] 

rownames(Matriz) <- as.character(t(DataMix[1:nrow(DataMix),1]))

GroupNames = c("Notes Coffee/Work", "Training/Dedication", "Coffee")

MF <- MFA(Matriz, c(2,2,2), c("n","c","f"), GroupNames) # perfoms MFA

print("Variances of the Principal Component:")
round(MF$MatrixA,2)

print("Partial matrix of the inertia/scores variables:")
round(MF$MatrixEscVar,2)



