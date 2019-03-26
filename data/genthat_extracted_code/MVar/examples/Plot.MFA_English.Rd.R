library(MVar)


### Name: Plot.MFA
### Title: Graphics of the Multiple Factor Analysis (MFA).
### Aliases: Plot.MFA
### Keywords: Multiple Factor Analysis MFA MFACT

### ** Examples

data(DataMix) # set of mixed data

Data <- DataMix[,2:ncol(DataMix)] 

rownames(Data) <- DataMix[1:nrow(DataMix),1]

GroupNames = c("Grade Cafes/Work", "Formation/Dedication", "Coffees")
           
MF <- MFA(Data, c(2,2,2), TypeGroups = c("n","c","f"), GroupNames) # performs MFA

Tit = c("Scree-Plot","Observations","Observations/Variables","Inertia of the Variable Groups")

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = NA, 
         Casc = FALSE) # plotting several graphs on the screen

Plot.MFA(MF, Titles = Tit, xlabel = NA, ylabel = NA,
         PosLeg = 2, BoxLeg = FALSE, Color = TRUE, 
         NamArr = FALSE, LinLab = rep("A?",10), 
         Casc = FALSE) # plotting several graphs on the screen



