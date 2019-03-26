library(AER)


### Name: ResumeNames
### Title: Are Emily and Greg More Employable Than Lakisha and Jamal?
### Aliases: ResumeNames
### Keywords: datasets

### ** Examples

data("ResumeNames")
summary(ResumeNames)
prop.table(xtabs(~ ethnicity + call, data = ResumeNames), 1)



