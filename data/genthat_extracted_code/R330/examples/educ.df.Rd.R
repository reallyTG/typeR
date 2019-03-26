library(R330)


### Name: educ.df
### Title: Educations expenditure data
### Aliases: educ.df
### Keywords: datasets

### ** Examples

data(educ.df)
educ.lm = lm(educ~urban + percap + under18, data=educ.df)
summary(educ.lm)




