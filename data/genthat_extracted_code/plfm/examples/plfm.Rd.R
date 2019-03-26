library(plfm)


### Name: plfm
### Title: Probabilistic latent feature analysis of two-way two-mode
###   frequency data
### Aliases: plfm

### ** Examples


## Not run: 
##D ## example 1: Analysis of data generated under the model
##D 
##D # define constants
##D J<-20
##D K<-15
##D F<-2
##D 
##D # generate true parameters
##D set.seed(43565)
##D objectparameters<-matrix(runif(J*F),nrow=J)
##D attributeparameters<-matrix(runif(K*F),nrow=K)
##D 
##D # generate data for disjunctive model using N=200 replications
##D gdat.disj<-gendat(maprule="disj",N=200,
##D               objpar=objectparameters,attpar=attributeparameters)
##D 
##D # Estimate a disjunctive probabilistic latent feature model with 2 features
##D # suppress printing the type of analysis to the output screen
##D disj2<-plfm(maprule="disj",freq1=gdat.disj$freq1,freqtot=200,F=2,M=1,printrun=FALSE)
##D 
##D # generate data for an additive model using N=200 replications
##D gdat.add<-gendat(maprule="add",N=200,
##D               objpar=objectparameters,attpar=attributeparameters)
##D 
##D # Estimate an additive probabilistic latent feature model with 2 features
##D # suppress printing the type of analysis to the output screen
##D add2<-plfm(maprule="add",freq1=gdat.add$freq1,freqtot=200,F=2,M=1,printrun=FALSE)
## End(Not run)


## Not run: 
##D # example 2:Perceptual analysis of associations between car models and car attributes
##D 
##D # load car data
##D data(car)
##D 
##D # compute 1 run of a disjunctive model with 4 features
##D # use components of a data frame as input
##D cardisj4<-plfm(datatype="dataframe",data=car$datalongformat,object=objectlabel,
##D                attribute=attributelabel,rating=rating,maprule="disj",F=4,M=1)
##D 
##D # print the output of a disjunctive 4-feature model  
##D # for data on the perception of car models
##D print (cardisj4)
##D 
##D 
##D # print a summary of the output of a disjunctive 4-feature model  
##D # for data on the perception of car models
##D sumcardisj4<-summary(cardisj4)
##D sumcardisj4
## End(Not run)

## Not run: 
##D # example 3: analysis on determinants of anger-related behavior
##D 
##D # load anger data
##D data(anger)
##D 
##D # compute 1 run of a disjunctive model with 2 features
##D # use frequency data as input
##D angerdisj2<-plfm(maprule="disj",freq1=anger$freq1,freqtot=anger$freqtot,F=2,M=1)
##D 
##D 
##D # print the output of a disjunctive 2-feature model 
##D # for data on the situational determinants of anger-related behaviors
##D print (angerdisj2)
##D 
##D 
##D # print a summary of the output of a disjunctive 2-feature model 
##D # for data on the situational determinants of anger-related behaviors
##D sumangerdisj2<-summary(angerdisj2)
##D sumangerdisj2
## End(Not run)





