library(blockingChallenge)


### Name: makeblocks
### Title: Creates strata of size 'bsize' aiming to minimize within strata
###   distance.
### Aliases: makeblocks
### Keywords: Challenge Stratification algorithm

### ** Examples

## IN THESE EXAMPLES YOU NEED TO LOAD THE R PACKAGE 
#  'optmatch'.  OTHERWISE, THEY WILL RUN IN A CODE CHECK MODE.
# library(optmatch)
###### 		Usage 1		##########
data(nh0506)
## Don't show: 
	nh0506 <- nh0506[1:13,]
## End(Don't show)
res <- makeblocks(nh0506, bsize=4, maxItr=15, 
         vars=c("female","age","black","hispanic","education","povertyr"))

		
## Not run: 
##D ###### Some diagnostics
##D v = "age"
##D ## Boxplots
##D temp = res$.data
##D temp[[paste0(v,'.instrata')]] <- temp[[v]] 
##D meanbystrat <- aggregate(temp[[v]], by =list(strata=temp$strata), mean)
##D for(b in unique(temp$strata)){
##D      who <- which( temp$strata == b )
##D      temp[[paste0(v,'.instrata')]][who] <- temp[[paste0(v,'.instrata')]][who] 
##D                         - meanbystrat[meanbystrat[,1]==b,2]
##D }
##D 
##D temp[[paste0(v,'.instrata')]] = temp[[paste0(v,'.instrata')]] + mean(temp[[v]])
##D 
##D boxplot(v~x,
##D data = data.frame(v=c(temp[[v]],temp[[paste0(v,'.instrata')]][temp$strata>0]), 
##D                x=c(rep('prestratification', nrow(temp)), 
##D                         rep('poststratification', sum(temp$strata>0)))))
##D 
##D ## Anova
##D summary(aov(age~factor(strata), data=res$.data[res$.data$strata>0,]))
## End(Not run)


###### 		Usage 2		##########
distmat <- smahal(nh0506[,c("female","age","black","hispanic",
								"education","povertyr")])
res <- makeblocks(distmat, .data=nh0506, bsize=4, maxItr=15)


## Not run: 
##D # Other usages
##D ## Internally calls 'smahal' to create the distances.
##D res <- makeblocks(nh0506[,c("female","age","black","hispanic",
##D                                            "education","povertyr")], 4)
##D 
##D ## Returns the blocking structure in a matrix form, if data is not provided.
##D distmat <- smahal(nh0506[,c("female","age","black",
##D                                   "hispanic","education","povertyr")])
##D res <- makeblocks(distmat, bsize=4, maxItr=20)
## End(Not run)


###### 		Usage 3		##########
data(wls)

## Not run: 
##D data(wls)
##D library(optmatch)
##D wls4match <- wls
##D 
##D ## This code replicates the blocking algorithm used in the paper
##D ##	Karmakar, Small, and Rosenbaum (2018).
##D 
##D ## Create the distance matrix
##D 
##D distmat1 <- smahal(wls4match[,"gwiiq_bm"]) 				## IQ
##D 
##D ## Father's and mother's edu and parent's income
##D distmat2 <- smahal(wls4match[,c("edfa57q.NoNA", "edmo57q.NoNA", "bmpin1.NoNA",	
##D               ## Father's and mother's edu and parent's income
##D               "incg400", "incg250")])				
##D               ## Indicators for income in the top 5##D 
##D 			  
##D ## occupation score
##D distmat2.2 <- smahal(wls4match[,c("ocsf57.NoNA", "ocpf57.NoNA")])		
##D 
##D ## missing indicators
##D distmat3 <- smahal(wls4match[,c("edfa57q.miss", "edmo57q.miss", 	
##D               "bmpin1.miss", "ocsf57.miss", "ocpf57.miss")])
##D 
##D ## The IQ = gwiiq_bm is given more weight.
##D ##  parents' education and parent's income 
##D distmat = distmat1*10+6*distmat2+3*distmat2.2+2*distmat3
##D 
##D ## creating the blocks.  This can take about 30min to run.
##D ##	May take more time depending of the computation power of the system.
##D set.seed(0841)
##D res.20.2 = makeblocks(distmat, bsize=25, Itr=250, maxItr=250, .data=wls4match)
## End(Not run)



