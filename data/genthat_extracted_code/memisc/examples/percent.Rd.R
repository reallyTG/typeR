library(memisc)


### Name: percent
### Title: Table of Percentages with Percentage Base
### Aliases: percent percent.default percent.logical
### Keywords: univar

### ** Examples


x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(100)
f <- sample(1:3,100,replace=TRUE)
f <- factor(f,labels=c("a","b","c"))


percent(x>0)
percent(f)

genTable(
  cbind(percent(x>0),
        percent(y>0),
        percent(z>0)) ~ f
  )

gt <- genTable(
  cbind(percent(x>0,ci=TRUE),
        percent(y>0,ci=TRUE),
        percent(z>0,ci=TRUE)) ~ f
  )

print(gt)
ftable(gt,row.vars=2,col.vars=c(3,1))

ex.data <- expand.grid(mean=c(0,25,50),sd=c(1,10,100))[rep(1:9,rep(250,9)),]
ex.data <- within(ex.data,x <- rnorm(n=nrow(ex.data),mean=ex.data$mean,sd=ex.data$sd))
ex.data <- within(ex.data,x.grp <- cases( x < 0,
                                            x >= 0 & x < 50,
                                            x >= 50 & x < 100,
                                            x >= 100
                                          ))
genTable(percent(x.grp)~mean+sd,data=ex.data)

Aggregate(percent(Admit,weight=Freq)~Gender+Dept,data=UCBAdmissions)



