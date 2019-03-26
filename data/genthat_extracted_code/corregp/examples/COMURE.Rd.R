library(corregp)


### Name: COMURE
### Title: The Use of Linguistic Variants in Translations vs.
###   Non-translations and in Six Different Registers
### Aliases: COMURE

### ** Examples

## No test: 
data(COMURE)
# The execution of corregp may be slow, due to bootstrapping:  
comure.crg <- corregp(Variant ~ Register * Language, data = COMURE, part = "Variable", b = 3000)
comure.crg
summary(comure.crg, parm = "b", add_ci = TRUE)
screeplot(comure.crg, add_ci = TRUE)
anova(comure.crg, nf = 2)
comure.col <- ifelse( xtabs(~ Variant + Variety, data = COMURE)[, "Standard"] > 0, "blue", "red")
plot(comure.crg, x_ell = TRUE, xsub = c("Register", "Language"), col_btm = comure.col, 
  col_top = "black")
## End(No test)



