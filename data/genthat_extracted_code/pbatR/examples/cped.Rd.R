library(pbatR)


### Name: cped
### Title: Phenotype Object
### Aliases: as.cped is.cped read.cped fread.cped write.cped sort.cped
###   plotCPed
### Keywords: interface

### ** Examples

###################
## First Example ##

## A highly artificial example with not enough subjects to be run;
##  however, it demonstrates how to put data in it.
## We have two cnvs here, cnv1 and cnv2.
## The data is just completely random.
set.seed(13)
x <- data.frame( pid       = c(1,1,1,1,1),
                 id        = c(1,2,3,4,5),
                 idfath    = c(4,4,4,0,0),
                 idmoth    = c(5,5,5,0,0),
                 sex       = c(1,2,1,1,2),
                 AffectionStatus = c(1,0,0,1,0),
                 cnv1.1     = runif(5),
                 cnv1.2     = runif(5),
                 cnv1.3     = runif(5),
                 cnv2.1     = runif(5),
                 cnv2.2     = runif(5),
                 cnv2.3     = runif(5) )
x
myCPed <- as.cped( x ) # Mark it with the class 'cped'
myCPed

## Not run: 
##D ####################
##D ## Second Example ##
##D 
##D ## Again, a completely random dataset.
##D ## Here we go through an analysis of it.
##D ## However, see pbat.m for many more details on all of the options.
##D ## Create a completely random dataset with one cnv.
##D set.seed(13)
##D NUMTRIOS <- 500
##D ## The data is completely random, it does not really make any sense.
##D cped <- as.cped(data.frame(
##D   pid             = kronecker(1:NUMTRIOS, rep(1,3)),
##D   id              = rep(1:3, NUMTRIOS),
##D   idfath          = rep(c(0,0,1), NUMTRIOS),
##D   idmoth          = rep(c(0,0,2), NUMTRIOS),
##D   sex             = rep(c(2,1,1), NUMTRIOS),
##D   AffectionStatus = rep(c(0,0,2), NUMTRIOS),
##D   cnv1.1          = runif(3*NUMTRIOS),
##D   cnv1.2          = runif(3*NUMTRIOS),
##D   cnv1.3          = runif(3*NUMTRIOS)))
##D 
##D ## Print out part of the dataset
##D print(head(cped))
##D 
##D ## Command line run
##D pbat.work() ## Makes the intermediate files go in ./pbatRwork directory
##D 
##D ## - Analyzing the first intensity
##D res1 <- pbat.m(AffectionStatus ~ NONE, ped=cped, phe=NULL, fbat="gee",
##D                 cnv.intensity=1, cnv.intensity.num=3, offset="none")
##D pbat.clean(res1, all.output=TRUE) ## Removes all intermediate files
##D ## - Analyzing the second intensity
##D res2 <- pbat.m(AffectionStatus ~ NONE, ped=cped, phe=NULL, fbat="gee",
##D                 cnv.intensity=2, cnv.intensity.num=3, offset="none")
##D pbat.clean(res2, all.output=TRUE)
##D ## - Analyzing the third intensity
##D res3 <- pbat.m(AffectionStatus ~ NONE, ped=cped, phe=NULL, fbat="gee",
##D                 cnv.intensity=3, cnv.intensity.num=3, offset="none")
##D pbat.clean(res3, all.output=TRUE)
##D 
##D pbat.unwork() ## Close up work (head to original working directory)
##D 
##D ## Print all of the results
##D print(res1$results)
##D print(res2$results)
##D print(res3$results)
##D 
##D ## Or put all the results together and write to file
##D res1$results <- rbind(res1$results, res2$results, res3$results)
##D write.pbat(res1, "cpedResults.csv")
##D 
##D ## Otherwise, we could write the data to disk, 
##D ##  and run with the GUI interface
##D ## Write the data to disk:
##D write.cped("cped.cped", cped)
## End(Not run)



