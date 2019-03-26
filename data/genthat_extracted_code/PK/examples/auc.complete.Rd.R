library(PK)


### Name: auc.complete
### Title: Confidence intervals for the area under the concentration versus
###   time curve in complete data designs
### Aliases: auc.complete
### Keywords: htest

### ** Examples

## example from Gibaldi and Perrier (1982, page 436) for an individual AUC
time <- c(0, 0.165, 0.5, 1, 1.5, 3, 5, 7.5, 10)
conc <- c(0, 65.03, 28.69, 10.04, 4.93, 2.29, 1.36, 0.71, 0.38)
auc.complete(conc=conc, time=time)

## dataset Indometh of package datasets
## calculate individual AUCs
require(datasets)
row <- 1
res <- data.frame(matrix(nrow=length(unique(Indometh$Subject)), ncol=2))
colnames(res) <- c('id', 'auc')
for(i in unique(Indometh$Subject)){
   temp <- subset(Indometh, i==Subject)
   res[row, 1] <- i
   res[row, 2] <- auc.complete(data=temp[,c("conc","time")])$est[1,1]
   row <- row + 1
}
print(res)

# function to get geometric mean and corresponding CI
gm.ci <- function(x, conf.level=0.95){
   res <- t.test(x=log(x), conf.level=conf.level)
   out <- data.frame(gm=as.double(exp(res$estimate)), lower=exp(res$conf.int[1]), 
                      upper=exp(res$conf.int[2]))
   return(out)
}    

# geometric mean and corresponding CI: assuming log-normal distributed AUCs
gm.ci(res[,2], conf.level=0.95)

# arithmetic mean and corresponding CI: assuming normal distributed AUCs 
# or at least asymptotic normal distributed arithmetic mean 
t.test(x=res[,2], conf.level=0.95)
     
# alternatively: function auc.complete
set.seed(300874)
Indometh$id <- as.character(Indometh$Subject)
Indometh <- Indometh[order(Indometh$id, Indometh$time),]
Indometh <- Indometh[order(Indometh$time),]
auc.complete(conc=Indometh$conc, time=Indometh$time, method=c("t"))


## example for comparing AUCs assessed in a repeated complete data design
## (dataset: Glucose)
## calculate individual AUCs
data(Glucose)
res <- data.frame(matrix(nrow=length(unique(Glucose$id))*2, ncol=3))
colnames(res) <- c('id', 'date', 'auc')
row <- 1
for(i in unique(Glucose$id)){
  for(j in unique(Glucose$date)){
     temp <- subset(Glucose, id==i & date==j)
     res[row, c(1,2)] <- c(i,j)
     res[row, 3] <- auc.complete(data=temp[,c("conc","time")])$est[1,1]
     row <- row + 1
  }
}
res <- res[order(res$id, res$date),]
print(res)

# assuming log-normally distributed AUCs
# geometric means and corresponding two-sided CIs per date           
tapply(res$auc, res$date, gm.ci)

# comparison of AUCs using ratio of geometric means and corresponding two-sided CI 
# repeated experiment
model <- t.test(log(auc)~date, data=res, paired=TRUE, conf.level=0.90)
exp(as.double(model$estimate))
exp(model$conf.int)



