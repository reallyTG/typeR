library(eigenmodel)


### Name: eigenmodel-package
### Title: Semiparametric Factor and Regression Models for Symmetric
###   Relational Data
### Aliases: eigenmodel-package eigenmodel
### Keywords: package

### ** Examples



data(YX_Friend)

fit<-eigenmodel_mcmc(Y=YX_Friend$Y,X=YX_Friend$X,R=2,S=50,burn=50)

# in general you should run the Markov chain longer than 50 scans

plot(fit)


# people familiar with MCMC might want to implement 
# their own Markov chains: 

Y<-YX_Friend$Y
X<-YX_Friend$X

eigenmodel_setup(R=2)

for(s in 1:50) {   # you should run your chain longer than 50 scans

    Z<-rZ_fc() 
    UL<-rUL_fc()
    b<-rb_fc()  

                 }


#fit_Gen<-eigenmodel_mcmc(Y=Y_Gen,R=3,S=10000)

#fit_Pro<-eigenmodel_mcmc(Y=Y_Pro,R=3,S=10000)







