library(wgeesel)


### Name: wgee
### Title: Fit Weighted Generalized Estimating Equations (WGEE)
### Aliases: wgee
### Keywords: wgee MAR

### ** Examples

####Example1
data(imps)

fit <- wgee(IMPS79 ~ Drug+Sex+Time, data=imps, id=imps$ID, family="gaussian",
            corstr="exchangeable", scale=NULL, mismodel= R ~ Drug+Time)

#####Example2
data(seizure)

###reshapre the seizure data to "long" format
seiz.long <- reshape(seizure,
                     varying=list(c("base","y1", "y2", "y3", "y4")),
                     v.names="y", times=0:4, direction="long")
seiz.long <- seiz.long[order(seiz.long$id, seiz.long$time),]

###create missing value for seiz.long dataset
set.seed(12345)
obs <- exp(9+seiz.long$age*(-0.2))/(1+exp(9+seiz.long$age*(-0.2)))
R <- lapply(unique(seiz.long$id),function(x){
  idx=which(seiz.long$id==x)
  r=c()
  r[1]=1
  for(j in 2:length(idx)){
    if(r[j-1]==1){
      r[j]=rbinom(1,1,obs[idx[j]])
    }
    else r[j]=0
  }
  return(r)
})
remove_id <- which(sapply(R,sum)==1)
remove_idx <- which(seiz.long$id %in% remove_id==1)
seiz.long <- cbind(seiz.long,R=unlist(R))[-remove_idx,]
seiz.long$y_mis <- ifelse(seiz.long$R,seiz.long$y,NA)

###fit WGEE, not run ###
fit <- wgee(y_mis ~ age + trt + time, data=seiz.long, id=seiz.long$id,family="poisson",
            corstr="exchangeable",scale=NULL, mismodel= R ~ age)




