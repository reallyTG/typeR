## ----require-------------------------------------------------------------
library(harmonicmeanp)

## ----download------------------------------------------------------------
system.time((gwas = read.delim("http://www.danielwilson.me.uk/files/Neuroticism_ch12.txt",
  header=TRUE,as.is=TRUE)))
head(gwas)

## ----HMP-----------------------------------------------------------------
gwas$w = 1/6524432
R = 1:nrow(gwas)
(HMP.R = sum(gwas$w[R])/sum(gwas$w[R]/gwas$p[R]))

## ----phmp----------------------------------------------------------------
# Use p.hmp instead to compute the HMP test statistic and
# calculate its asymptotically exact p-value in one step
pharmonicmeanp(HMP.R, L=length(R), lower.tail=TRUE)

## ----p.hmp---------------------------------------------------------------
R = 1:nrow(gwas)
p.hmp(gwas$p[R],gwas$w[R])

## ----adjust--------------------------------------------------------------
alpha = 0.05
w.R = sum(gwas$w[R])
alpha*w.R

## ----oddsevens-----------------------------------------------------------
R = which(gwas$pos%%2==0)
p.hmp(gwas$p[R],gwas$w[R])
w.R = sum(gwas$w[R])
alpha*w.R
R = which(gwas$pos%%2==1)
p.hmp(gwas$p[R],gwas$w[R])
w.R = sum(gwas$w[R])
alpha*w.R

## ----oddsevens.adjust----------------------------------------------------
R = which(gwas$pos%%2==0)
p.R = p.hmp(gwas$p[R],gwas$w[R])
w.R = sum(gwas$w[R])
(p.R.adjust = p.R/w.R)
R = which(gwas$pos%%2==1)
p.R = p.hmp(gwas$p[R],gwas$w[R])
w.R = sum(gwas$w[R])
(p.R.adjust = p.R/w.R)

## ----twohalves-----------------------------------------------------------
R = 1:156229
p.R = p.hmp(gwas$p[R],gwas$w[R])
w.R = sum(gwas$w[R])
(p.R.adjust = p.R/w.R)
R = 156230:312457
p.R = p.hmp(gwas$p[R],gwas$w[R])
w.R = sum(gwas$w[R])
(p.R.adjust = p.R/w.R)

## ----win-----------------------------------------------------------------
# Define overlapping sliding windows of 1 megabase at 0.2 megabase intervals
win.1M.beg = outer(0:floor(max(gwas$pos/1e6)),(0:4)/5,"+")*1e6
# Calculate the combined p-values for each window
system.time({
  p.1M = apply(win.1M.beg,c(1,2),function(beg) {
    R = which(gwas$pos>=beg & gwas$pos<(beg+1e6))
    p.hmp(gwas$p[R],gwas$w[R])
  })
})
# Calculate sums of weights for each combined test
system.time({
  w.1M = apply(win.1M.beg,c(1,2),function(beg) {
    R = which(gwas$pos>=beg & gwas$pos<(beg+1e6))
    sum(gwas$w[R])
  })
})
# Calculate adjusted p-value for each window
p.1M.adj = p.1M/w.1M 

## ----winplot, fig.width=7, fig.height=5----------------------------------
# Took a few seconds, plotting over 312k points
gwas$p.adj = gwas$p/gwas$w
plot(gwas$pos/1e6,-log10(gwas$p.adj),pch=".",xlab="Position on chromosome 12 (megabases)",
  ylab="Adjusted significance (-log10 adjusted p-value)",
  ylim=sort(-log10(range(gwas$p.adj,p.1M.adj,na.rm=TRUE)))) 
arrows(win.1M.beg/1e6,-log10(p.1M.adj),(win.1M.beg+1e6)/1e6,len=0,col="green2",lwd=2)
# Superimpose the significance threshold, alpha, e.g. alpha=0.05
abline(h=-log10(0.05),col="black",lty=2)
# For comparison, plot the conventional GWAS threshold of 5e-8. Need to convert
# this into the adjusted p-value scale. Instead of comparing each raw p-value
# against a Bonferonni threshold of alpha/L=0.05/6524432, we would be comparing each
# against 5e-8. So the adjusted p-values p/w=p*L would be compared against
# 5e-8*L = 5e-8 * 6524432 = 0.3262216
abline(h=-log10(0.3262216),col="grey",lty=3) 

## ----listpos-------------------------------------------------------------
win.1M.beg[which(p.1M.adj<=0.05)]
# Also list the position of the most significant individual (adjusted) p-value
(peakpos = gwas$pos[gwas$p.adj==min(gwas$p.adj)])

## ----winlengths----------------------------------------------------------
# Window of 100 base pairs
wlen = 100
R = which(abs(gwas$pos-peakpos)<wlen)
(p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R]))
# Window of 1 kilobase
wlen = 1e3
R = which(abs(gwas$pos-peakpos)<wlen)
(p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R]))
# Window of 10 kilobases
wlen = 1e4
R = which(abs(gwas$pos-peakpos)<wlen)
(p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R]))
# Window of 100 kilobases
wlen = 1e5
R = which(abs(gwas$pos-peakpos)<wlen)
(p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R]))
# Window of 1 megabase
wlen = 1e6
R = which(abs(gwas$pos-peakpos)<wlen)
(p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R]))

## ----optwin--------------------------------------------------------------
# Find the smallest window centred on position 118876918 significant at alpha=0.05
f = function(wlen) {
  R = which(abs(gwas$pos-peakpos)<wlen)
  p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R])
  return(p.R.adjust - 0.05)
}
(wlen.opt = uniroot(f,c(1e5,1e6))$root)
# Show that the group of SNPs in this window is indeed significant
wlen = wlen.opt
R = which(abs(gwas$pos-peakpos)<wlen)
(p.R.adjust = p.hmp(gwas$p[R])/sum(gwas$w[R]))
# The number of individual SNPs included in this group
length(R)

## ----fiddler, fig.width=4, fig.height=4----------------------------------
# Load the ape package for reading and plotting the tree
library(ape)
tree = read.tree((PIPE=pipe(
'echo "(((chlorophthalmus:1,crassipes:1)A:1,(inversa:1,sindensis:1)B:1):1,argillicola:3);"'
))); close(PIPE)
plot(tree, show.node.label=TRUE)

log.carapace.breadth = c("chlorophthalmus"=1.02,"crassipes"=1.06,"inversa"=0.96,
"sindensis"=0.92,"argillicola"=0.89)
log.propodus.length = c("chlorophthalmus"=1.38,"crassipes"=1.41,"inversa"=1.36,
"sindensis"=1.22,"argillicola"=1.13)

plot(log.propodus.length ~ log.carapace.breadth)

## ----dataframe-----------------------------------------------------------
# Convert branches in the tree into informative 'partitions'
informative.partitions = function(tree) {
  n = length(tree$tip.label)
  m = sapply(n+1:tree$Nnode,function(node) {
    1*is.na(match(tree$tip.label,extract.clade(tree,node)$tip.label))
  })
  rownames(m) = tree$tip.label
  colnames(m) = paste0("node.",tree$node.label)
  cs = colSums(m)
  is.informative = pmin(cs,n-cs)>1
  m[,is.informative]
}
# Extract phylogenetically informative partitions from the tree
partition = informative.partitions(tree)

# Create a data frame combining all the information
Uca = data.frame(log.propodus.length,log.carapace.breadth,partition)

## ----models--------------------------------------------------------------
# Claw size does not vary by species
m0 = formula(log.propodus.length ~ 1) # grand null
# Claw size is associated with body size and there is no phylogenetic correlation
m1 = formula(log.propodus.length ~ log.carapace.breadth)
# Claw size isn't associated with body size but it is different in the descendents of ancestor A
m2 = formula(log.propodus.length ~ node.A)
# Claw size isn't associated with body size but it is different in the descendents of ancestor B
m3 = formula(log.propodus.length ~ node.B)
# Claw size is associated with body size and it is different in the descendants of ancestor A
m4 = formula(log.propodus.length ~ log.carapace.breadth + node.A)
# Claw size is associated with body size and it is different in the descendants of ancestor B
m5 = formula(log.propodus.length ~ log.carapace.breadth + node.B)
# Claw size isn't associated with body size but is different in descendents of ancestors A & B
m6 = formula(log.propodus.length ~ node.A + node.B)
# Claw size is associated with body size and is different in descendants of ancestors A & B
m7 = formula(log.propodus.length ~ log.carapace.breadth + node.A + node.B) # grand alternative
# List the alternatives together
mA = list(m1,m2,m3,m4,m5,m6,m7)

## ----pairwisetests-------------------------------------------------------
# Output p-values from all tests for the inclusion of the primary regressor
pairwise.p = function(response,primary,data) {
  # Define a model space including the grand null
  rid = which(colnames(data)==response)
  if(length(rid)!=1) stop("Could not find response variable")
  # Define the 'primary' regressor
  pid = which(colnames(data)==primary)
  if(length(pid)!=1) stop("Could not find primary regressor")
  # Define the 'secondary' regressors, excluding the response and 'primary' regressor
  xid = (1:ncol(data))[-c(rid,pid)]
  if(length(xid)<1) stop("Could find only the primary regressor")
  # Create a table of every unique combination of models involving the secondary regressors
  delta = expand.grid(lapply(xid,function(j) 0:1))
  colnames(delta) = colnames(data)[xid]
  # Sort them by the number of regressors included, from fewest to most
  delta = delta[order(rowSums(delta)),]
  # Enumerate the models, adding the primary regressor to every one
  mpairs = apply(delta,1,function(x) {
    if(all(x==0)) {
      formula(paste0(colnames(data)[rid],"~",colnames(data)[pid]))
    } else {
      formula(paste0(colnames(data)[rid],"~",colnames(data)[pid],"+",
        paste(colnames(data)[xid][x==1],collapse="+")))
    }
  })
  names(mpairs) = gsub(colnames(data)[pid],paste0("[",colnames(data)[pid],"]"),
    as.character(mpairs),perl=TRUE)
  # Calculate a p-value for the inclusion of the primary regressor in each model
  lapply(mpairs,function(m) {
    fit = lm(m, data=data)
    drop1(fit,colnames(data)[pid],test="Chisq")[colnames(data)[pid],"Pr(>Chi)"]
  })
}
# Calculate the p-values from all tests for the inclusion of log.carapace.breadth
(p = pairwise.p(response="log.propodus.length",primary="log.carapace.breadth",data=Uca))

## ----hmpbodysize---------------------------------------------------------
# Specify the weight of each test, assuming equal weights
ntotaltests = 12
(w = rep(1/ntotaltests,length(p)))
# Calculate the model-averaged (asymptotically exact) HMP
(p.comb = p.hmp(p,w))
# Sum the weights of the constituent tests
(w.comb = sum(w))
# Calculate an adjusted model-averaged p-value for comparison to the ssFWER alpha
(p.comb.adj = p.comb/w.comb)

## ----bonferronibodysize--------------------------------------------------
(p.adj = unlist(p)/w)
(p.Bonf = min(p.adj))

## ----hmpnodeAB-----------------------------------------------------------
# Is there a significant difference in claw size between the descendants of ancestor A
# and other species?
p = pairwise.p(response="log.propodus.length",primary="node.A",data=Uca)
w = rep(1/ntotaltests,length(p))
p.hmp(p,w)/sum(w)
# Individual tests and Bonferroni
(p.adj = unlist(p)/w)
(p.Bonf = min(p.adj))
# Is there a significant difference in claw size between the descendants of ancestor B
# and other species?
p = pairwise.p(response="log.propodus.length",primary="node.B",data=Uca)
w = rep(1/ntotaltests,length(p))
p.hmp(p,w)/sum(w)
# Individual tests and Bonferroni
(p.adj = unlist(p)/w)
(p.Bonf = min(p.adj))

## ------------------------------------------------------------------------
p = c(
  unlist(pairwise.p(response="log.propodus.length",primary="log.carapace.breadth",data=Uca)),
  unlist(pairwise.p(response="log.propodus.length",primary="node.A",data=Uca)),
  unlist(pairwise.p(response="log.propodus.length",primary="node.B",data=Uca)))

## ------------------------------------------------------------------------
terms = lapply(names(p),function(s) labels(terms(as.formula(gsub("\\[|\\]","",s,perl=TRUE)))))
(nterms = unlist(lapply(terms,length)))
(s = ncol(Uca)-1)
(m = 1/s)
(mu = m^nterms * (1-m)^(s-nterms))

## ------------------------------------------------------------------------
test.term = sapply(names(p),function(s) 
  gsub("\\[|\\]","",regmatches(s,regexpr("\\[.*?\\]",s,perl=TRUE)),perl=TRUE)
)
Uca.var = apply(Uca,2,var)
ssqb.over.ssqe = 2/Uca.var[test.term]
names(ssqb.over.ssqe) = names(p)
Var.beta.over.ssqe = sapply(names(p),function(s) {
  test.term = gsub("\\[|\\]","",
    regmatches(s,regexpr("\\[.*?\\]",s,perl=TRUE)),perl=TRUE)
  X = model.matrix(as.formula(gsub("\\[|\\]","",s,perl=TRUE)), data=Uca)
  solve(crossprod(X))[test.term,test.term]
})

# When the beta approximation performs poorly, best to evaluate
# near the likely value of the final threshold
smallp = 0.05/length(p)
# These are the test powers assuming threshold smallp
(smallp.pow = pchisq(qchisq(smallp,1,lower.tail=FALSE)/
  (1+ssqb.over.ssqe/Var.beta.over.ssqe),1,lower.tail=FALSE))
# Sanity checks
if(any(smallp.pow==1))
  warning("Perfect power test detected, check this is plausible")
if(any(smallp.pow<smallp))
  stop("Tests with worse power than smallp violate assumptions")
if(any(!is.finite(smallp.pow)) | any(smallp.pow<0) | any(smallp.pow>1))
  stop("Power cannot be outside range 0-1")
# Convert them into the parameter of the Beta(xi,1) distribution
xi = log(smallp.pow)/log(smallp)
if(any(!is.finite(xi)) | any(xi<0) | any(xi>1))
  stop("Beta(xi,1): xi cannot be outside range 0-1")

# Optimize the weights
wfunc = function(mu,xi,lambda,alpha) (mu*xi/lambda)^(1/(1-xi))/alpha
lambdafunc = function(lambda,alpha) sum(wfunc(mu,xi,lambda,alpha))-1
lambda = uniroot(lambdafunc,c(1e-6,1e6),0.05)$root
lambda = uniroot(lambdafunc,lambda*c(0.1,1.1),0.05)$root
(w = wfunc(mu,xi,lambda,0.05))
# Check the weights sum to one
sum(w)
if(abs(1-sum(w))>1e-4) stop("weights do not sum to one, check")

## ------------------------------------------------------------------------
# Compare the weighted and unweighted results
wequal = rep(1/length(w),length(w))
# For log.carapace.breadth
incl = which(test.term == "log.carapace.breadth")
c("weighted"=p.hmp(p[incl],w[incl])/sum(w[incl]),
  "unweighted"=p.hmp(p[incl],wequal[incl])/sum(wequal[incl]))
# For node.A
incl = which(test.term == "node.A")
c("weighted"=p.hmp(p[incl],w[incl])/sum(w[incl]),
  "unweighted"=p.hmp(p[incl],wequal[incl])/sum(wequal[incl]))
# For node.B
incl = which(test.term == "node.B")
c("weighted"=p.hmp(p[incl],w[incl])/sum(w[incl]),
  "unweighted"=p.hmp(p[incl],wequal[incl])/sum(wequal[incl]))
# Headline
incl = 1:length(p)
c("weighted"=p.hmp(p[incl],w[incl])/sum(w[incl]),
  "unweighted"=p.hmp(p[incl],wequal[incl])/sum(wequal[incl]))

## ----enumerateallmodels--------------------------------------------------
enumerate.models = function(response,data) {
  # Define the response variable
  rid = which(colnames(data)==response)
  if(length(rid)!=1) stop("Could not find the response variable")
  # Define the regressors
  xid = (1:ncol(data))[-rid]
  # Create a table defining every unique combination of alternative hypotheses
  delta = expand.grid(lapply(xid,function(j) 0:1))
  colnames(delta) = colnames(data)[xid]
  # Sort them from fewest to most terms
  delta = delta[order(rowSums(delta)),]
  # Remove the grand null model
  delta = delta[rowSums(delta)>0,]
  # Define the grand null model separately
  m0 = formula(paste0(colnames(data)[rid],"~1"))
  # Define the alternative models
  mA = apply(delta,1,function(x) formula(paste0(colnames(data)[rid],"~",
    paste(colnames(data)[xid][x==1],collapse="+"))))
  names(mA) = as.character(mA)
  return(list("m0"=m0,"mA"=mA))
}
# E.g. on the Uca data
enumerate.models("log.propodus.length",Uca)

