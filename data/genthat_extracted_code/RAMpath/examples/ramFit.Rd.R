library(RAMpath)


### Name: ramFit
### Title: Fit a model using lavaan based on ram input
### Aliases: ramFit

### ** Examples

## Example 1. A path model
data(ex1)
m1<-'
manifest=3
label=age,hvlt,ept
arrow(2,1)=?
arrow(3,1)=?
arrow(3,2)=?
sling(1,1)=?
sling(2,2)=?
sling(3,3)=?
'

## Fit the model
res1<-ramFit(m1, ex1)

## More output from Lavaan
summary(res1$lavaan, fit=TRUE)

## Effects and variance decomposition
bridge<-ramPathBridge(res1, allbridge=TRUE, indirect=TRUE)
summary(bridge)
summary(bridge, type='bridge')

## plot the path diagram
plot(bridge, 'ex1')

## plot the effects from age to ept
plot(bridge, 'ex1effect', 'age','ept')

## plot the bridges for ept
plot(bridge, 'ex1bridge', 'ept','hvlt', type='bridge')

## summarize
summary(bridge)
summary(bridge, type='bridge')


## Example 2: An SEM model (MIMIC model)
data(ex2)
## Using lavaan directly for model estimation and specification
mimic<-'
R =~ ws1 + ls1 + lt1
R ~ edu + gender
'

mimic.res<-sem(mimic, data=ex2)

mimic.ram<-lavaan2ram(mimic.res)

## plot the path diagram
bridge<-ramPathBridge(mimic.ram, allbridge=FALSE, indirect=FALSE)
plot(bridge, 'mimic')




