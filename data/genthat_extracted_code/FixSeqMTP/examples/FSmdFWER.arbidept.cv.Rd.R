library(FixSeqMTP)


### Name: FSmdFWER.arbidept.cv
### Title: Critical values for Fixed Sequence mdFWER Controlling Procedure
###   under Arbitrary Dependence Along with Directional Decisions Regarding
###   Parameters of Interest
### Aliases: FSmdFWER.arbidept.cv

### ** Examples

## Clinical trial example in Grandhi et al. (2016)
Pval <- c(0.0008, 0.0135, 0.0197, 0.7237, 0.0003, 0.2779, 0.0054, 0.8473)
Zstat <- c(3.4434, 2.5085, 2.3642, -0.3543, 3.7651, 1.0900, 2.8340, 0.1930)
FSmdFWER.arbidept.cv(p = Pval, test.stat = Zstat, make.decision = TRUE)



