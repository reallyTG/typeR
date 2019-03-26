library(corregp)


### Name: TSS
### Title: The Use of Inflected or Uninflected Determiners in the Belgian
###   Dutch Vernacular
### Aliases: TSS

### ** Examples

## No test: 
data(TSS)
# The execution of corregp may be slow, due to bootstrapping:  
tss.crg <- corregp(Variant ~ Register2 * Region, data = TSS, part = "Variable", b = 3000)
tss.crg
summary(tss.crg, parm = "b", add_ci = TRUE)
screeplot(tss.crg, add_ci = TRUE)
anova(tss.crg, nf = 2)
tss.col <- ifelse( xtabs(~ Variant + Inflected, data = TSS)[, 1] > 0, "blue", "red")
plot(tss.crg, x_ell = TRUE, xsub = c("Register2", "Region"), col_btm = tss.col, col_top = "black")
## End(No test)



