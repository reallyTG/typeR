library(Demerelate)


### Name: Demerelate
### Title: Demerelate - Algorithms to estimate pairwise relatedness within
###   populations based on allele sharing
### Aliases: Demerelate

### ** Examples
   

     
     ## Data set is used to calculate Blouins allele sharing index on  
     ## population data. Pairs are set to 10 for convenience.
     ## For statistical reason for your final results you may want to 
     ## use more pairs to model relatedness (1000 pairs are recommended).

     data(demerelpop)
     
     dem.results <- Demerelate(demerelpop[,1:6], value="Mxy", 
                    file.output=FALSE, object=TRUE, pairs=10)


     ## Demerelate can be executed with several different values 
     ## should consult the references to decided which estimator may 
     ## be useful in your case. 
     ## Be careful some estimators may be biased in situations with
     ## no reference populations or violatin of Hardy-Weinberg
     ## Equilibrium.
    
     
     


