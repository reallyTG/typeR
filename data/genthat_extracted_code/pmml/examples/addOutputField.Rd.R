library(pmml)


### Name: addOutputField
### Title: Add Output nodes to a PMML object.
### Aliases: addOutputField

### ** Examples

# Load the standard iris dataset
data(iris)

# Create a linear model and convert it to PMML
mod <- lm(Sepal.Length~.,iris)
pmod <- pmml(mod)

# Create additional output nodes
onodes0<-makeOutputNodes(name=list("OutputField","OutputField"),
                         attributes=list(list(name="dbl",
                         optype="continuous"),NULL),
                         expression=list("ln(x)","ln(x/(1-x))"))
onodes2<-makeOutputNodes(name=list("OutputField","OutputField"),
                         attributes=list(list(name="F1",
                         dataType="double",optype="continuous"),
                         list(name="F2")))

# Create new pmml objects with the output nodes appended
addOutputField(xmlmodel=pmod, outputNodes=onodes2, at="End", 
               xformText=NULL, nodeName=NULL, attributes=NULL,
               whichOutput=1)
pmod2<-addOutputField(xmlmodel=pmod, outputNodes=onodes0, at="End", 
                       xformText=NULL, nodeName=NULL, 
                       attributes=NULL,whichOutput=1)

# Create nodes with attributes and transformations
addOutputField(xmlmodel=pmod2, outputNodes=onodes2,at=2)
addOutputField(xmlmodel=pmod2, xformText=list("exp(x) && !x"), 
               nodeName="Predicted_Sepal.Length")

att <- list(datype="dbl",optpe="dsc")
addOutputField(xmlmodel=pmod2, nodeName="Predicted_Sepal.Length", 
               attributes=att)



