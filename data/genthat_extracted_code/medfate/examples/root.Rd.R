library(medfate)


### Name: root
### Title: Distribution of fine roots
### Aliases: root.ldrDistribution root.conicDistribution
###   root.xylemConductanceProportions root.rootLengths

### ** Examples

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

ntree = nrow(exampleforest$treeData)

#Initialize soil with default soil params
S = soil(defaultSoilParams())

#Calculate conic root system for trees
V1 = root.conicDistribution(Z=rep(2000,ntree), S$dVec)            
print(V1)

#Calculate LDR root system for trees (Schenck & Jackson 2002)
V2 = root.ldrDistribution(Z50 = rep(200,ntree), 
          Z95 = rep(1000,ntree), S$dVec)
print(V2)     

#Equal xylem conductance proportions for a cone distribution
#(assuming depth-width ratio 1)
root.xylemConductanceProportions(V1[1,], S$dVec)

#Xylem conductance proportions for LDR distribution
root.xylemConductanceProportions(V2[1,], S$dVec)



