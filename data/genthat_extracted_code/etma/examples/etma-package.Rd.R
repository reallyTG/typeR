library(etma)


### Name: etma-package
### Title: Epistasis Test in Meta-Analysis
### Aliases: etma-package etma
### Keywords: package

### ** Examples

#Detailed tutorial is shown in website <http://rpubs.com/chinlin/ETMA>
#The simple toy example (just test this algorithm)
#Note: the computing time in this example is about 3-5 secs

data(data.RAS)
ggint.toy=ETMA(case.ACE.0,case.ACE.1,ctrl.ACE.0,ctrl.ACE.1,
                  case.AGT.0,case.AGT.1,ctrl.AGT.0,ctrl.AGT.1,
                  data=data.RAS,iterations.step1=100,iterations.step2=300,
                  start.seed=1,show.detailed.plot=FALSE,show.final.plot=FALSE)
print(ggint.toy)
summary(ggint.toy)

#The fastest complete example (Note: the computing time in this example is about 15 mins)
#Other examples can refer the help(ETMA)
#Note: the complete example need about 20,000/200,000 learning time in step 1/2, respectively.
#
#data(data.PAH)
#ggint2=ETMA(case.CYP1A1.0,case.CYP1A1.1,ctrl.CYP1A1.0,ctrl.CYP1A1.1,
#                  case.GSTM1.0,case.GSTM1.1,ctrl.GSTM1.0,ctrl.GSTM1.1,
#                  data=data.PAH,start.seed=1,show.detailed.plot=TRUE,show.p.matrix=TRUE)
#
#print(ggint2)
#
#Epistasis Test in Meta-Analysis (ETMA)
#A MCMC algorithm for detecting gene-gene interaction in meta-analysis.
#
#This analysis include 13 studies. (df = 10)
#
#                      b      se    OR 95%ci.l 95%ci.u t value p value
#SNP1(mutation) -0.19967 0.14580 0.819   0.592   1.133 -1.3695  0.2008
#SNP2(mutation) -0.01963 0.14025 0.981   0.717   1.340 -0.1400  0.8915
#Interaction     0.79747 0.28886 2.220   1.166   4.225  2.7608  0.0201
#
#summary(ggint2)
#
#Epistasis Test in Meta-Analysis (ETMA)
#A MCMC algorithm for detecting gene-gene interaction in meta-analysis.
#
#This analysis include 13 studies. (df = 10)
#
#                      b      se    OR 95%ci.l 95%ci.u t value p value
#SNP1(mutation) -0.19967 0.14580 0.819   0.592   1.133 -1.3695  0.2008
#SNP2(mutation) -0.01963 0.14025 0.981   0.717   1.340 -0.1400  0.8915
#Interaction     0.79747 0.28886 2.220   1.166   4.225  2.7608  0.0201
#
#                                    OR 95%ci.l 95%ci.u t value p value
#SNP1(wild type) & SNP2(mutation) 0.981   0.717   1.340 -0.1400  0.8915
#SNP1(mutation) & SNP2(wild type) 0.819   0.592   1.133 -1.3695  0.2008
#SNP1(mutation) & SNP2(mutation)  1.783   1.506   2.110  7.6478 <0.0001



