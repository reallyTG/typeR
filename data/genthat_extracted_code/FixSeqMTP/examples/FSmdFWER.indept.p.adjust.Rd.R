library(FixSeqMTP)


### Name: FSmdFWER.indept.p.adjust
### Title: Adjusted P-values for Fixed Sequence mdFWER Controlling
###   Procedure under Independence Along with Directional Decisions
###   Regarding Parameters of Interest
### Aliases: FSmdFWER.indept.p.adjust

### ** Examples

## Clinical trial example in Grandhi et al. (2015)
Pval <- c(0.0008, 0.0135, 0.0197, 0.7237, 0.0003, 0.2779, 0.0054, 0.8473)
Zstat <- c(3.4434, 2.5085, 2.3642, -0.3543, 3.7651, 1.0900, 2.8340, 0.1930)
FSmdFWER.indept.p.adjust(p = Pval, test.stat = Zstat, make.decision = TRUE)



