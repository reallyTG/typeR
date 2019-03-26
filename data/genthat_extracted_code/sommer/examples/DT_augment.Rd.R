library(sommer)


### Name: DT_augment
### Title: DT_augment design example.
### Aliases: DT_augment
### Keywords: datasets

### ** Examples

####=========================================####
#### AUGMENTED DESIGN EXAMPLE
####=========================================####
# data(DT_augment)
# DT_augment <- DT
# head(DT_augment)
# ####=========================================####
# #### fit the mixed model and check summary
# ####=========================================####
# mix1 <- mmer(TSW ~ Check.Gen, 
#              random = ~ Block + Genotype:Check, 
#              data=DT_augment)
# summary(mix1)
# blup <- mix1$U$`Genotype:Check`$TSW
# blup




