library(MVar)


### Name: MFA
### Title: Multiple Factor Analysis (MFA).
### Aliases: MFA
### Keywords: Multiple Factor Analysis MFA MFACT

### ** Examples

data(DataMix) # mixed dataset

Data <- DataMix[,2:ncol(DataMix)] 

rownames(Data) <- DataMix[1:nrow(DataMix),1]

GroupNames = c("Grade Cafes/Work", "Formation/Dedication", "Coffees")

MF <- MFA(Data, c(2,2,2), TypeGroups = c("n","c","f"), GroupNames) # performs MFA

print("Principal Component Variances:"); round(MF$MatrixA,2)

print("Matrix of the Partial Inertia / Score of the Variables:"); round(MF$MatrixEscVar,2)



