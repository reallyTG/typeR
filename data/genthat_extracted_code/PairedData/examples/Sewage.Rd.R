library(PairedData)


### Name: Sewage
### Title: Chlorinating sewage data from Preece (1982, Table 9)
### Aliases: Sewage
### Keywords: datasets

### ** Examples

data(Sewage)

# Visualising
with(Sewage,plot(paired(Method_A,Method_B),type="profile"))

# Basic paired t-test
with(Sewage,t.test(paired(Method_A,Method_B)))

# Influence of the 0.1 rounding on the t-test
 with(Sewage,t.test(Method_A-Method_B-0.1))
 with(Sewage,t.test(Method_A-Method_B+0.1))




