## ----echo=FALSE----------------------------------------------------------
library(upmfit)

## ---- fig.show='hold'----------------------------------------------------
head(upmdata)

## ---- fig.show='hold'----------------------------------------------------
dim(upmdata) #dataset dimensions (rows by columns)

## ------------------------------------------------------------------------
upmbuilder(upmdata)[[2]][1:5,]

## ------------------------------------------------------------------------
test.data <- data.frame(y=rbinom(10,1,runif(10)),
                        x=rnorm(10),
                        w=rnorm(10),
                        z=c(rep("red",3),rep("green",3),rep("blue",4)),
                        cluster=c(1,1,2,2,5:10)
                        )
#a simulated dataset with categorical predictor 'z'
test.data

## ------------------------------------------------------------------------
suppressWarnings(upmbuilder(test.data, categorical.columns = 4)[[2]])

## ----eval=FALSE----------------------------------------------------------
#  cat(upmbuilder(upmdata)[[1]])

## ------------------------------------------------------------------------
suppressWarnings(upmbuilder(test.data, categorical.columns = 4))[[3]]
upmbuilder(upmdata)[[3]]

## ------------------------------------------------------------------------
example.run <- upmrun(upmdata, n.iter=100)

example.run

## ------------------------------------------------------------------------
#load package mcmcplots
library(mcmcplots)

#define object as posterior chains
example.run_mcmc <- as.mcmc(example.run)

#print first few observations of each chain
example.run_mcmc[1:5,]

## ---- echo=FALSE---------------------------------------------------------
values<-rnorm(5000,-2.2, sd=1/sqrt(3))
hist(exp(values)/(1+exp(values)), xlab="prior p^C distribution", main="", yaxt='n', ylab="")
hist(values, xlab="prior alpha distribution", main="", yaxt='n', ylab="")

## ------------------------------------------------------------------------
#summary of p^C:
alpha.values <- rnorm(5000,-2.2, sd=1/sqrt(3))
summary(exp(alpha.values)/(1+exp(alpha.values)))

