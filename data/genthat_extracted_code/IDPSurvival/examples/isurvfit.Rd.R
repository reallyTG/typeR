library(IDPSurvival)


### Name: isurvfit
### Title: Create survival curves based on the IDP model
### Aliases: isurvfit print.isurvfit
### Keywords: survival IDP

### ** Examples

data(aml)
fit <- isurvfit(Surv(time, cens) ~ 1, data=aml, display=TRUE, nsamples=1000) 
legend('topright', c("Lower expectation", 
          "Upper expectation","confidence intervals"), lty=c(1,1,2),lwd=c(1,2,1)) 
title("IDP survival curve (s=0.5) \nAcute Myelogenous Leukemia dataset")

data(Aids2)
dataset <- Aids2
dataset["time"]<-dataset[4]-dataset[3]
dataset[5]<-as.numeric(unlist(dataset[5]))
fit <- isurvfit(Surv(time, status) ~ T.categ, dataset,s=1,
	            subset=(!is.na(match(T.categ, c('blood','haem','het')))),
                nsamples=1000,conf.type='none')
legend('topright',c("Heterosexual contact","Hemophilia","Blood"),
            title="Transmission category:",lty=c(1,1,1),col=c(1,2,3),pch=c(1,2,3))
title("IDP survival curve (s=1) \nAids dataset")
print(fit)

leukemia.surv <- isurvfit(Surv(time, cens) ~ group, data = aml, display=FALSE) 
plot(leukemia.surv) 
legend(100, .9, c("Maintenance", "No Maintenance"), lty=c(1,1),lwd=c(2,1),
       col=c('black','red'),pch=c(1,2)) 
title("IDP Curves\nfor AML Maintenance Study") 



