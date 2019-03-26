library(gllm)


### Name: boot.gllm
### Title: Bootstrap for generalized log-linear modelling
### Aliases: boot.gllm
### Keywords: category models

### ** Examples
 
#
# Fit Hochberg 1977 double sampling data
# 2x2 table of imprecise measures and 2x2x2x2 reliability data
#
# 2x2 table of imprecise measures
#
y1 <-c(1196, 13562,
       7151, 58175)
a2<- 2-as.integer(gl(2,1,4))
b2<- 2-as.integer(gl(2,2,4))
set1<-data.frame(y1,a2,b2)
#
# 2x2x2x2 reliability data
#
y2<-c(17, 3,   10, 258,
       3, 4,    4,  25,
      16, 3,   25, 197,
     100, 13, 107, 1014)

a <- 2-as.integer(gl(2,1,16))
a2<- 2-as.integer(gl(2,2,16))
b <- 2-as.integer(gl(2,4,16))
b2<- 2-as.integer(gl(2,8,16))

set2<-data.frame(y2,a,a2,b,b2)
#
# Combined analysis
#
y<-c(y1,y2)
#
# Map observed table onto underlying 2x2x2x2x2 table
#
s <-c(1, 1, 2, 2, 1, 1, 2, 2, 3, 3, 4, 4, 3, 3, 4, 4,
      5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
#
# Model combining the tables is A*A2*B*B2 + L (dummy study variable)
#
a <- 2-as.integer(gl(2,1,32))
a2<- 2-as.integer(gl(2,2,32))
b <- 2-as.integer(gl(2,4,32))
b2<- 2-as.integer(gl(2,8,32))
l <- 2-as.integer(gl(2,16,32))

X <- model.matrix( ~ a*a2*b*b2+l)

#
# Table 1 using unreliable measure
#
res1<-glm(y1 ~ a2*b2, family=poisson(),data=set1)
print(summary(res1))
#
# Table 2 using reliable measure
#
res2a<-glm(y2 ~ a*b, family=poisson(),data=set2)
print(summary(res2a))
#
# Table 2 demonstrating complex relationship between gold standard and
# unreliable measure
#
res2b<-glm(y2 ~ a*a2*b*b2, family=poisson(),data=set2)
print(summary(res2b))
#
# Combined analysis
#
require(gllm)
res12<-gllm(y,s,X)
print(summary.gllm(res12))
#
# Bootstrap the collapsed table to get estimated OR for reliable measures
#
# a and b are binary vectors the length of the *full* table
# and define the variables for which the odds ratio is to be
# estimated, here the reliable measure of injury and seatbelt usage.
#
boot.hochberg <- function (y,s,X,nrep,a,b) {
  z<-boot.gllm(y,s,X,R=nrep)
  boot.tab<-cbind(apply(z[,a & b],1,sum),
                  apply(z[,!a & b],1,sum),
                  apply(z[,a & !b],1,sum),
                  apply(z[,!a & !b],1,sum))
  oddsr<-boot.tab[,1]*boot.tab[,4]/boot.tab[,2]/boot.tab[,3] 
  hochberg.tab<-data.frame( c("yes","yes","no","no"),
                            c("yes","no","yes","no"),
                            boot.tab[1,],
                            apply(boot.tab[2:(1+nrep),],2,sd))
  colnames(hochberg.tab)<-c("Precise Injury","Precise seatbelt usage",
                            "Estimated Count","Bootstrap S.E.")
  print(hochberg.tab)
  cat("\nEstimated OR=",oddsr[1],"\n")
  cat("        Bias=",oddsr[1]-mean(oddsr[2:(1+nrep)]),"\n")
  cat("Bootstrap SE=",sd(oddsr[2:(1+nrep)]),"\n\nQuantiles\n\n")
  quantile(oddsr[2:(1+nrep)],c(0.025,0.50,0.975))
}
boot.hochberg(y,s,X,nrep=20,a,b)



