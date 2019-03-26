library(matrixpls)


### Name: GSCA
### Title: Generalized structured component analysis (GSCA) weights
### Aliases: GSCA

### ** Examples

if(!require(ASGSCA)){
    print("This example requires the ASGSCA package from Bioconductor")
} else{
# Run the example from ASGSCA package using GSCA estimation

data(GenPhen)
W0 <- matrix(c(rep(1,2),rep(0,8),rep(1,2),rep(0,8),rep(1,3),rep(0,7),rep(1,2)),
             nrow=8,ncol=4)
B0 <- matrix(c(rep(0,8),rep(1,2),rep(0,3),1,rep(0,2)),nrow=4,ncol=4)

# Set seed becayse ASGSCA uses random numbers as starting values 
set.seed(1)

GSCA.res <-GSCA(GenPhen,W0, B0,estim=TRUE,path.test=FALSE, 
                 latent.names=c("Gene1","Gene2",
                                "Clinical pathway 1",
                                "Clinical pathway 2"))

# Setup matrixpls to estimate the same model. Note that ASGSCA places dependent
# variables on columns but matrixpls uses rows for dependent variables

inner <- t(B0)
formative <- t(W0)
reflective <- matrix(0,8,4)

colnames(formative) <- rownames(reflective) <- names(GenPhen)

colnames(inner) <- rownames(inner) <- 
  rownames(formative) <- colnames(reflective) <-
  c("Gene1","Gene2","Clinical pathway 1","Clinical pathway 2")

model <- list(inner = inner, 
              reflective = reflective,
              formative = formative)

# Estimate using alternating least squares

matrixpls.res1 <- matrixpls(cov(GenPhen),  model,
                            outerEstim = outerEstim.gsca,
                            innerEstim = innerEstim.gsca)

# Estimate using direct minimization of the estimation criterion
# Set the convergence criterion to be slightly stricter than normally
# to get indentical results

matrixpls.res2 <- matrixpls(cov(GenPhen),  model,
                            weightFun = weightFun.optim,
                            optimCrit = optimCrit.gsca,
                            control = list(reltol = 1e-12))

# Compare the weights

do.call(cbind,lapply(list(ASGSCA =GSCA.res[["Weight"]],
                          matrixpls_als = t(attr(matrixpls.res1,"W")),
                          matrixpls_optim =t(attr(matrixpls.res2,"W"))),
                     function(W) W[W!=0]))


# Check the criterion function values

optimCrit.gsca(matrixpls.res1)
optimCrit.gsca(matrixpls.res2)

}



