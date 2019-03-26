library(KenSyn)


### Name: citrus
### Title: Meta-analysis dataset: estimation the effectiveness of a
###   fungicidal treatment to control Phyllosticta citricarpa, a citrus
###   fungus
### Aliases: citrus

### ** Examples

summary(citrus)
citrus$P_C<-citrus$NbDiseasedF[citrus$Fung_Gp==0]/citrus$NbFruits[citrus$Fung_Gp==0]
citrus$P_E<-citrus$NbDiseasedF[citrus$Fung_Gp==1]/citrus$NbFruits[citrus$Fung_Gp==1]
citrus=citrus[order(citrus$P_E),]
dotchart(citrus$P_E, xlab="Proportion of disease fruits",xlim=c(0,1),pch=19, ylab="experiment")
points(citrus$P_C,1:nrow(citrus))
legend("topleft",legend = c("treated", "control"),pch=c(19,1))



