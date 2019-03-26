library(NAM)


### Name: MLM Trials
### Title: Genomic mixed model
### Aliases: gmm
### Keywords: BLUP BGS GRM SPATIAL

### ** Examples


# For a demo with wulti-environmental trial type:
# demo(fittingMET)

# Checking heritability
data(tpod)
fit = gmm(y,gen,model = 'BRR')
fit$Vg*fit$cxx / (fit$Vg*fit$cxx+fit$Ve)




