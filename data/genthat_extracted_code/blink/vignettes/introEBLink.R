## ---- echo=TRUE, message=FALSE, knitr::opts_chunk$set(cache=TRUE)--------
library(blink)
data(RLdata500)
head(RLdata500)

## ------------------------------------------------------------------------
# X.c contains the categorical variables
# X.s contains the string variables 
# p.c is the number of categorical variables
# p.s contains the number of string variables
X.c <- RLdata500[c("by","bm","bd")]
X.c <- as.matrix(RLdata500[,"bd"],ncol=1)
p.c <- ncol(X.c)
X.s <- as.matrix(RLdata500[-c(2,4,7)])
p.s <- ncol(X.s)

## ------------------------------------------------------------------------
# File number identifier
# Note: Recall that X.c and X.s include all files "stacked" on top of each other.
# The vector below keeps track of which rows of X.c and X.s are in which files.
file.num <- rep(c(1,2,3),c(200,150,150))

## ------------------------------------------------------------------------
# Subjective choices for distortion probability prior
a <-1
b <- 999

## ------------------------------------------------------------------------
d <- function(string1,string2){adist(string1,string2)}

## ------------------------------------------------------------------------
c <- 1

## ----results="hide"------------------------------------------------------
lam.gs <- rl.gibbs(file.num=file.num,X.s=X.s,X.c=X.c,num.gs=2,a=a,b=b,c=c,d=d, M=500)

## ---- fig.show="hold", fig.cap="The red line is the ground truth (450), which is not close to the estimate (500) since we only ran 10 Gibbs sampling iterations."----
estLink <- lam.gs
estPopSize <- apply(estLink , 1, function(x) {length(unique(x))})
plot(density(estPopSize),xlim=c(300,500),main="",lty=1, "Observed Population Size", ylim= c(0,1))
abline(v=450,col="red")
abline(v=mean(estPopSize),col="black",lty=2)
mean(estPopSize)
sd(estPopSize)

## ----show="hold", fig.cap="The red line is the ground truth (450), which we find to be very close to posterior mean of 445."----

temp <- unzip("../inst/extdata/sampleLinkage2.txt.zip")

estLink <- as.matrix(read.table(temp,header=TRUE))
dim(estLink)
estPopSize <- apply(estLink , 1, function(x) {length(unique(x))})
plot(density(estPopSize),xlim=c(300,500),main="",lty=1, "Observed Population Size", ylim= c(0,1))
abline(v=450,col="red")
abline(v=mean(estPopSize),col="black",lty=2)
mean(estPopSize)
sd(estPopSize)

## ------------------------------------------------------------------------
# let's calculated the estimated pairwise links
# using the blink method 
est.links.pair <- links(estLink[85000:90000,])
# let's calulated the true links using the 
# unique identifiers that are stored
true.links <- links(matrix(identity.RLdata500,nrow=1))
true.links.pair <- pairwise(true.links)
# Correct, incorrect, and missing links
comparison <- links.compare(est.links.pair,true.links.pair,counts.only=TRUE)
comparison
missing.links <- comparison$missing
true.links<-comparison$correct 
false.links <- comparison$incorrect

truth.links <- true.links+false.links
fpr = false.links/truth.links
fnr = missing.links/truth.links
fdr = false.links/(true.links+false.links)
c(fpr,fnr,fdr)

