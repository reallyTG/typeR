library(micemd)


### Name: CHEM97Na
### Title: An incomplete two-level dataset which consists of A/AS-level
###   examination data from England
### Aliases: CHEM97Na
### Keywords: datasets

### ** Examples

data(CHEM97Na)

#summary
summary(CHEM97Na)

#summary per School
by(CHEM97Na,CHEM97Na$School,summary)




