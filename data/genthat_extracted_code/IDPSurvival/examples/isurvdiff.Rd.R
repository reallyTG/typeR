library(IDPSurvival)


### Name: isurvdiff
### Title: Test Survival Curves Differences for two right censored data
### Aliases: isurvdiff print.isurvdiff
### Keywords: survival IDP

### ** Examples

data(lung,package='survival')
test <-isurvdiff(Surv(time,status)~sex,lung,groups=c(1,2), 
	 			 alternative = 'two.sided',s=0.5, nsamples=1000)
print(test)

data(Aids2)
fdata <- Surv(time, status) ~ T.categ
dataset <- Aids2
groups=c("blood","haem")
dataset["time"]<-dataset[4]-dataset[3]
dataset[5]<-as.numeric(unlist(dataset[5]))
test <-isurvdiff(fdata,dataset,groups=groups,
                 alternative = 'greater',s=0.5, nsamples=1000)
print(test)



