library(PBImisc)


### Name: AML
### Title: Acute myeloid leukemia AML study
### Aliases: AML
### Keywords: AML

### ** Examples

library(lattice)
data(AML)
AML2 = reshape(AML, direction="long", varying=colnames(AML)[2:5])
bwplot(CD14~time|Mutation, AML2)
interaction.plot(AML2$time,AML2$Mutation, AML2$CD14)



