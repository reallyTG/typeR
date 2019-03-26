library(PowerTOST)


### Name: expsampleN.TOST
### Title: Sample size based on expected power
### Aliases: expsampleN.TOST

### ** Examples

# Classical 2x2 cross-over, target power = 80%,
# BE limits 80 ... 125%, assumed true BE ratio = 95%,
# intra-subject CV=30% estimated from prior 2x2 trial 
# with m = 30 subjects
expsampleN.TOST(CV=0.3, prior.parm = list(m = 30, design = "2x2"))
# -> gives n = 42 with achieved expected power 0.806262
# Compare this to the usual sample size with CV assumed known ('carved in stone')
sampleN.TOST(CV=0.3)
# -> gives n = 40 subjects
# Compare this to the case where uncertainty is accounted for CV and theta0
# Not run due to timing policy of CRAN - may run several seconds
## Not run: 
##D expsampleN.TOST(CV=0.3, prior.parm = list(m = 30, design = "2x2"), 
##D                 prior.type = "both")
## End(Not run)
# -> gives n = 72 subjects

# More than one CV with corresponding degrees of freedom 
# other settings as above in first example
CVs <- c(0.25, 0.3)
dfs <- c(22, 10)
expsampleN.TOST(CV=CVs, prior.parm = list(df = dfs))
# -> gives a pooled CV=0.2664927 with df=32
# and a sample size n=34 with achieved expected power 0.812653 exact
# achieved expected power 0.815019 approximate acc. Julious



