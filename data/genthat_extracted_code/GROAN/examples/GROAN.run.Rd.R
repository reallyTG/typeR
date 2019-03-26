library(GROAN)


### Name: GROAN.run
### Title: Compare Genomic Regressors on a Noisy Dataset
### Aliases: GROAN.run

### ** Examples

## Not run: 
##D #Complete examples are found in the vignette
##D vignette('GROAN.vignette', package='GROAN')
##D 
##D #Minimal example
##D #1) creating a noisy dataset with normal noise
##D nds = createNoisyDataset(
##D   name = 'PEA KI, normal noise',
##D   genotypes = GROAN.KI$SNPs,
##D   phenotypes = GROAN.KI$yield,
##D   noiseInjector = noiseInjector.norm,
##D   mean = 0,
##D   sd = sd(GROAN.KI$yield) * 0.5
##D )
##D 
##D #2) creating a GROAN.WorkBench using default regressor and crossvalidation preset
##D wb = createWorkbench()
##D 
##D #3) running the experiment
##D res = GROAN.run(nds, wb)
##D 
##D #4) examining results
##D summary(res)
##D plotResult(res)
## End(Not run)



