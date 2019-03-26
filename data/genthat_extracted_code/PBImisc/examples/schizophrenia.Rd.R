library(PBImisc)


### Name: schizophrenia
### Title: Genetic backgroud of schizophrenia
### Aliases: schizophrenia
### Keywords: schizophrenia

### ** Examples

data(schizophrenia)
attach(schizophrenia)
interaction.plot(CD28, NfkB, Dikeos.sum)
interaction.plot(NfkB, CD28, Dikeos.sum)
model.tables(aov(Dikeos.sum~NfkB*CD28))



