library(HHG)


### Name: hhg.univariate.nulltable.from.mstats
### Title: Constructor of Distribution Free Null Table Using Existing
###   Statistics
### Aliases: hhg.univariate.nulltable.from.mstats

### ** Examples


## Not run: 
##D 
##D # 1. Downloading a lookup table from site
##D # download from site http://www.math.tau.ac.il/~ruheller/Software.html
##D ####################################################################
##D #using an already ready null table as object (for use in test functions)
##D #for example, ADP likelihood ratio statistics, for the independence problem,
##D #for sample size n=300
##D load('Object-ADP-n_300.Rdata') #=>null.table
##D 
##D #or using a matrix of statistics generated for the null distribution,
##D #to create your own table.
##D load('ADP-nullsim-n_300.Rdata') #=>mat
##D null.table = hhg.univariate.nulltable.from.mstats(m.stats = mat,minm = 2,
##D              maxm = 5,type = 'Independence', variant = 'ADP',size = 300,
##D              score.type = 'LikelihoodRatio',aggregation.type = 'sum')
##D              
##D # 2. generating an independence null table using multiple cores,
##D #and then compiling to object.
##D ####################################################################
##D library(parallel)
##D library(doParallel)
##D library(foreach)
##D library(doRNG)
##D 
##D #generate an independence null table
##D nr.cores = 4 #this is computer dependent
##D n = 30 #size of independence problem
##D nr.reps.per.core = 25
##D mmax =5
##D score.type = 'LikelihoodRatio'
##D aggregation.type = 'sum'
##D variant = 'ADP'
##D 
##D #generating null table of size 4*25
##D 
##D #single core worker function
##D generate.null.distribution.statistic =function(){
##D   library(HHG)
##D   null.table = matrix(NA,nrow=nr.reps.per.core,ncol = mmax-1)
##D   for(i in 1:nr.reps.per.core){
##D     #note that the statistic is distribution free (based on ranks),
##D     #so creating a null table (for the null distribution)
##D     #is essentially permuting over the ranks
##D     statistic = hhg.univariate.ind.stat(1:n,sample(1:n),
##D                                         variant = variant,
##D                                         aggregation.type = aggregation.type,
##D                                         score.type = score.type,
##D                                         mmax = mmax)$statistic
##D     null.table[i,]=statistic
##D   }
##D   rownames(null.table)=NULL
##D   return(null.table)
##D }
##D 
##D #parallelize over cores
##D cl = makeCluster(nr.cores)
##D registerDoParallel(cl)
##D res = foreach(core = 1:nr.cores, .combine = rbind, .packages = 'HHG',
##D               .export=c('variant','aggregation.type','score.type',
##D               'mmax','nr.reps.per.core','n'), .options.RNG=1234) %dorng% 
##D               { generate.null.distribution.statistic() }
##D stopCluster(cl)
##D 
##D #the null table:
##D head(res)
##D 
##D #as object to be used:
##D null.table = hhg.univariate.nulltable.from.mstats(res,minm=2,
##D   maxm = mmax,type = 'Independence',
##D   variant = variant,size = n,score.type = score.type,
##D   aggregation.type = aggregation.type)
##D 
##D #using the null table, checking for dependence in a linear relation
##D x=rnorm(n)
##D y=x+rnorm(n)
##D ADP.test = hhg.univariate.ind.combined.test(x,y,null.table)
##D ADP.test$MinP.pvalue #pvalue
##D 
##D 
##D # 3. generating a k-sample null table using multiple cores
##D # and then compiling to object.
##D ####################################################################
##D 
##D library(parallel)
##D library(doParallel)
##D library(foreach)
##D library(doRNG)
##D 
##D #generate a k sample null table
##D nr.cores = 4 #this is computer dependent
##D n1 = 25 #size of first group
##D n2 = 25 #size of first group
##D nr.reps.per.core = 25
##D mmax =5
##D score.type = 'LikelihoodRatio'
##D aggregation.type = 'sum'
##D 
##D #generating null table of size 4*25
##D 
##D #single core worker function
##D generate.null.distribution.statistic =function(){
##D   library(HHG)
##D   null.table = matrix(NA,nrow=nr.reps.per.core,ncol = mmax-1)
##D   for(i in 1:nr.reps.per.core){
##D     #note that the statistic is distribution free (based on ranks),
##D     #so creating a null table (for the null distribution)
##D     #is essentially permuting over the ranks
##D     statistic = hhg.univariate.ks.stat(1:(n1+n2),sample(c(rep(0,n1),rep(1,n2))),
##D                                         aggregation.type = aggregation.type,
##D                                         score.type = score.type,
##D                                         mmax = mmax)$statistic
##D     null.table[i,]=statistic
##D   }
##D   rownames(null.table)=NULL
##D   return(null.table)
##D }
##D 
##D #parallelize over cores
##D cl = makeCluster(nr.cores)
##D registerDoParallel(cl)
##D res = foreach(core = 1:nr.cores, .combine = rbind, .packages = 'HHG',
##D               .export=c('n1','n2','aggregation.type','score.type','mmax',
##D               'nr.reps.per.core'), .options.RNG=1234) %dorng% 
##D               {generate.null.distribution.statistic()}
##D stopCluster(cl)
##D 
##D #the null table:
##D head(res)
##D 
##D #as object to be used:
##D null.table = hhg.univariate.nulltable.from.mstats(res,minm=2,
##D   maxm = mmax,type = 'KSample',
##D   variant = 'KSample-Variant',size = c(n1,n2),score.type = score.type,
##D   aggregation.type = aggregation.type)
##D 
##D #using the null table, checking for dependence in a case of two distinct samples
##D x=1:(n1+n2)
##D y=c(rep(0,n1),rep(1,n2))
##D Sm.test = hhg.univariate.ks.combined.test(x,y,null.table)
##D Sm.test$MinP.pvalue #pvalue
## End(Not run)




