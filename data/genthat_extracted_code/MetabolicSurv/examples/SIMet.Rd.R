library(MetabolicSurv)


### Name: SIMet
### Title: Sequential Increase in Metabolites for the PCA or PLS classifier
### Aliases: SIMet

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Example1 = SIMet(TopK = 10, Survival=Data$Survival,
Mdata=t(Data$Mdata), Censor=Data$Censor, Reduce = TRUE,
Select = 50,Prognostic = Data$Prognostic, Plot = TRUE, DimMethod ="PLS")

## FOR THE HR STATISTICS
Example1$Result

## FOR THE GRAPHICAL OUTPUT
Example1$TopKplot
## End(No test)



