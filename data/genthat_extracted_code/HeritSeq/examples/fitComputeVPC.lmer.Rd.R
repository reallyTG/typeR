library(HeritSeq)


### Name: fitComputeVPC.lmer
### Title: Fit linear mixed models (LMM) and compute the VPC values for one
###   or more features.
### Aliases: fitComputeVPC.lmer

### ** Examples

## Compute VPC for the first two features under linear mixed models for Gaussian-like datasets. 

## Provide normalized data and include hypothesis testing on presence of
## heritability:
result.vst <- fitComputeVPC.lmer(simData_vst[1:2,], strains, test = TRUE)
## Extract parameters
vpc.vst <- result.vst[[1]]
## Extract p-values
pval.vst <- result.vst[[2]]

## Visulize the distribution of p-values.
hist(pval.vst, breaks = 30, col = "cyan")



