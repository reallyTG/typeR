library(Anthropometry)


### Name: preprocessing
### Title: Data preprocessing before computing archetypal observations
### Aliases: preprocessing
### Keywords: array

### ** Examples

#As a toy example, only the first 25 individuals are used.
#Variable selection:
variabl_sel <- c(48, 40, 39, 33, 34, 36)
#Changing to inches: 
USAFSurvey_inch <- USAFSurvey[1:25, variabl_sel] / (10 * 2.54)

#Data preprocessing:
preproc <- preprocessing(USAFSurvey_inch, TRUE, 0.95, TRUE)
preproc <- preprocessing(USAFSurvey_inch, TRUE, 0.95, FALSE)



