library(MVar)


### Name: DataCoffee
### Title: Frequency data set.
### Aliases: DataCoffee
### Keywords: Data set

### ** Examples

data(DataCoffee) # categorized data set

Data <- DataCoffee[,2:ncol(DataCoffee)] 

rownames(Data) <- as.character(t(DataCoffee[1:nrow(DataCoffee),1]))

GroupNames = c("Coffee A", "Coffee B", "Coffee C", "Coffee D")

MF <- MFA(Data, c(16,16,16,16), c(rep("f",4)), GroupNames) 

print("Principal components variances:"); round(MF$MatrixA,2)

print("Matrix of the Partial Inertia / Score of the Variables:"); round(MF$MatrixEscVar,2)

Tit = c("Scree-plot","Individuals","Individuals / Types coffees","Inercias Groups")

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = NA, Casc = FALSE) # plotting several graphs on the screen




