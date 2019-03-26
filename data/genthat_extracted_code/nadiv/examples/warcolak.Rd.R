library(nadiv)


### Name: warcolak
### Title: Pedigree and phenotypic values for a mythical population of
###   Warcolaks
### Aliases: warcolak
### Keywords: datasets

### ** Examples


 ## Not run: 
##D   rm(list = ls())
##D   set.seed(101)
##D   library(nadiv)
##D   # create pedigree
##D   warcolak <- simPedDFC(F = 75, gpn = 4, fsn = 4, s = 2)
##D   names(warcolak)[1:3] <- c("ID", "Dam", "Sire")
##D   warcolak$trait2 <- warcolak$trait1 <- NA
##D 
##D   # Define covariance matrices for random effects:
##D   ## Autosomal additive genetic (trait1)
##D   Ga_t1 <- matrix(c(0.4, rep(0.399999, 2), 0.4), 2, 2)
##D   ## Autosomal additive genetic (trait2)
##D   Ga_t2 <- matrix(c(0.3, rep(0.299999, 2), 0.3), 2, 2)
##D   ## Sex-chromosomal additive genetic (trait2)
##D   Gs_t2 <- matrix(c(0.1, rep(0.099999, 2), 0.1), 2, 2)
##D   ## Autosomal dominance genetic
##D   Gd <- matrix(c(0.3, rep(0.299999, 2), 0.3), 2, 2)
##D   ## Environmental (or residual)
##D   ### Assumes no correlated environmental effects between sexes
##D   R <- diag(c(0.3, 0.3))
##D 
##D   ## define variables to be re-used
##D   pedn <- nrow(warcolak)
##D   # Female (homogametic sex chromosomes) in first column
##D   # Male (heterogametic sex chromosomes) in second column
##D   sexcol <- as.integer(warcolak$sex)
##D 
##D   # Create random effects
##D   ## Additive genetic
##D   ### trait1 autosomal
##D   tmp_a <- grfx(pedn, G = Ga_t1, incidence = makeA(warcolak[, 1:3]))
##D     var(tmp_a)
##D   warcolak$t1_a <- tmp_a[cbind(seq(pedn), sexcol)]
##D   ### trait2 autosomal
##D   tmp_a <- grfx(pedn, G = Ga_t2, incidence = makeA(warcolak[, 1:3]))
##D     var(tmp_a)
##D   warcolak$t2_a <- tmp_a[cbind(seq(pedn), sexcol)]
##D   ### trait2 sex-chromosomal
##D   tmp_s <- grfx(pedn, G = Gs_t2, incidence = makeS(warcolak[, 1:4],
##D 	heterogametic = "M", DosageComp = "ngdc", returnS = TRUE)$S)
##D     matrix(c(var(tmp_s[which(sexcol == 1), 1]),
##D 	rep(cov(tmp_s), 2), var(tmp_s[which(sexcol == 2), 2])), 2, 2)
##D     # NOTE above should be: covar = male var = 0.5* female var 
##D   warcolak$t2_s <- tmp_s[cbind(seq(pedn), sexcol)]
##D 
##D   ## Dominance genetic
##D   ### trait1 
##D   tmp_d <- grfx(pedn, G = Gd, incidence = makeD(warcolak[, 1:3], invertD = FALSE)$D)
##D     var(tmp_d)
##D   warcolak$t1_d <- tmp_d[cbind(seq(pedn), sexcol)]
##D   ### trait2
##D   tmp_d <- grfx(pedn, G = Gd, incidence = makeD(warcolak[, 1:3], invertD = FALSE)$D)
##D     var(tmp_d)
##D   warcolak$t2_d <- tmp_d[cbind(seq(pedn), sexcol)]
##D 
##D   ## Residual
##D   ### trait1
##D   tmp_r <- grfx(pedn, G = R, incidence = NULL) # warning of identity matrix
##D     var(tmp_r)
##D   warcolak$t1_r <- tmp_r[cbind(seq(pedn), sexcol)]
##D   ### trait2
##D   tmp_r <- grfx(pedn, G = R, incidence = NULL) # warning of identity matrix
##D     var(tmp_r)
##D   warcolak$t2_r <- tmp_r[cbind(seq(pedn), sexcol)]
##D 
##D   # Sum random effects and add sex-specific means to get phenotypes
##D   ## females have slightly greater mean trait values
##D   warcolak$trait1 <- 1 + (-1*sexcol + 2) + rowSums(warcolak[, c("t1_a", "t1_d", "t1_r")])
##D   warcolak$trait2 <- 1 + (-1*sexcol + 2) + rowSums(warcolak[, c("t2_a", "t2_s", "t2_d", "t2_r")])
##D  
## End(Not run)




