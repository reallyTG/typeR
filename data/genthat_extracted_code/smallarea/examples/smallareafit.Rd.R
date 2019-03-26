library(smallarea)


### Name: smallareafit
### Title: Fits a Fay Herriot Model to data
### Aliases: smallareafit
### Keywords: fay herriot small area estimation mean square error

### ** Examples

data=data.frame(response=c(1,2,3,4,8),D=c(0.2,0.5,0.1,0.9,1))
data
ans=smallareafit(response~D,data,method="FH")
ans1=smallareafit(response~D,data,method="REML")
ans2=smallareafit(response~D,data,method="PR")
ans3=smallareafit(response~D,data,method="ML")



