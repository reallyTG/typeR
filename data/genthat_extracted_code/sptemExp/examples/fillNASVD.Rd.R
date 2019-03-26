library(sptemExp)


### Name: fillNASVD
### Title: Function to Use SVD to Impute the Missing Values for Training
###   Dataset
### Aliases: fillNASVD
### Keywords: ~fillNASVD ~missing

### ** Examples


# Use the covariates for PM2.5 data as a example:

data("trainsample")
cols=c("ndvi","aod","wnd_avg","monthAv")
n=nrow(trainsample)
p=0.05
pn=as.integer(p*n)
trainsample2missed=trainsample
for(col in cols){
  index=sample(n,pn)
  trainsample2missed[index,col]=NA
}
trainsample2filled=fillNASVD(trainsample2missed,cols,"siteid","date")

#Examine the accuracy:
for(col in cols){
  index=which(is.na(trainsample2missed[,col]))
  obs=trainsample[index,col]
  missed=trainsample2missed[index,]
  sindex=match(interaction(missed$siteid,missed$date),
               interaction(trainsample2filled$siteid,trainsample2filled$date))
  pre=trainsample2filled[sindex,col]
  print(paste(col," missing value correlation: ",round(cor(obs,pre),2)))
  print(paste(col," missing value cv rmse: ",round(rmse(obs,pre),2)))
}




