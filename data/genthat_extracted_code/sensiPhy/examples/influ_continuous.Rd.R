library(sensiPhy)


### Name: influ_continuous
### Title: Influential Species Detection - Trait Evolution Continous
###   Characters
### Aliases: influ_continuous

### ** Examples

## Not run: 
##D #Load data:
##D data("primates")
##D #Model trait evolution accounting for influential species
##D adultMass<-primates$data$adultMass
##D names(adultMass)<-rownames(primates$data)
##D influ_cont<-influ_continuous(data = adultMass,phy = primates$phy[[1]],
##D model = "OU",cutoff = 2,n.cores = 2,track = TRUE)
##D #Print summary statistics
##D summary(influ_cont)
##D sensi_plot(influ_cont)
##D sensi_plot(influ_cont,graphs="sigsq")
##D #' sensi_plot(influ_cont,graphs="optpar")
##D #Use a different evolutionary model or cutoff 
##D influ_cont2<-influ_continuous(data = adultMass,phy = primates$phy[[1]],
##D model = "lambda",cutoff = 1.2,n.cores = 2,track = TRUE)
##D summary(influ_cont2)
##D sensi_plot(influ_cont2)
##D influ_cont3<-influ_continuous(data = adultMass,phy = primates$phy[[1]],
##D model = "BM",cutoff = 2,n.cores = 2,track = TRUE)
##D summary(influ_cont3)
## End(Not run)



