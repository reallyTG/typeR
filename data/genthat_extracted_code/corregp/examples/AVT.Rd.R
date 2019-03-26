library(corregp)


### Name: AVT
### Title: The Use of Linguistic Variants in Audio-Visual Translation
###   (Subtitles)
### Aliases: AVT

### ** Examples

## No test: 
data(AVT)
# The execution of corregp may be slow, due to bootstrapping:  
avt.crg <- corregp(Variant ~ Speaker * Language * Genre, data = AVT, part = "Variable", b = 3000)
avt.crg
summary(avt.crg, parm = "b", add_ci = TRUE)
screeplot(avt.crg, add_ci = TRUE)
anova(avt.crg, nf = 2)
avt.col <- ifelse( xtabs(~ Variant + Variety, data = AVT)[, "Standard"] > 0, "blue", "red")
plot(avt.crg, x_ell = TRUE, xsub = c("Speaker", "Language", "Genre"), col_btm = avt.col, 
  col_top = "black")
## End(No test)



