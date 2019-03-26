library(ludic)


### Name: RA
### Title: Anonymized binarized diagnosis codes from RA study.
### Aliases: RA RA1_6y RA2_6y RA1_11y RA2_11y silverstandard_truematches
### Keywords: datasets

### ** Examples


## Not run: 
##D  
##D rm(list=ls())
##D library(ludic)
##D data(RA)
##D res_match_6y <- recordLink(data1 = RA1_6y, data2 = RA2_6y, 
##D                           eps_plus = 0.01, eps_minus = 0.01,
##D                           aggreg_2ways ="mean",
##D                           min_prev = 0,
##D                           use_diff = FALSE)
##D 
##D res_match_11y <- recordLink(data1 = RA1_11y, data2 = RA2_11y, 
##D                            eps_plus = 0.01, eps_minus = 0.01,
##D                            aggreg_2ways ="mean",
##D                            min_prev = 0,
##D                            use_diff = FALSE)
##D 
##D 
##D print.res_matching <- function(res, threshold=0.9, ref=silverstandard_truematches){
##D  have_match_row <- rowSums(res>threshold)
##D  have_match_col <- colSums(res>threshold)
##D  bestmatched_pairs_all <- cbind.data.frame(
##D    "D1"=rownames(res)[apply(res[,which(have_match_col>0), drop=FALSE], 2, which.max)],
##D    "D2"=names(have_match_col)[which(have_match_col>0)]
##D  )
##D  nTM_all <- nrow(ref)
##D  nP_all <- nrow(bestmatched_pairs_all)
##D  TPR_all <- sum(apply(bestmatched_pairs_all, 1, paste0, collapse="") 
##D                 %in% apply(ref, 1, paste0, collapse=""))/nTM_all
##D  PPV_all <- sum(apply(bestmatched_pairs_all, 1, paste0, collapse="") 
##D                 %in% apply(ref, 1, paste0, collapse=""))/nP_all
##D  cat("threshold: ", threshold, 
##D      "\nnb matched: ", nP_all,"; nb true matches: ", nTM_all, 
##D      "\nTPR: ", TPR_all, ";   PPV: ", PPV_all, "\n\n", sep="")
##D }
##D print.res_matching(res_match_6y)
##D print.res_matching(res_match_11y)
##D 
## End(Not run)




