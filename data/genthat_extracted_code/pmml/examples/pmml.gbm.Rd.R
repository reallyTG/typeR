library(pmml)


### Name: pmml.gbm
### Title: Generate PMML for genralized boosting tree objects
### Aliases: pmml.gbm

### ** Examples


# Build a simple gbm model

library(gbm)
library(pmml)
data(audit)

mod<-gbm(Adjusted~.,data=audit[,-c(1,4,6,9,10,11,12)],n.trees=3,interaction.depth=4)
# since distribution type is not given, a bernoulli distribution will be assumed

# Convert to pmml
pmml(mod)

# now try a classification case
mod2<-gbm(Species~.,data=iris,n.trees=2,interaction.depth=3,distribution="multinomial")

# the PMML now will include a regression model to read the gbm object outputs 
# and convert to a "response" prediction type.
pmml(mod2)




