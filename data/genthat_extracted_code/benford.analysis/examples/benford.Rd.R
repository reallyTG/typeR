library(benford.analysis)


### Name: benford
### Title: Benford Analysis of a dataset
### Aliases: benford

### ** Examples

data(corporate.payment) #loads data
bfd.cp <- benford(corporate.payment$Amount) #generates benford object
bfd.cp #prints
plot(bfd.cp) #plots




