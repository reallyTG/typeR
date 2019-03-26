library(mi)


### Name: 06pool
### Title: Estimate a Model Pooling Over the Imputed Datasets
### Aliases: 06pool pool pooled-class pooled-methods display,pooled-method
### Keywords: regression AimedAtUseRs

### ** Examples

if(!exists("imputations", env = .GlobalEnv)) {
  imputations <- mi:::imputations # cached from example("mi-package")
}
analysis <- pool(ppvtr.36 ~ first + b.marr + income + momage + momed + momrace, 
                 data = imputations)
display(analysis)



