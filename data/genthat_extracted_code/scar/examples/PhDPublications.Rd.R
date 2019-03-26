library(scar)


### Name: PhDPublications
### Title: Doctoral Publications
### Aliases: PhDPublications
### Keywords: datasets

### ** Examples

## Some data pre-processing
data(PhDPublications)
dat = matrix(0,ncol=4,nrow=nrow(PhDPublications))
dat[,1] = as.numeric(PhDPublications$gender == "female")
dat[,2] = as.numeric(PhDPublications$married == "yes")
dat[,3] = as.numeric(PhDPublications$kids)
dat[,4] = as.numeric(PhDPublications$mentor)
y = PhDPublications$articles

## Run scar on the dataset
object = scar(dat,y,shape=c("l","l","de","ccv"),family=poisson())

## Check the effects of mentor
plot(object,which=c(4))



