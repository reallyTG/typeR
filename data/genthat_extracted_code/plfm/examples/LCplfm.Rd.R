library(plfm)


### Name: LCplfm
### Title: Latent class probabilistic feature analysis of three-way
###   three-mode binary data
### Aliases: LCplfm

### ** Examples


## Not run: 
##D 
##D # example 1: analysis on determinants of anger-related behavior
##D 
##D # load anger data
##D data(anger)
##D 
##D # estimate a disjunctive LCplfm model with F=2 and T=2 
##D # assume constant situation-feature classification
##D # and class-specific situation parameters (i.e. model 1)
##D # use 10 exploratory runs with random starting points 
##D anger.LCplfm.disj<-LCplfm(data=anger$data,F=2, T=2, M=10)
##D 
##D # print the output of the model 
##D print (anger.LCplfm.disj)
##D 
##D 
##D # estimate an additive LCplfm model with F=2 and T=2 
##D # assume constant situation-feature classification
##D # and class-specific situation parameters (i.e. model 1)
##D # use 10 exploratory runs with random starting points 
##D anger.LCplfm.add<-LCplfm(data=anger$data,F=2, T=2, M=10, maprule="add")
##D 
##D # print the output of the model 
##D print (anger.LCplfm.add)
##D 
##D 
##D # estimate a disjunctive LCplfm model with F=4 and T=2
##D # assume constant situation-feature classifications
##D # and class-specific situation parameters (i.e. model 1)
##D # use 20 exploratory runs with random starting points (M=20)
##D # constrain parameters of subsequent behavior pairs to "load"
##D # on only one feature
##D 
##D # specify which attribute parameters have to be estimated from the data
##D update.attribute<-matrix(rep(0,8*4),ncol=4)
##D update.attribute[1:2,1]<-c(1,1)
##D update.attribute[3:4,2]<-c(1,1)
##D update.attribute[5:6,3]<-c(1,1)
##D update.attribute[7:8,4]<-c(1,1)
##D 
##D # specify starting values for attribute parameters in each of M=20 runs
##D # for parameters with update.attribute==0 starting values are constrained to 1e-6
##D # for parameters with update.attribute==1 starting values are sampled from a unif(0,1)
##D start.attribute<-array(runif(8*4*20),c(8,4,20))
##D start.attribute[update.attribute%o%rep(1,20)==0]<-1e-6 
##D 
##D # estimate the constrained model
##D anger.LCplfm.constr<-LCplfm(data=anger$data,F=4, T=2, M=20, 
##D                      update.attributeparameters=update.attribute,
##D                      start.attributeparameters=start.attribute)
##D 
##D # estimate a disjunctive LCplfm model with F=4 and T=2
##D # assume constant situation-feature classifications
##D # class-specific situation and bahavior parameters (i.e. model 3)
##D # use 20 exploratory runs with random starting points (M=20)
##D # constrain parameters of subsequent behavior pairs to "load"
##D # on only one feature
##D 
##D # specify which attribute parameters have to be estimated from the data
##D  
##D update.attribute<-matrix(rep(0,8*4),ncol=4)
##D update.attribute[1:2,1]<-c(1,1)
##D update.attribute[3:4,2]<-c(1,1)
##D update.attribute[5:6,3]<-c(1,1)
##D update.attribute[7:8,4]<-c(1,1)
##D update.attribute<-update.attribute%o%rep(1,2)
##D 
##D # specify starting values for attribute parameters in each of M=20 runs
##D # for parameters with update.attribute==0 starting values are constrained to 1e-6
##D # for parameters with update.attribute==1 starting values are sampled from a unif(0,1)
##D start.attribute<-array(runif(8*4*2*20),c(8,4,2,20))
##D start.attribute[update.attribute%o%rep(1,20)==0]<-1e-6 
##D 
##D # estimate the constrained model
##D anger.LCplfm.m3.constr<-LCplfm(data=anger$data,F=4, T=2, M=20, model=3, 
##D                      update.attributeparameters=update.attribute,
##D                      start.attributeparameters=start.attribute)
##D 
## End(Not run)

## Not run: 
##D # example 2: analysis of car perception data
##D 
##D # load car data
##D data(car)
##D 
##D # estimate a disjunctive LCplfm with F=3 and T=2
##D # assume constant attribute-feature classification
##D # and class-specific car parameters (i.e. model 4)
##D # use 10 exploratory runs with random starting points 
##D car.LCplfm.disj<-LCplfm(data=car$data3w,F=3, T=2, M=10,model=4)
##D 
##D # print the output of the model 
##D print(car.LCplfm.disj)
##D 
##D # estimate an additive LCplfm with F=3 and T=2
##D # assume constant attribute-feature classification
##D # and class-specific car parameters (i.e. model 4)
##D # use 10 exploratory runs with random starting points 
##D car.LCplfm.add<-LCplfm(data=car$data3w,F=3, T=2, M=10, model=4, maprule="add")
##D 
##D # print the output of the model 
##D print(car.LCplfm.add)
##D 
## End(Not run)

## Not run: 
##D 
##D # example 3: estimation of multiple classification latent class 
##D # model (Maris, 1999) for cognitive diagnosis
##D 
##D 
##D # load subtraction data
##D library(CDM)
##D data(fraction.subtraction.data)
##D data(fraction.subtraction.qmatrix)
##D 
##D 
##D # create three-way data as input for LCplfm
##D I<-536
##D J<-1
##D K<-20
##D data3w<-array(c(as.matrix(fraction.subtraction.data)),c(I,J,K))
##D 
##D # add item labels
##D 
##D itemlabel<-c("5/3 - 3/4", 
##D "3/4 - 3/8", 
##D "5/6 - 1/9",
##D "3 1/2 - 2 3/2", 
##D "4 3/5 - 3 4/10", 
##D "6/7 - 4/7", 
##D "3 - 2 1/5", 
##D "2/3 - 2/3", 
##D "3 7/8 - 2", 
##D "4 4/12 - 2 7/12", 
##D "4 1/3 - 2 4/3", 
##D "1 1/8 - 1/8", 
##D "3 3/8 - 2 5/6", 
##D "3 4/5 - 3 2/5", 
##D "2 - 1/3", 
##D "4 5/7 - 1 4/7", 
##D "7 3/5 - 4/5", 
##D "4 1/10 - 2 8/10", 
##D "4 - 1 4/3", 
##D "4 1/3 - 1 5/3") 
##D 
##D dimnames(data3w)[[3]]<-itemlabel
##D 
##D # estimate multiple classification latent class model (Maris, 1999)
##D 
##D set.seed(537982)
##D subtract.m1.lst<-stepLCplfm(data3w,minF=3,maxF=5,minT=1,maxT=3,model=1,M=20,maprule="conj")
##D 
##D 
##D # print BIC values
##D sumar<-summary(subtract.m1.lst)
##D as.matrix(sort(sumar[,5]))
##D 
##D # print output best model
##D subtract.m1.lst[[5,2]]
##D 
##D # correlation between extracted skills and qmatrix
##D round(cor(fraction.subtraction.qmatrix,subtract.m1.lst[[5,2]]$attpar),2)
## End(Not run)



