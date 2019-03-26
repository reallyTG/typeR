library(vcd)


### Name: JointSports
### Title: Opinions About Joint Sports
### Aliases: JointSports
### Keywords: datasets

### ** Examples

library(MASS)
data("JointSports")
tab <- xtabs(Freq ~ gender + opinion + grade + year, data = JointSports)
doubledecker(opinion ~ gender + year + grade, data = tab)
loglm(~ opinion* (gender + grade+ year) + gender*year*grade, data = tab)



