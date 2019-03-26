library(FuzzyR)


### Name: addrule
### Title: Inserts a rule
### Aliases: addrule

### ** Examples

fis <- tipper()
ruleList <- rbind(c(1,1,1,1,2), c(2,0,2,1,1), c(3,2,3,1,2))
fis <- addrule(fis, ruleList)



