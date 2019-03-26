library(bqtl)


### Name: bqtl
### Title: Bayesian QTL Model Fitting
### Aliases: bqtl
### Keywords: regression

### ** Examples


data(little.ana.bc )                        # load  BC1 dataset

loglik( bqtl( bc.phenotype ~ 1, little.ana.bc ) ) #null loglikelihood
                                                  #on chr 1 near cM 25
loglik(bqtl(bc.phenotype~locus(chromo=1,cM=25),little.ana.bc))

little.bqtl <-                              # two genes with epistasis
   bqtl(bc.phenotype ~ m.12 * m.24, little.ana.bc)
summary(little.bqtl)

several.epi <-                              # 20 epistatic models
    bqtl( bc.phenotype ~ m.12 * locus(31:50), little.ana.bc)
several.main <-                             # main effects only
    bqtl( bc.phenotype ~ m.12 + locus(31:50), little.ana.bc)

max.loglik <- max( loglik(several.epi) - loglik(several.main) )

round(
     c( Chi.Square=2*max.loglik, df=1, p.value=1-pchisq(2*max.loglik,1))
      ,2)

five.gene <-                                 ## a five gene model
  bqtl( bc.phenotype ~ locus( 12, 32, 44, 22, 76 ), little.ana.bc , return.hess=TRUE )

regr.coef.table <- summary(five.gene)$coefficients

round( regr.coef.table[,"Value"] +  # coefs inside 95% CI
          qnorm(0.025) * regr.coef.table[,"Std.Err"] %o%
            c("Lower CI"=1,"Estimate"=0,"Upper CI"=-1),3)


## Don't show: 
 rm(five.gene,little.ana.bc,little.bqtl,max.loglik,
              regr.coef.table,several.epi,several.main) 
## End(Don't show)



