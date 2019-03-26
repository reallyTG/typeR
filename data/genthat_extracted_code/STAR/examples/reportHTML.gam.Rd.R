library(STAR)


### Name: reportHTML.gam
### Title: Generates a Report in HTML Format from a STAR gam Object
### Aliases: reportHTML.gam
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ## load e070528spont data set
##D data(e070528spont)
##D ## make a data frame for gam using a 2 ms bin width 
##D spontDF <- mkGLMdf(e070528spont,0.002,0,60)
##D ## make data frames specific of each neuron
##D n1.spontDF <- spontDF[spontDF$neuron=="1",]
##D n2.spontDF <- spontDF[spontDF$neuron=="2",]
##D n3.spontDF <- spontDF[spontDF$neuron=="3",]
##D n4.spontDF <- spontDF[spontDF$neuron=="4",]
##D ## save space by removing the now redundant spontDF
##D rm(spontDF)
##D ## fit neuron 1 using the gam representation of a
##D ## renewal process and a binomial model
##D n1.spontFit1 <- gam(event ~ s(lN.1,k=25,bs="cr"),data=n1.spontDF,family=binomial())
##D ## create a list with the discretized spike times of the 3 other neurons
##D preN1 <- list(n2=with(n2.spontDF,event),n3=with(n3.spontDF,event),n4=with(n4.spontDF,event))
##D ## generate the report
##D reportHTML(n1.spontFit1,"e070528spontN1gFit",neuron="1",neuronEvts=preN1)
## End(Not run)



