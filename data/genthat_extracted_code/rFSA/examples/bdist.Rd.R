library(rFSA)


### Name: bdist
### Title: An rFSA Criterion Function.
### Aliases: bdist

### ** Examples

#To use Bhattacharyya Distance and FSA the response must be binary, and you must
#be considering searching for two way continuous interactions. 
data(mtcars)
fit<-FSA(formula = "am~gear*hp",data = mtcars,
fitfunc = glm,family="binomial",m = 2,cores=1,
interactions = TRUE,criterion = bdist,minmax = "max")



