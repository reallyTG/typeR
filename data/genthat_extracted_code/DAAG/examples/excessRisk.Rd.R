library(DAAG)


### Name: excessRisk
### Title: Create and analyze multiway frequency or weighted frequency
###   table
### Aliases: excessRisk
### Keywords: multivariate survey

### ** Examples

excessRisk()
excessRisk(weight ~ airbag+seatbelt+dvcat)
UCB <- as.data.frame.table(UCBAdmissions)
excessRisk(Freq~Gender, response="Admit", margin="Gender",data=UCB)
excessRisk(Freq~Gender+Dept, response="Admit", margin="Gender",data=UCB)



