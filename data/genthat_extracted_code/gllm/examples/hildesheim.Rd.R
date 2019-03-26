library(gllm)


### Name: hildesheim
### Title: Invasive Cervical Cancer v exposure to Herpes Simplex Virus
### Aliases: hildesheim
### Keywords: datasets

### ** Examples

data(hildesheim)
ftable(xtabs(Freq ~ case+HSV.inac+HSV.gold, hildesheim))
fisher.test(xtabs(Freq ~ case+HSV.inac, hildesheim))
fisher.test(xtabs(Freq ~ case+HSV.gold, hildesheim, subset=HSV.gold!="?"))

#
# Combined analysis (ordered as incomplete then complete data)
#
y<-hildesheim$Freq[c(3,9,6,12,1,2,7,8,4,5,10,11)]
#
# Map observed table onto underlying 2x2x2x2 table
#
s <-c(1, 1, 2, 2, 3, 3, 4, 4,
      5, 6, 7, 8, 9, 10, 11, 12)
#
substudy  <- 2-as.integer(gl(2,8,16))
hsv.inac  <- 2-as.integer(gl(2,4,16))
hsv.gold  <- 2-as.integer(gl(2,2,16))
cancer    <- 2-as.integer(gl(2,1,16))

require(gllm)
res<-gllm(y,s, ~substudy+hsv.inac*hsv.gold*cancer)
print(summary.gllm(res))
#
# Bootstrap the collapsed table to get estimated OR for reliable measures
#
# a and b are binary vectors the length of the *full* table
# and define the variables for which the odds ratio is to be
# estimated, here the reliable measure of HSV exposure and Ca Cx
#
boot.hildesheim <- function (y,s,X,nrep,a,b) {
  z<-boot.gllm(y,s,X,R=nrep)
  boot.tab<-cbind(apply(z[,a & b],1,sum),
                  apply(z[,!a & b],1,sum),
                  apply(z[,a & !b],1,sum),
                  apply(z[,!a & !b],1,sum))
  oddsr<-boot.tab[,1]*boot.tab[,4]/boot.tab[,2]/boot.tab[,3] 
  hildesheim.tab<-data.frame( c("yes","yes","no","no"),
                              c("yes","no","yes","no"),
                              boot.tab[1,],
                              apply(boot.tab[2:(1+nrep),],2,sd))
  colnames(hildesheim.tab)<-c("Precise HSV","Cervical Cancer",
                            "Estimated Count","Bootstrap S.E.")
  print(hildesheim.tab)
  cat("\nEstimated OR=",oddsr[1],"\n")
  cat("        Bias=",oddsr[1]-mean(oddsr[2:(1+nrep)]),"\n")
  cat("Bootstrap SE=",sd(oddsr[2:(1+nrep)]),"\n\nQuantiles\n\n")
  print(quantile(oddsr[2:(1+nrep)],c(0.025,0.50,0.975)))

  b<-mean(log(oddsr[2:(1+nrep)]))
  se<-sd(log(oddsr[2:(1+nrep)]))
  ztest<-b/se
  cat("\n      Estimated log(OR)=",log(oddsr[1]),"\n",
      "Bootstrap mean log(OR)=",b,"\n",
      "          Bootstrap SE=",se,"\n",
      "                Wald Z=",ztest," (P=",2*pnorm(ztest,lower=FALSE),")\n")
}
boot.hildesheim(y,s,~substudy+hsv.inac*hsv.gold*cancer,nrep=50,cancer,hsv.gold)




