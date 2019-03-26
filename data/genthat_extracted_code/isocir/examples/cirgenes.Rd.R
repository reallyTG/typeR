library(isocir)


### Name: cirgenes
### Title: A set of angular measurements from cell-cycle experiments with
###   genes.
### Aliases: cirgenes
### Keywords: datasets circular genes

### ** Examples

data(cirgenes)

# These values of kappa estimations were obtained by using the calculations
# explained in Fern?ndez et al (2012).

kappas <- c(2.64773, 3.24742, 2.15936, 4.15314, 4.54357,
               29.07610, 6.51408, 14.19445, 5.66920, 11.12889)

allresults <- list()
resultIsoCIRE <- matrix(ncol = ncol(cirgenes), nrow = nrow(cirgenes))

SCEs <- vector(mode = "numeric", length = nrow(cirgenes))
pvalues <- vector(mode = "numeric", length = nrow(cirgenes))

for (i in 1 : nrow(cirgenes)) {
    k <- kappas[i]
    genes <- as.numeric(cirgenes[i, ])
    allresults[[i]] <- cond.test(genes, groups=c(1:length(genes)), kappa = k)
    resultIsoCIRE[i, !is.na(cirgenes[i, ])] <- round(unlist(allresults[[i]]$CIRE), digits = 3)
    SCEs[i] <- allresults[[i]]$SCE
    pvalues[i] <- allresults[[i]]$pvalue
 }

# resultIsoCIRE is a matrix with the CIRE for each experiment
# pvalues is a vector with the result of the test




