library(EMSaov)


### Name: EMSanova
### Title: Calculate ANOVA table with EMS
### Aliases: EMSanova

### ** Examples

data(baseball)
anova.result<-EMSanova(velocity~Group+Subject+test,data=baseball,
                 type=c("F","R","F"),
                 nested=c(NA,"Group",NA),
                 level=c(1,1,2))
anova.result                  



