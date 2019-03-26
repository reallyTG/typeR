library(MixGHD)


### Name: predict
### Title: Membership prediction
### Aliases: predict

### ** Examples

##loading bankruptcy data
data(bankruptcy)

##model estimation
res=MCGHD(data=bankruptcy[,2:3],G=2,method="kmedoids",max.iter=30)
#rcoefficients of the model
predict(res)




