library(Sleuth2)


### Name: case1401
### Title: Chimp Learning Times
### Aliases: case1401
### Keywords: datasets

### ** Examples

str(case1401)

fitadditive <- aov(Minutes ~ Chimp + Sign, case1401)
# Residual plot indicates a transformation may help
plot(fitadditive) 

fitadditive <- aov(log(Minutes) ~ Chimp + Sign, case1401)
# No problems are indicated by residual plot
plot(fitadditive) 
anova(fitadditive)

# Tukey multiple comparisons of sign differences
mcSign <- TukeyHSD(fitadditive,"Sign")  
mcSign
plot(mcSign)
mcChimp <- TukeyHSD(fitadditive,"Chimp")
mcChimp
par(cex=.7)
plot(mcChimp)



