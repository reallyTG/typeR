library(clickR)


### Name: fix.levels
### Title: Fix levels
### Aliases: fix.levels

### ** Examples

factor1<-factor(c("Control", "Treatment", "Tretament", "Tratment", "treatment",
"teatment", "contrl", "cntrol", "CONTol", "not available", "na"))
fix.levels(factor1, k=4, plot=TRUE)   #Chose k to select matching levels
fix.levels(factor1, levels=c("Control", "Treatment"), k=4)



