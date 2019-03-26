library(pathmox)


### Name: pathmox
### Title: PATHMOX Approach: Segmentation Trees in Partial Least Squares
###   Path Modeling
### Aliases: fix.pathmox pathmox

### ** Examples

## Not run: 
##D  ## example of PLS-PM in customer satisfaction analysis
##D  ## model with seven LVs and reflective indicators
##D  data(csimobile)
##D 
##D  # select manifest variables
##D  data_mobile = csimobile[,8:33]
##D 
##D  # define path matrix (inner model)
##D  IMAG = c(0, 0, 0, 0, 0, 0, 0)
##D  EXPE = c(1, 0, 0, 0, 0, 0, 0)
##D  QUAL = c(0, 1, 0, 0, 0, 0, 0)
##D  VAL = c(0, 1, 1, 0, 0, 0, 0)
##D  SAT = c(1, 1, 1, 1, 0, 0, 0)
##D  COM = c(0, 0, 0, 0, 1, 0, 0)
##D  LOY = c(1, 0, 0, 0, 1, 1, 0)
##D  mob_path = rbind(IMAG, EXPE, QUAL, VAL, SAT, COM, LOY)
##D 
##D  # blocks of indicators (outer model)
##D  mob_blocks = list(1:5, 6:9, 10:15, 16:18, 19:21, 22:24, 25:26)
##D  mob_modes = rep("A", 7)
##D 
##D  # apply plspm
##D  mob_pls = plspm(data_mobile, mob_path, mob_blocks, modes = mob_modes,
##D                  scheme="factor", scaled=FALSE)
##D 
##D  # re-ordering those segmentation variables with ordinal scale
##D  # (Age and Education)
##D  csimobile$Education = factor(csimobile$Education,
##D      levels=c("basic","highschool","university"),
##D      ordered=TRUE)
##D 
##D  # select the segmentation variables
##D  seg_vars = csimobile[,1:7]
##D 
##D  # Pathmox Analysis
##D  mob_pathmox = pathmox(mob_pls, seg_vars, signif=.10, size=.10, deep=2)
##D  
## End(Not run)



