library(plfm)


### Name: plot.plfm
### Title: plot parameters in 'plfm' object
### Aliases: plot.plfm

### ** Examples


# examples


## Not run: 
##D # example 1:Perceptual analysis of associations between car models and car attributes
##D 
##D # load car data
##D data(car)
##D 
##D # compute 1 run of a disjunctive model with 4 features
##D # use components of a data frame as input
##D cardisj4<-plfm(datatype="dataframe",data=car$datalongformat,object=objectlabel,
##D                attribute=attributelabel,rating=rating,maprule="disj",F=4,M=1)
##D 
##D # plot car and attribute parameters per feature
##D par(mfrow=c(1,2))
##D plot(cardisj4,feature=1,element="object",main="Car parameters Feature 1")
##D plot(cardisj4,feature=1,element="attribute",main="Attribute parameters Feature 1")
##D 
##D par(mfrow=c(1,2))
##D plot(cardisj4,feature=2,element="object",main="Car parameters Feature 2")
##D plot(cardisj4,feature=2,element="attribute",main="Attribute parameters Feature 2")
##D 
##D par(mfrow=c(1,2))
##D plot(cardisj4,feature=3,element="object",main="Car parameters Feature 3")
##D plot(cardisj4,feature=3,element="attribute",main="Attribute parameters Feature 3")
##D 
##D par(mfrow=c(1,2))
##D plot(cardisj4,feature=4,element="object",main="Car parameters Feature 4")
##D plot(cardisj4,feature=4,element="attribute",main="Attribute parameters Feature 4")
## End(Not run)



par(mfrow=c(1,2))

# example 2: analysis on determinants of anger-related behavior

# load anger data
data(anger)

# compute 1 run of a disjunctive model with 4 features
# use frequency data as input
angerdisj2<-plfm(maprule="disj",freq1=anger$freq1,freqtot=anger$freqtot,F=2,M=1)

# plot situation and behavior parameters
par(mfrow=c(2,2))
for (f in 1:2){
plot(angerdisj2,feature=f,element="object",main=paste("Situation parameters Feature",f,sep=" "))}
for (f in 1:2){
plot(angerdisj2,feature=f,element="attribute",main=paste("Behavior parameters Feature",f,sep=" "))}




