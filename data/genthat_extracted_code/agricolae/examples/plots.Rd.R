library(agricolae)


### Name: plots
### Title: Data for an analysis in split-plot
### Aliases: plots
### Keywords: datasets

### ** Examples

library(agricolae)
data(plots)
str(plots)
plots[,1] <-as.factor(plots[,1])
# split-plot analysis
model <- aov(yield ~ block + A + Error(plot)+ B + A:B, data=plots)
summary(model)
b<-nlevels(plots$B)
a<-nlevels(plots$A)
r<-nlevels(plots$block)
dfa <- df.residual(model$plot)
Ea <-deviance(model$plot)/dfa
dfb <- df.residual(model$Within)
Eb <-deviance(model$Within)/dfb
Eab <- (Ea +(b-1)*Eb)/(b*r)
# Satterthwaite
dfab<-(Ea +(b-1)*Eb)^2/(Ea^2/dfa +((b-1)*Eb)^2/dfb)
# Comparison A, A(b1), A(b2), A(b3)
comparison1 <-with(plots,LSD.test(yield,A,dfa,Ea))
comparison2 <-with(plots,LSD.test(yield[B=="b1"],A[B=="b1"],dfab,Eab))
comparison3 <-with(plots,LSD.test(yield[B=="b2"],A[B=="b2"],dfab,Eab))
comparison4 <-with(plots,LSD.test(yield[B=="b3"],A[B=="b3"],dfab,Eab))
# Comparison B, B(a1), B(a2)
comparison5 <-with(plots,LSD.test(yield,B,dfb,Eb))
comparison6 <-with(plots,LSD.test(yield[A=="a1"],B[A=="a1"],dfb,Eb))
comparison7 <-with(plots,LSD.test(yield[A=="a2"],B[A=="a2"],dfb,Eb))



