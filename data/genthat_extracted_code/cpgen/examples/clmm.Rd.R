library(cpgen)


### Name: clmm
### Title: Linear Mixed Models using Gibbs Sampling
### Aliases: clmm
### Keywords: Genomic Prediction GWAS

### ** Examples


## Not run: 
##D 
##D ############################################################# 
##D ### Running a model with an additive and dominance effect ###
##D ############################################################# 
##D 
##D # generate random data
##D rand_data(500,5000)
##D 
##D ### compute the relationship matrices
##D G.A <- cgrm.A(M,lambda=0.01)
##D G.D <- cgrm.D(M,lambda=0.01)
##D 
##D ### generate the list of design matrices for clmm
##D Z_list = list(t(chol(G.A)),t(chol(G.D)))
##D 
##D ### specify options
##D par_random = list(list(method="ridge",scale=var(y)/2 ,df=5, name="add"),
##D 		  list(method="ridge",scale=var(y)/10,df=5, name="dom"))
##D 
##D ### run 
##D 
##D set_num_threads(1)
##D fit <- clmm(y = y, Z = Z_list, par_random=par_random, niter=5000, burnin=2500)
##D 
##D ### inspect results
##D str(fit)
##D 
##D 
##D ########################
##D ### Cross Validation ###
##D ########################
##D  
##D ### 4-fold cross-validation with one repetition:
##D # generate random data
##D rand_data(500,5000)
##D 
##D ### compute the list of masked phenotype-vectors for CV
##D y_CV <- cCV(y, fold=4, reps=1)
##D 
##D 
##D ### Cross Validation using GBLUP
##D G.A <- cgrm.A(M,lambda=0.01)
##D 
##D 
##D ### generate the list of design matrices for clmm
##D Z_list = list(t(chol(G.A)))
##D 
##D ### specify options
##D h2 = 0.3
##D scale = unlist(lapply(y_CV,function(x)var(x,na.rm=T))) * h2
##D df = rep(5,length(y_CV))
##D par_random = list(list(method="ridge",scale=scale,df=df, name="animal"))
##D 
##D ### run model with 4 threads
##D set_num_threads(4)
##D fit <- clmm(y = y_CV, Z = Z_list, par_random=par_random, niter=5000, burnin=2500)
##D 
##D ### inspect results
##D str(fit)
##D 
##D ### obtain predictions
##D pred <- get_pred(fit)
##D 
##D ### prediction accuracy
##D get_cor(pred,y_CV,y)
##D 
##D ########################################################
##D ### GWAS using Bayesian Regression on marker windows ###
##D ########################################################
##D  
##D # generate random data
##D rand_data(500,5000)
##D 
##D ### generate the list of design matrices for clmm
##D Z_list = list(M)
##D 
##D ### specify options
##D h2 = 0.3
##D scale = var(y) * h2
##D df = 5
##D # specifying the model
##D # Here we use ridge regression on the marker covariates
##D # and define a window size of 100 and a threshold of 0.01
##D # which defines the proportion of genetic variance accounted
##D # for by a single window
##D par_random = list(list(method="ridge",scale=scale,df=df,
##D              GWAS=list(window_size=100, threshold=0.01), name="markers"))
##D 
##D ### run 
##D set_num_threads(1)
##D fit <- clmm(y =y, Z = Z_list, par_random=par_random, niter=2000, burnin=1000)
##D 
##D ### inspect results
##D str(fit)
##D 
##D ### extract GWAS part
##D gwas <- fit$markers$GWAS
##D 
##D # plot window variance proportions
##D plot(gwas$window_variance_proportion)
##D 
##D ##########################################################
##D ### Sparse Animal Model using the pedigreemm milk data ###
##D ##########################################################
##D 
##D # cpgen offers two ways of running models with random effects that
##D # are assumed to follow some covariance structure.
##D # 1) Construct the Covariance matrix and pass the cholesky of that
##D #    as design matrix for that random effect
##D # 2) Construct the inverse of the covariance matrix (ginverse) and pass the design
##D #    matrix 'Z' that relates observations to factors in ginverse in conjunction
##D #    with the symmetric ginverse.
##D 
##D # This is approach 2) which is more convenient for pedigree based
##D # animal models, as ginverse (Inverse of numerator relationship matrix) is 
##D # very sparse and can be obtained very efficiently
##D 
##D set_num_threads(1)
##D 
##D # load the data
##D data(milk)
##D 
##D # get Ainverse
##D # Ainv <- as(getAInv(pedCows),"dgCMatrix")
##D 
##D T_Inv <- as(pedCows, "sparseMatrix")
##D D_Inv <- Diagonal(x=1/Dmat(pedCows))
##D Ainv<-t(T_Inv) ##D 
##D dimnames(Ainv)[[1]]<-dimnames(Ainv)[[2]] <-pedCows@label
##D Ainv <- as(Ainv, "dgCMatrix")
##D 
##D # We need to construct the design matrix.
##D # Therefore we create a second id column with factor levels
##D # equal to the animals in the pedigree
##D milk$id2 <- factor(as.character(milk$id), levels = pedCows@label)
##D 
##D # set up the design matrix
##D Z <- sparse.model.matrix(~ -1 + id2, data = milk, drop.unused.levels=FALSE)
##D 
##D # run the model
##D niter = 5000
##D burnin = 2500
##D 
##D modAinv <- clmm(y = as.numeric(milk$milk), Z = list(Z), ginverse = list(Ainv), 
##D                 niter = niter, burnin = burnin)
##D 
##D # This is approach 1) run an equivalent model using the cholesky of A
##D 
##D # get L from A = LL'
##D L <- as(t(relfactor(pedCows)),"dgCMatrix")
##D 
##D # match with ids
##D ZL <- L[match(milk$id, pedCows@label),]
##D 
##D # run the model
##D modL <- clmm(as.numeric(milk$milk), Z= list(ZL), 
##D              niter = niter, burnin = burnin)
##D 
##D 
##D ### a more advanced model
##D 
##D # y = Xb + Zu + a + e
##D #
##D # u = permanent environment of animal
##D # a = additive genetic effect of animal
##D 
##D Zpe <- sparse.model.matrix(~ -1 + id2, drop.unused.levels = TRUE, data = milk)
##D 
##D # make X and account for lactation and herd
##D X <- sparse.model.matrix(~ 1 + lact + herd, data = milk)
##D 
##D niter = 10000
##D burnin = 2500
##D 
##D mod2 <- clmm(as.numeric(milk$milk), X = X, Z = list(Zpe,Z), ginverse = list(NULL, Ainv), 
##D                         niter = niter, burnin = burnin)
##D 
##D 
##D # run all phenotypes in the milk dataset at once in parallel
##D 
##D Y <- list(as.numeric(milk$milk),as.numeric(milk$fat),as.numeric(milk$prot),as.numeric(milk$scs))
##D 
##D set_num_threads(4)
##D 
##D # ginverse version
##D model <- clmm(Y, X = X, Z = list(Zpe,Z), ginverse = list(NULL, Ainv), 
##D               niter = niter, burnin = burnin)
##D 
##D # get heritabilities and repeatabilities with their standard deviations
##D 
##D heritabilities <- array(0, dim=c(length(Y),2))
##D colnames(heritabilities) <- c("h2","sd")
##D 
##D # only use post-burnin samples
##D range <- (burnin+1):niter
##D 
##D # h2
##D heritabilities[,1] <- unlist(lapply(model, function(x)
##D                                     mean(
##D                                          x$Effect_2$posterior$variance[range] /
##D                                          (x$Effect_1$posterior$variance[range] + 
##D                                          x$Effect_2$posterior$variance[range] + 
##D                                          x$Residual_Variance$Posterior[range]))
##D                                         )
##D                              )
##D 
##D # standard deviation of h2
##D heritabilities[,2] <- unlist(lapply(model, function(x)
##D                                     sd(
##D                                        x$Effect_2$posterior$variance[range] /
##D                                        (x$Effect_1$posterior$variance[range] + 
##D                                        x$Effect_2$posterior$variance[range] + 
##D                                        x$Residual_Variance$Posterior[range]))
##D                                       )
##D                              )
##D 
## End(Not run)



