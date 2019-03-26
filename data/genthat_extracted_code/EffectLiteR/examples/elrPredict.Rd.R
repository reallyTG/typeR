library(EffectLiteR)


### Name: elrPredict
### Title: Predict Conditional Effects
### Aliases: elrPredict

### ** Examples

m1 <- effectLite(y="dv", z=c("z1"), k=c("k1","kateg2"), x="x", 
control="control", data=example01)
newdata <- data.frame(k1="male", kateg2="1", z1=2)
elrPredict(m1, newdata)



