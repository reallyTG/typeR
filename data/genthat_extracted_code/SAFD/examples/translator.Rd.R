library(SAFD)


### Name: translator
### Title: Translator
### Aliases: translator
### Keywords: attribute classes

### ** Examples

#Example 1:
X<-data.frame(x=c(-2,-0.75,-0.25,0.5,1),alpha=c(0,0.6,1,1,0))
E<-translator(X,3)
E


#Example 2:
data(XX)
E<-translator(XX[[3]],11, pic=1)
E



