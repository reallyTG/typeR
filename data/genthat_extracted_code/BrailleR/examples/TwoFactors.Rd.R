library(BrailleR)


### Name: TwoFactors
### Title: A convenience function for a two-way analysis
### Aliases: TwoFactors
### Keywords: ~kwd1 ~kwd2

### ** Examples

TG <- ToothGrowth
TG$dose <- as.factor(TG$dose)

# Without interaction
TwoFactors('len','supp','dose',Data=TG, Inter=FALSE)

# With two-way interaction
TwoFactors('len', 'supp', 'dose', Data=TG, Inter=TRUE)

# For unbalanced data
TG_Unb <- TG[-c(53:60),]
TwoFactors('len', 'supp', 'dose', Data=TG_Unb, Inter=TRUE)
rm(TG); rm(TG_Unb)



