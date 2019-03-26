## ----echo=FALSE----------------------------------------------------------
set.seed(2)

## ---- eval=FALSE---------------------------------------------------------
#  #For (N<100):
#  N = 30
#  data = hhg.example.datagen(N, 'Parabola')
#  X = data[1,]
#  Y = data[2,]
#  plot(X,Y)
#  
#  #Option 1: Perform the ADP combined test
#  #using partitions sizes up to 4. see documentation for other parameters of the combined test
#  #(it is recommended to use mmax >= 4, or the default parameter for large data sets)
#  combined = hhg.univariate.ind.combined.test(X,Y,nr.perm = 200,mmax=4)
#  combined
#  
#  
#  #Option 2: Perform the hhg test:
#  
#  ## Compute distance matrices, on which the HHG test will be based
#  Dx = as.matrix(dist((X), diag = TRUE, upper = TRUE))
#  Dy = as.matrix(dist((Y), diag = TRUE, upper = TRUE))
#  
#  hhg = hhg.test(Dx, Dy, nr.perm = 1000)
#  
#  hhg
#  
#  
#  #For N>100, Fast.ADP.test is the reccomended option:
#  
#  N_Large = 1000
#  data_Large = hhg.example.datagen(N_Large, 'W')
#  X_Large = data_Large[1,]
#  Y_Large = data_Large[2,]
#  plot(X_Large,Y_Large)
#  
#  NullTable_for_N_Large_MXM_tables = Fast.ADP.nulltable(N_Large, variant = 'ADP-EQP',
#  nr.atoms = 30,nr.perm=200)
#  NullTable_for_N_Large_MXL_tables = Fast.ADP.nulltable(N_Large, variant = 'ADP-EQP-ML',
#  nr.atoms = 30,nr.perm=200)
#  
#  ADP_EQP_Result = Fast.ADP.test(X_Large,Y_Large, NullTable_for_N_Large_MXM_tables)
#  ADP_EQP_ML_Result = Fast.ADP.test(X_Large,Y_Large, NullTable_for_N_Large_MXL_tables)
#  
#  ADP_EQP_Result
#  ADP_EQP_ML_Result
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  N0=50
#  N1=50
#  X = c(c(rnorm(N0/2,-2,0.7),rnorm(N0/2,2,0.7)),c(rnorm(N1/2,-1.5,0.5),rnorm(N1/2,1.5,0.5)))
#  Y = (c(rep(0,N0),rep(1,N1)))
#  #plot the two distributions by group index (0 or 1)
#  plot(Y,X)
#  
#  
#  #Option 1: Perform the Sm combined test
#  
#  
#  combined.test = hhg.univariate.ks.combined.test(X,Y)
#  combined.test
#  
#  
#  #Option 2: Perform the hhg K-sample test:
#  
#  
#  Dx = as.matrix(dist(X, diag = TRUE, upper = TRUE))
#  
#  hhg = hhg.test.k.sample(Dx, Y, nr.perm = 1000)
#  
#  hhg
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  n=30 #number of samples
#  dimensions_x=5 #dimension of X matrix
#  dimensions_y=5 #dimension of Y matrix
#  X=matrix(rnorm(n*dimensions_x,mean = 0, sd = 1),nrow = n,ncol = dimensions_x) #generate noise
#  Y=matrix(rnorm(n*dimensions_y,mean =0, sd = 3),nrow = n,ncol = dimensions_y)
#  
#  Y[,1] = Y[,1] + X[,1] + 4*(X[,1])^2 #add in the relations
#  Y[,2] = Y[,2] + X[,2] + 4*(X[,2])^2
#  
#  #compute the distance matrix between observations.
#  #User may use other distance metrics.
#  Dx = as.matrix(dist((X)), diag = TRUE, upper = TRUE)
#  Dy = as.matrix(dist((Y)), diag = TRUE, upper = TRUE)
#  
#  #run test
#  hhg = hhg.test(Dx, Dy, nr.perm = 1000)
#  
#  hhg
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  #multivariate k-sample, with k=3 groups
#  n=100 #number of samples in each group
#  x1 = matrix(rnorm(2*n),ncol = 2) #group 1
#  x2 = matrix(rnorm(2*n),ncol = 2) #group 2
#  x2[,2] = 1*x2[,1] + x2[,2]
#  x3 = matrix(rnorm(2*n),ncol = 2) #group 3
#  x3[,2] = -1*x3[,1] + x3[,2]
#  x= rbind(x1,x2,x3)
#  y=c(rep(0,n),rep(1,n),rep(2,n)) #group numbers, starting from 0 to k-1
#  
#  plot(x[,1],x[,2],col = y+1,xlab = 'first component of X',ylab = 'second component of X',
#       main = 'Multivariate K-Sample Example with K=3 \n Groups Marked by Different Colors')
#  
#  Dx = as.matrix(dist(x, diag = TRUE, upper = TRUE)) #distance matrix
#  
#  hhg = hhg.test.k.sample(Dx, y, nr.perm = 1000)
#  
#  hhg
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  N = 35
#  data = hhg.example.datagen(N, 'Parabola')
#  X = data[1,]
#  Y = data[2,]
#  plot(X,Y)
#  
#  
#  #I) Computing test statistics , with default parameters:
#  
#  #statistic:
#  hhg.univariate.ADP.Likelihood.result = hhg.univariate.ind.stat(X,Y)
#  hhg.univariate.ADP.Likelihood.result
#  
#  #null table:
#  ADP.null = hhg.univariate.ind.nulltable(N)
#  #pvalue:
#  hhg.univariate.ind.pvalue(hhg.univariate.ADP.Likelihood.result, ADP.null)
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  #II) Computing test statistics , with summation over Data Derived Partitions (DDP), using Pearson scores, and partition sizes up to 5:
#  
#  #statistic:
#  hhg.univariate.DDP.Pearson.result = hhg.univariate.ind.stat(X,Y,variant = 'DDP',score.type = 'Pearson', mmax = 5)
#  hhg.univariate.DDP.Pearson.result
#  
#  #null table:
#  DDP.null = hhg.univariate.ind.nulltable(N,mmax = 5,variant = 'DDP',score.type = 'Pearson', nr.replicates = 1000)
#  #pvalue , for different partition sizes:
#  hhg.univariate.ind.pvalue(hhg.univariate.DDP.Pearson.result, DDP.null, m =2)
#  hhg.univariate.ind.pvalue(hhg.univariate.DDP.Pearson.result, DDP.null, m =5)
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  N = 35
#  data = hhg.example.datagen(N, 'Parabola')
#  X = data[1,]
#  Y = data[2,]
#  plot(X,Y)
#  
#  #Perform MinP & Fisher Tests - without existing null tables. Null tables are generated by the test function.
#  #using partitions sizes up to 4. see documentation for other parameters of the combined test (using existing null tables when performing many tests)
#  results = hhg.univariate.ind.combined.test(X,Y,variant='DDP' ,nr.perm = 200,mmax=4)
#  results
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  #KS example - two groups of size 50
#  N0=50
#  N1=50
#  X = c(c(rnorm(N0/2,-2,0.7),rnorm(N0/2,2,0.7)),c(rnorm(N1/2,-1.5,0.5),rnorm(N1/2,1.5,0.5)))
#  Y = (c(rep(0,N0),rep(1,N1)))
#  #plot distributions of result by group
#  plot(Y,X)
#  
#  
#  statistic = hhg.univariate.ks.stat(X,Y)
#  statistic
#  
#  nulltable = hhg.univariate.ks.nulltable(c(N0,N1))
#  hhg.univariate.ks.pvalue(statistic , nulltable) #pvalue of the default number of partitions
#  
#  hhg.univariate.ks.pvalue(statistic , nulltable,m=5) #pvalue of partition size 5
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  combined.test = hhg.univariate.ks.combined.test(X,Y,nulltable)
#  combined.test
#  

## ---- eval=FALSE---------------------------------------------------------
#  # download from site http://www.math.tau.ac.il/~ruheller/Software.html
#  
#  #using an already ready null table as object (for use in test functions)
#  #for example, ADP likelihood ratio statistics, for the independence problem, for sample size n=300
#  load('Object-ADP-n_300.Rdata') #=>null.table
#  
#  #or using a matrix of statistics generated for the null distribution, to create your own table.
#  load('ADP-nullsim-n_300.Rdata') #=>mat
#  null.table = hhg.univariate.nulltable.from.mstats(m.stats = mat,minm = 2,maxm = 5,type = 'Independence',
#               variant = 'ADP',size = 300,score.type = 'LikelihoodRatio',aggregation.type = 'sum')
#  

## ---- eval=FALSE---------------------------------------------------------
#  library(parallel)
#  library(doParallel)
#  library(foreach)
#  library(doRNG)
#  
#  #function for generating independence null table
#  
#  Create.IND.Null.Parallelized = function(N,NR.CORES,MMAX,variant.p = 'ADP-EQP-ML',NR.ATOMS = 60,NR.REPS = 1000,agg.type = 'sum',score.type.p = 'LikelihoodRatio',keep=F){
#    nr.cores = NR.CORES
#    n = N
#    nr.reps.per.core = ceiling(NR.REPS/nr.cores)
#    mmax =MMAX
#    score.type = score.type.p
#    aggregation.type = agg.type
#    variant = variant.p
#    nr.atoms = NR.ATOMS
#  
#    generate.null.distribution.statistic =function(){
#      library(HHG)
#      null.table = NULL
#      for(i in 1:nr.reps.per.core){
#        statistic = hhg.univariate.ind.stat(1:n,sample(1:n),
#                                            variant = variant,
#                                            aggregation.type = aggregation.type,
#                                            score.type = score.type,
#                                            mmax = mmax,nr.atoms = nr.atoms)$statistic
#        null.table=rbind(null.table, statistic)
#      }
#      rownames(null.table)=NULL
#      return(null.table)
#    }
#  
#    cl = makeCluster(NR.CORES)
#    registerDoParallel(cl)
#    res = foreach(core = 1:nr.cores, .combine = rbind, .packages = 'HHG', .export=c('variant', 'aggregation.type', 'score.type','mmax','nr.reps.per.core','n','NR.ATOMS'),.options.RNG = 1) %dorng% {
#                    generate.null.distribution.statistic()
#                  }
#    stopCluster(cl)
#  
#    temp =  HHG::hhg.univariate.nulltable.from.mstats(res,minm=2, maxm = mmax, type = 'Independence', variant = variant, size = n,score.type = score.type, keep.simulation.data=keep, aggregation.type = aggregation.type, nr.atoms = nr.atoms, compress = T)
#    return(temp)
#  }
#  #end of function for generating null tables
#  
#  
#  #null table (look up table) : sum all 2X2,3X3,..., mmax X mmax tables, using LRT scores
#  nt_ADP_LR = Create.IND.Null.Parallelized(N = 40,NR.CORES = detectCores()-1 ,MMAX = 6,variant.p = 'ADP', NR.REPS = 1000,agg.type = 'sum')
#  
#  #null table (look up table) : sum all 2X2,2X3,3X2,2X4,3X3,4X2..., mmax -1 X mmax ,
#  # mmax X mmax -1 , mmax X mmax tables, using LRT scores
#  nt_ADP_MXL_LR = Create.IND.Null.Parallelized(N = 40, NR.CORES = detectCores()-1, MMAX = 6, variant.p = 'ADP-ML', NR.REPS = 1000,agg.type = 'sum')
#  
#  #null table (look up table) : sum all 2X2,3X3,..., mmax X mmax tables, using Pearson scores
#  nt_ADP_Pearson = Create.IND.Null.Parallelized(N = 40,NR.CORES = detectCores()-1 ,MMAX = 6, variant.p = 'ADP', NR.REPS = 1000, agg.type = 'sum', score.type.p = 'Pearson')
#  
#  #null table (look up table) :  sum all DDP partitions of size 2X2, ..., mmax X mmax
#  nt_DDP_LR = Create.IND.Null.Parallelized(N = 40, NR.CORES = detectCores()-1 , MMAX = 6, variant.p = 'DDP', NR.REPS = 1000, agg.type = 'sum', score.type.p = 'Pearson')
#  
#  set.seed(1)
#  x=rnorm(40)
#  y=0.25 * x + rnorm(40)
#  
#  # different look up tables enforce different tests
#  res = HHG::hhg.univariate.ind.combined.test(x,y,nt_ADP_LR); res
#  res = HHG::hhg.univariate.ind.combined.test(x,y,nt_ADP_MXL_LR); res
#  res = HHG::hhg.univariate.ind.combined.test(x,y,nt_ADP_Pearson); res
#  res = HHG::hhg.univariate.ind.combined.test(x,y,nt_DDP_LR); res
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  library(parallel)
#  library(doParallel)
#  library(foreach)
#  library(doRNG)
#  
#  #generate a K-Sample null table
#  Create.KSAMPLE.Null.Parallelized = function(Group_Sizes,NR.CORES,MMAX,variant.p = 'KSample-Variant',NR.ATOMS = 60,NR.REPS = 1000,agg.type = 'sum',score.type.p = 'LikelihoodRatio',keep=F){
#    nr.cores = NR.CORES
#    n = sum(Group_Sizes)
#    nr.reps.per.core = ceiling(NR.REPS/nr.cores)
#    mmax =MMAX
#    score.type = score.type.p
#    aggregation.type = agg.type
#    variant = variant.p
#    nr.atoms = NR.ATOMS
#    sample_y=NULL
#    for(i in 1:length(Group_Sizes)){
#      sample_y = c(sample_y,rep(i-1,Group_Sizes[i]))
#    }
#    generate.null.distribution.statistic =function(){
#      library(HHG)
#      null.table = NULL
#      for(i in 1:nr.reps.per.core){
#        statistic = hhg.univariate.ks.stat(1:n,sample(sample_y),
#                                            variant = variant,
#                                            aggregation.type = aggregation.type,
#                                            score.type = score.type,
#                                            mmax = mmax,nr.atoms = nr.atoms)$statistic
#        null.table=rbind(null.table, statistic)
#      }
#      rownames(null.table)=NULL
#      return(null.table)
#    }
#  
#  
#    cl = makeCluster(NR.CORES)
#    registerDoParallel(cl)
#    res = foreach(core = 1:nr.cores, .combine = rbind, .packages = 'HHG',
#                  .export=c('variant','aggregation.type','score.type','mmax','nr.reps.per.core','n','NR.ATOMS'),.options.RNG = 1) %dorng% {
#                    generate.null.distribution.statistic()
#                  }
#    stopCluster(cl)
#  
#    temp =  HHG::hhg.univariate.nulltable.from.mstats(res, minm=2, maxm = mmax, type = 'KSample', variant = variant, size = Group_Sizes, score.type = score.type,keep.simulation.data=keep, aggregation.type = aggregation.type, nr.atoms = nr.atoms, compress = T)
#    return(temp)
#  }
#  # end of function for generating null tables
#  
#  #null table (look up table) : sum of all partitions of the data with 2,3,...,m cells, using LRT scores
#  nt_Sm_LR = Create.KSAMPLE.Null.Parallelized(Group_Sizes = c(50,50) , NR.CORES = detectCores()-1 ,MMAX = 10,NR.REPS = 1000)
#  
#  #null table (look up table) : sum of all partitions of the data
#  #with 2,3,...,m cells, using Pearson Chi-Square scores
#  nt_Sm_Pearson = Create.KSAMPLE.Null.Parallelized(Group_Sizes = c(50,50) , NR.CORES = detectCores()-1 ,MMAX = 10,NR.REPS = 1000,score.type.p = 'Pearson')
#  
#  #null table (look up table) : maxmimum over all partitions of the data with 2,3,...,m cells
#  nt_Mm_LR = Create.KSAMPLE.Null.Parallelized(Group_Sizes = c(50,50) , NR.CORES = detectCores()-1 ,MMAX = 10,NR.REPS = 1000,agg.type = 'max')
#  
#  
#  set.seed(1)
#  x = rnorm(100)
#  x[1:50] = x[1:50] + 1 #create some difference between groups
#  y = c(rep(0,50),rep(1,50)) #group identity
#  
#  res = HHG::hhg.univariate.ks.combined.test(x,y,nt_Sm_LR);res
#  
#  res = HHG::hhg.univariate.ks.combined.test(x,y,nt_Sm_Pearson);res
#  
#  res = HHG::hhg.univariate.ks.combined.test(x,y,nt_Mm_LR);res
#  

## ---- eval=FALSE---------------------------------------------------------
#  #Option 1:
#  # It is better to use the Fast.ADP.test, which has nr.atoms and paritition size m automatically set for large data:
#  
#  N_Large = 1000
#  data_Large = hhg.example.datagen(N_Large, 'W')
#  X_Large = data_Large[1,]
#  Y_Large = data_Large[2,]
#  plot(X_Large,Y_Large)
#  
#  NullTable_for_N_Large_MXM_tables = Fast.independence.test.nulltable(N_Large, variant = 'ADP-EQP',
#    nr.atoms = 30,nr.perm=200)
#  NullTable_for_N_Large_MXL_tables = Fast.independence.test.nulltable(N_Large, variant = 'ADP-EQP-ML',
#    nr.atoms = 30,nr.perm=200)
#  
#  ADP_EQP_Result = Fast.independence.test(X_Large,Y_Large, NullTable_for_N_Large_MXM_tables)
#  ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large, NullTable_for_N_Large_MXL_tables)
#  
#  ADP_EQP_Result
#  ADP_EQP_ML_Result
#  
#  #null distribution depends only on data size (length(X)), so same null table can be used many times.
#  #For example, another data set:
#  data_Large = hhg.example.datagen(N_Large, 'Circle')
#  X_Large = data_Large[1,]
#  Y_Large = data_Large[2,]
#  plot(X_Large,Y_Large)
#  
#  #you may use Fisher type scores:
#  ADP_EQP_Result = Fast.independence.test(X_Large,Y_Large, NullTable_for_N_Large_MXM_tables,
#    combining.type='Fisher')
#  #or both MinP and Fisher:
#  ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large, NullTable_for_N_Large_MXL_tables,
#    combining.type='Both')
#  
#  
#  ADP_EQP_Result
#  ADP_EQP_ML_Result
#  
#  #Option 2: use the 'ADP-EQP' and 'ADP-EQP-ML' variants directly, with the combined test function (combining all partition sizes):
#  
#  N_Large = 1000
#  data_Large = hhg.example.datagen(N_Large, 'W')
#  X_Large = data_Large[1,]
#  Y_Large = data_Large[2,]
#  plot(X_Large,Y_Large)
#  
#  NullTable_for_N_Large_MXM_tables = hhg.univariate.ind.nulltable(N_Large, variant = 'ADP-EQP',
#  nr.atoms = 30,nr.replicates=200)
#  NullTable_for_N_Large_MXL_tables = hhg.univariate.ind.nulltable(N_Large, variant = 'ADP-EQP-ML',
#  nr.atoms = 30,nr.replicates=200)
#  
#  ADP_EQP_Result = hhg.univariate.ind.combined.test(X_Large,Y_Large, NullTable_for_N_Large_MXM_tables)
#  ADP_EQP_ML_Result = hhg.univariate.ind.combined.test(X_Large,Y_Large, NullTable_for_N_Large_MXL_tables)
#  
#  ADP_EQP_Result
#  ADP_EQP_ML_Result
#  
#  #Option 3: perform ADP-EQP and ADP-EQP-ML for a specific partition size (M cells on x axis and L cells on y axis)
#  
#  
#  ADP_EQP_result = hhg.univariate.ind.stat(X_Large,Y_Large,variant='ADP-EQP', nr.atoms =30)
#  ADP_EQP_ML_result = hhg.univariate.ind.stat(X_Large,Y_Large,variant='ADP-EQP-ML', nr.atoms = 30)
#  
#  #P-value for the S_(5X5) statistic, the sum over all 5X5 partitions:
#  hhg.univariate.ind.pvalue(ADP_EQP_result,NullTable_for_N_Large_MXM_tables,m=5 )
#  
#  #P-value for the S_(5X3) statistic, the sum over all 5X3 partitions:
#  hhg.univariate.ind.pvalue(ADP_EQP_ML_result,NullTable_for_N_Large_MXL_tables,m=5,l=3)
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  
#  #Two groups, each from a different normal mixture, total sample size is 10^4:
#  X_Large = c(c(rnorm(2500,-2,0.7),rnorm(2500,2,0.7)),c(rnorm(2500,-1.5,0.5),rnorm(2500,1.5,0.5)))
#  Y_Large = (c(rep(0,5000),rep(1,5000)))
#  plot(Y_Large,X_Large)
#  
#  
#  N0_large = 5000
#  N1_large = 5000
#  
#  Sm.EQP.null.table = hhg.univariate.ks.nulltable(c(N0_large,N1_large), nr.replicates=200,
#  variant = 'KSample-Equipartition', mmax = 30)
#  Mm.EQP.null.table = hhg.univariate.ks.nulltable(c(N0_large,N1_large), nr.replicates=200,
#  aggregation.type='max', variant = 'KSample-Equipartition', mmax = 30)
#  
#  MinPFisher.Sm.EQP.result = hhg.univariate.ks.combined.test(X_Large, Y_Large,
#  NullTable =  Sm.EQP.null.table ,
#    combining.type = 'Both')
#  MinPFisher.Sm.EQP.result
#  
#  MinPFisher.Mm.EQP.result = hhg.univariate.ks.combined.test(X_Large, Y_Large,
#  NullTable =  Mm.EQP.null.table ,
#    combining.type = 'Both')
#  MinPFisher.Mm.EQP.result
#  
#  
#  

## ---- eval=FALSE---------------------------------------------------------
#  
#  library(parallel)
#  library(doParallel)
#  library(foreach)
#  library(doRNG)
#  
#  
#  
#  nt_ADP_EQP_LR = Create.IND.Null.Parallelized(N = 10000, NR.CORES = detectCores()-1 , MMAX = 6, variant.p = 'ADP-EQP', NR.REPS = 1000, agg.type = 'sum', NR.ATOMS = 40)
#  
#  nt_ADP_EQP_MXL_LR = Create.IND.Null.Parallelized(N = 10000, NR.CORES = detectCores()-1, MMAX = 6, variant.p = 'ADP-EQP-ML', NR.REPS = 1000, agg.type = 'sum', NR.ATOMS = 40)
#  
#  set.seed(1)
#  x=rnorm(10000)
#  y=0.1*x+rnorm(10000)
#  
#  res = HHG::hhg.univariate.ind.combined.test(x,y,nt_ADP_EQP_LR);res
#  res = HHG::hhg.univariate.ind.combined.test(x,y,nt_ADP_EQP_MXL_LR);res
#  

## ----eval = F------------------------------------------------------------
#  
#  library(parallel)
#  library(doParallel)
#  library(foreach)
#  library(doRNG)
#  
#  
#  nt_Sm_EQP_LR = Create.KSAMPLE.Null.Parallelized(Group_Sizes = c(5000,5000) , NR.CORES = detectCores()-1, variant.p = 'KSample-Equipartition', MMAX = 20,NR.REPS = 1000,NR.ATOMS = 100)
#  
#  nt_Mm_EQP_LR = Create.KSAMPLE.Null.Parallelized(Group_Sizes = c(5000,5000) ,agg.type = 'max', NR.CORES = detectCores()-1 , variant.p = 'KSample-Equipartition', MMAX = 20,NR.REPS = 1000,NR.ATOMS = 100)
#  
#  
#  set.seed(1)
#  x = rnorm(10000)
#  x[1:5000] = x[1:5000] + 1 #create some difference between groups
#  y = c(rep(0,5000),rep(1,5000)) #group identity
#  
#  res = HHG::hhg.univariate.ks.combined.test(x,y,nt_Sm_EQP_LR);res
#  
#  res = HHG::hhg.univariate.ks.combined.test(x,y,nt_Mm_EQP_LR);res
#  
#  
#  
#  

