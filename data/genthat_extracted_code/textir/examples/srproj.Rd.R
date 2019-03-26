library(textir)


### Name: srproj
### Title: Multinomial Inverse Regression (MNIR)
### Aliases: mnlm srproj

### ** Examples


### Ripley's Cushing Data; see help(Cushings) ###
library(MASS)
data(Cushings)
Cushings[,1:2] <- log(Cushings[,1:2])
train <- Cushings[Cushings$Type!="u",]
newdata <- as.matrix(Cushings[Cushings$Type == "u", 1:2])

## fit, coefficients, predict, and plot

# you could replace 'mnlm' with 'dmr' here.
fit <- mnlm(NULL, 
  covars=train[,1:2], 
  counts=factor(train$Type))

## dmr applies corrected AICc selection by default
round(coef(fit),1) 
round(predict(fit, newdata, type="response"),1)
par(mfrow=c(1,3))
for(j in c("a","b","c")){ 
  plot(fit[[j]]); mtext(j,line=2) }

## see we8there and congress109 for MNIR and srproj examples
 



