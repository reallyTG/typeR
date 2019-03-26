library(NSM3)


### Name: pNWWM
### Title: Nemenyi, Wilcoxon-Wilcox, Miller
### Aliases: pNWWM
### Keywords: Nemenyi Wilcoxon-Wilcox Miller

### ** Examples

##Hollander-Wolfe-Chicken Example 7.4 Stuttering Adaptation
adaptation.scores<-matrix(c(57,59,44,51,43,49,48,56,44,50,44,50,70,42,58,54,38,48,38,48,50,53,53,
56,37,58,44,50,58,48,60,58,60,38,48,56,51,56,44,44,50,54,50,40,50,50,56,46,74,57,74,48,48,44),
ncol=3,dimnames = list(1 : 18,c("No Shock", "Shock Following", "Shock During")))

#pNWWM(adaptation.scores)
pNWWM(adaptation.scores,n.mc=2500)




