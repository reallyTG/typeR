library(revengc)


### Name: reweight.contingencytable
### Title: Reweighting a contingency table
### Aliases: reweight.contingencytable

### ** Examples

## going through the coding step of rec ##

# first create contingency table 
contingencytable<-matrix(1:9, 
                         nrow = 3, ncol = 3)
rowmarginal<-apply(contingencytable,1,sum)
contingencytable<-cbind(contingencytable, rowmarginal)
colmarginal<-apply(contingencytable,2,sum)
contingencytable<-rbind(contingencytable, colmarginal)
row.names(contingencytable)[row.names(contingencytable)=="colmarginal"]<-""
contingencytable<-data.frame(c("<5", "5I9", ">9", NA), contingencytable)
colnames(contingencytable)<-c(NA,"<=19","20-30",">=31", NA)

# provided upper and lower bound values for table
# X=row and Y=column
Xlowerbound=1
Xupperbound=15
Ylowerbound=15
Yupperbound=35

# table of row marginals provides average x and phi x
row.marginal.table<-row.marginal(contingencytable)
x<-cnbinom.pars(row.marginal.table)
# table of column marginals provides average y and phi y 
column.marginal.table<-column.marginal(contingencytable)
y<-cnbinom.pars(column.marginal.table)

# create row and column ranges   
rowrange<-Xlowerbound:Xupperbound
colrange<-Ylowerbound:Yupperbound

library(truncdist)
# new uncensored row marginal table = truncated negative binomial distribution
# rowrange = X is distributed given a < X <= b
uncensored.row.margin<-dtrunc(rowrange, mu=x$Average, size = x$Dispersion, 
                              a = Xlowerbound-1, b = Xupperbound, spec = "nbinom")
# new uncensored column margin table = = truncated negative binomial distribution
# colrange = Y is distributed given a < Y <= b
uncensored.column.margin<-dtrunc(colrange, mu=y$Average, size = y$Dispersion,
                                 a = Ylowerbound-1, b = Yupperbound, spec = "nbinom")

# sum of truncated distributions equal 1
sum(uncensored.row.margin)
sum(uncensored.column.margin)

# look at the seed for this example (probabilities)
seed.output<-seedmatrix(contingencytable, Xlowerbound, 
                        Xupperbound, Ylowerbound, Yupperbound)$Probabilities

# run mipfp
# store the new margins in a list
tgt.data<-list(uncensored.row.margin, uncensored.column.margin)
# list of dimensions of each marginal constrain
tgt.list<-list(1,2)
# calling the estimated function
## seed has to be in array format for mipfp package
## ipfp is the selected seed.estimation.method
## $p.hat gives probabilies = x.hat/sum(x.hat)
library(mipfp)
final1<-Estimate(array(seed.output,dim=c(length(Xlowerbound:Xupperbound), 
                 length(Ylowerbound:Yupperbound))), tgt.list, tgt.data, method="ipfp")$x.hat

# filling in names of updated seed  
final1<-data.frame(final1)
row.names(final1)<-Xlowerbound:Xupperbound
names(final1)<-Ylowerbound:Yupperbound

# reweight estimates to known censored interior cell probabilities 
final1<-reweight.contingencytable(observed.table = contingencytable, estimated.table = final1)

# see that they sum to one
sum(final1)

# rec function outputs the same table
# default of rec seed.estimation.method is ipfp
# default of rec seed.matrix is the output of the seedmatrix() function
final2<-rec(X= contingencytable,
            Xlowerbound = 1,
            Xupperbound = 15,
            Ylowerbound = 15,
            Yupperbound = 35)

# check that both data.frame results have same values
all(final1 == final2$Probability.Estimates)



