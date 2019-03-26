library(PowerTOST)


### Name: expsampleN.noninf
### Title: Sample size based on expected power for the non-inferiority test
### Aliases: expsampleN.noninf

### ** Examples

# Classical 2x2 cross-over, target power = 80%,
# assumed true ratio = 95%, margin = 0.8,
# intra-subject CV=30% estimated from prior 2x2 trial 
# with m = 12 subjects
expsampleN.noninf(theta0 = 0.95, margin = 0.8, CV = 0.3, design = "2x2",
                  prior.parm = list(m = 12, design = "2x2"))
# gives n = 58 with achieved expected power 0.809148 
# Compare this to the usual sample size with CV assumed
# as 'carved in stone'
sampleN.noninf(theta0 = 0.95, margin = 0.8, CV=0.3)

# Perform 'non-superiority' (lower is better) with assumed
# true ratio = 105% and margin 125%
expsampleN.noninf(theta0 = 1.05, margin = 1.25, CV = 0.3, design = "2x2",
                  prior.parm = list(m = 12, design = "2x2"))
# should give n = 56 with achieved expected power 0.806862

# More than one CV with corresponding degrees of freedom 
# other settings as above in first example
CVs <- c(0.25, 0.3)
dfs <- c(22, 10)
expsampleN.noninf(theta0 = 0.95, margin = 0.8, CV = CVs, 
                  prior.parm = list(df = dfs))
# should give a pooled CV=0.2664927 with 32 df and a sample
# size n=42 with achieved expected power 0.814073 exact
# achieved expected power 0.816163 approximate acc. to Julious

# Uncertainty is accounted for CV and theta0
## Not run: 
##D expsampleN.noninf(CV=0.3, prior.type = "both",
##D                   prior.parm = list(m = 12, design = "2x2"))
##D # gives a dramatic increase in sample size (n = 194)
##D # due to small pilot trial
## End(Not run)



