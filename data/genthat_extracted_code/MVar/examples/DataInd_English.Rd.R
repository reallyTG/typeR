library(MVar)


### Name: DataInd
### Title: Frequency data set.
### Aliases: DataInd
### Keywords: Data set

### ** Examples

data(DataInd) # categorized data set

Data <- DataInd[,2:ncol(DataInd)] 

rownames(Data) <- as.character(t(DataInd[1:nrow(DataInd),1]))

GroupNames = c("Group 1", "Group 2", "Group 3", "Group 4")

MF <- MFA(Data, c(16,16,16,16), c(rep("f",4)), GroupNames)

print("Principal components variances:"); round(MF$MatrixA,2)

print("Matrix of the Partial Inertia / Score of the Variables:"); round(MF$MatrixEscVar,2)

Tit = c("Scree-plot","Individuals","Individuals / Types coffees","Inercias Groups")

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = NA, Casc = FALSE) # plotting several graphs on the screen



