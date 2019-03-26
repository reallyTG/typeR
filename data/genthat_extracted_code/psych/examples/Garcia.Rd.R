library(psych)


### Name: Garcia
### Title: Data from the sexism (protest) study of Garcia, Schmitt,
###   Branscome, and Ellemers (2010)
### Aliases: Garcia protest GSBE
### Keywords: datasets

### ** Examples

data(GSBE)  #alias to Garcia data set
par(mfrow=c(2,1)) 
#compare two models  (bootstrapping n.iter set to 50 for speed
# 1) mean center the variables prior to taking product terms
mediate(respappr ~ prot2 * sexism +(sexism),data=Garcia,n.iter=50
 ,main="Moderated mediation (mean centered)")
# 2) do not mean center
mediate(respappr ~ prot2 * sexism +(sexism),data=Garcia,zero=FALSE, n.iter=50,   
    main="Moderated  mediation (not centered")
par(mfrow=c(1,1))
#demonstrate interaction plots
plot(respappr ~ sexism, pch = 23- protest, bg = c("black","red", "blue")[protest], 
data=Garcia, main = "Response to sexism varies as type of protest")
by(Garcia,Garcia$protest, function(x) abline(lm(respappr ~ sexism,
   data =x),lty=c("solid","dashed","dotted")[x$protest+1])) 
text(6.5,3.5,"No protest")
text(3,3.9,"Individual")
text(3,5.2,"Collective")




