library(LPKsample)


### Name: GLP
### Title: A function to perform K-sample test using GLP algorithm
### Aliases: GLP graph.clust.test
### Keywords: GLP main function

### ** Examples



  ##1.muiltivariate normal distribution with only mean difference:
  ##generate data, n1=n2=10, dimension 25
   X1<-matrix(rnorm(250,mean=0,sd=1),10,25)
   X2<-matrix(rnorm(250,mean=0.5,sd=1),10,25)
   y<-c(rep(1,10),rep(2,10))
   X<-rbind(X1,X2)
  ##GLP test:
   locdiff.test<-GLP(X,y,m.max=4)

  ## Not run: 
##D   ##2.Leukemia data example
##D    data(leukemia)
##D    attach(leukemia)
##D    leukemia.test<-GLP(X,class,components=1:4)
##D   ##confirmatory results:
##D    leukemia.test$GLP  # overall statistic
##D    #[1] 0.2092378
##D    leukemia.test$pval # overall p-value
##D    #[1] 0.0001038647
##D   ##exploratory outputs:
##D    leukemia.test$table  # rows as shown in Table 3 of reference
##D    #     component    comp.GLP       pvalue
##D    #[1,]         1 0.209237826 0.0001038647
##D    #[2,]         2 0.022145514 0.2066876581
##D    #[3,]         3 0.002025545 0.7025436476
##D    #[4,]         4 0.033361702 0.1211769396
##D   
## End(Not run)



