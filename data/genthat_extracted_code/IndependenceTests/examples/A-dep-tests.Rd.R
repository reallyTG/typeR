library(IndependenceTests)


### Name: A.dep.tests
### Title: Tests for mutual and serial independence of categorical
###   variables
### Aliases: A.dep.tests

### ** Examples

# Test of  mutual independence between 3 independent Bernoulli variables.

n <- 100
data <- data.frame(X1=rbinom(n,1,0.3),X2=rbinom(n,1,0.3),X3=rbinom(n,1,0.3))
X <- table(data)
A.dep.tests(X)

# Test of mutual independence between 4 variables which are
# 2-independent and 3-independent but 4-dependent.

n <- 100
W <- sample(x=1:8,size=n,TRUE)
X1 <- W %in% c(1,2,3,5)
X2 <- W %in% c(1,2,4,6)
X3 <- W %in% c(1,3,4,7)
X4 <- W %in% c(2,3,4,8)
data <- data.frame(X1,X2,X3,X4)
X <- table(data)
A.dep.tests(X)

# Test of serial independence of a nucleotide sequence of length
# 4156 described in Whisenant et al. (1991).

data(dna)
x2 <- dna[1]
for (i in 2:length(dna)) x2 <- paste(x2, dna[i], sep = "")
x <- unlist(strsplit(x2, ""))
x[x=="a"|x=="g"] <- "r"
x[x=="c"|x=="t"] <- "y"
## No test: 
out <- A.dep.tests(x,choice=2,d=1501,m=2)$TA[[1]]
plot(100:1500,out[100:1500],xlab="lag j",ylab="T(1,j+1)",pch=19)
abline(h=qchisq(.995,df=1))
## End(No test)

# Analysis of a contingency table in Agresti (2002) p. 322 

data(highschool)
A.dep.tests(highschool,freqname="count")




