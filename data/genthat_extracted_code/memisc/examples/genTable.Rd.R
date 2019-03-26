library(memisc)


### Name: genTable
### Title: Generic Tables and Data Frames of Descriptive Statistics
### Aliases: Aggregate genTable fapply fapply.default
### Keywords: misc

### ** Examples

ex.data <- expand.grid(mu=c(0,100),sigma=c(1,10))[rep(1:4,rep(100,4)),]
ex.data <- within(ex.data,
                  x<-rnorm(
                    n=nrow(ex.data),
                    mean=mu,
                    sd=sigma
                    )
                  )

Aggregate(~mu+sigma,data=ex.data)
Aggregate(mean(x)~mu+sigma,data=ex.data)
Aggregate(mean(x)~mu+sigma,data=ex.data,name="Average")
Aggregate(c(mean(x),sd(x))~mu+sigma,data=ex.data)
Aggregate(c(Mean=mean(x),StDev=sd(x),N=length(x))~mu+sigma,data=ex.data)
genTable(c(Mean=mean(x),StDev=sd(x),N=length(x))~mu+sigma,data=ex.data)

Aggregate(table(Admit)~.,data=UCBAdmissions)
Aggregate(Table(Admit,Freq)~.,data=UCBAdmissions)
Aggregate(Admit~.,data=UCBAdmissions)
Aggregate(percent(Admit)~.,data=UCBAdmissions)
Aggregate(percent(Admit)~Gender,data=UCBAdmissions)
Aggregate(percent(Admit)~Dept,data=UCBAdmissions)
Aggregate(percent(Gender)~Dept,data=UCBAdmissions)
Aggregate(percent(Admit)~Dept,data=UCBAdmissions,Gender=="Female")
genTable(percent(Admit)~Dept,data=UCBAdmissions,Gender=="Female")



