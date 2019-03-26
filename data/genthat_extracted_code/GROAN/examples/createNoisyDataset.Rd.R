library(GROAN)


### Name: createNoisyDataset
### Title: Noisy Data Set Constructor
### Aliases: createNoisyDataset

### ** Examples

#For more complete examples see the package vignette
#creating a noisy dataset with normal noise
nds = createNoisyDataset(
  name = 'PEA, normal noise',
  genotypes = GROAN.KI$SNPs,
  phenotypes = GROAN.KI$yield,
  noiseInjector = noiseInjector.norm,
  mean = 0,
  sd = sd(GROAN.KI$yield) * 0.5
)



