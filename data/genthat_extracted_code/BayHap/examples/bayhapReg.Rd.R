library(BayHap)


### Name: bayhapReg
### Title: Bayesian analysis of haplotype association using Markov Chain
###   Monte Carlo
### Aliases: bayhapReg print.reg

### ** Examples


##quantitative response (linear regression model) with prior values 
##for some haplotype frequencies:

snp1<-c("C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C",
"C/C","C/T", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", 
"C/C","C/C", "C/C", "C/C", "C/T", "C/C", "C/C", "C/C", "C/C", 
"C/C","C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", 
"C/C","C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", "C/C", 
"C/C","C/C", "C/C", "C/C", "C/C", "C/C")

snp2<-c("G/G", "G/G", "G/G", "G/G", "G/G", "G/G", "G/G", "G/G",
"G/G","G/G", "G/G", "G/G", "G/G", "A/G", "G/G", "G/G", "G/G", 
"G/G","G/G", "G/G", "G/G", "G/G", "G/G", "G/G", "A/G", "G/G", 
"G/G","G/G", "G/G", "G/G", "G/G", "G/G", "A/G", "G/G", "G/G", 
"G/G","G/G", "G/G", "G/G", "G/G", "G/G", "G/G", "G/G", "G/G", 
"G/G","G/G", "G/G", "G/G", "G/G", "G/G")

covariate<-c(1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1,
1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
1, 1, 1, 0, 0, 0, 0, 0, 0)


response.q<-c(-0.3566, 0.4999, 0.9204, 0.8139, 1.8662, -0.4734, -0.7104,
-1.5904, -0.4367, 1.4043, 0.2683, 0.2324, 0.0217, 0.527, -2.2662,
0.1757, 0.378, 0.5139, -0.5167, -0.6913, 0.3385, -0.1095, -1.293,
1.7752, -1.4137, -0.502, -0.2889, -0.9809, -1.2051, -0.4104,
0.1964, -0.5435, 1.7636, 0.6596, 0.767, -0.4716, 1.1389, 0.8475,
-0.0428, 0.5691, 1.4069, -0.7324, 1.8495, -1.4328, 0.8782, -0.2168,
-0.006, 0.0517, 0.5135, 0.7965)                                    

data.orig<-data.frame(snp1,snp2,covariate,response.q)

data<-setupData(data.orig,snps.name=c("snp1","snp2"),sep="/")

#before the execution of bayhapReg, execute bayhapFreq to have labels for each 
#haplotype in the genotypes sample.

res.freq<-bayhapFreq(data=data,na.snp.action="keep",col.snps=1:2,sep="/",
                     total.iter.haplo=10000)

#res.freq, do not execute this!

# Haplotypes snp1 snp2    Freq Std.error     ICL     ICU
#    haplo.1    T    G 0.02473   0.01282 0.00297 0.05328
#    haplo.2    C    A 0.03602   0.01437 0.00624 0.06949
#    haplo.3    T    A 0.00000   0.00001 0.00000 0.00582
#    haplo.4    C    G 0.93924   0.02010 0.89985 0.98457

#From this object of class "freq" haplotype labels can be extracted for hap.prior, 
#and then the prior values of the coefficients for the haplotypes chosen by the user 
#and its standard deviation must be introduced.


#Put the word "haplotypes" in the formula. Model with interaction and with prior 
#information.


res.q<-bayhapReg(formula=response.q~haplotypes+haplotypes*covariate,data=data,
                 family="gaussian",t.model="additive",na.snp.action="keep",
                 freqmin=0.01,burn.in.haplo=5000,burn.in.pheno=5000,
                 total.iter=5000,devhaplo=0.1,dist=1,lag.number=10,
                 sign=0.05,file=TRUE,prior.val=haplo.prior(res=res.freq,
                 haplos.name=c("haplo.1","haplo.2"),coeff=c(1.1,0.8),
                 sd.coeff=c(0.9,0.5)),verbose=2)




