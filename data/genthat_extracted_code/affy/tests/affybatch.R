##
## Basic set of tests for the class AffyBatch
##
library(affy)

## fake environment
##it the below change the environment def must change too
NCOL <- 8
NROW <- 8
n <- NCOL*NROW

cat("---> normalizing an environment...\n")
tmp <- sample(1:50)
dummy <- new.env(hash=T)
index <- cbind(tmp[1:10], tmp[11:20])
assign("gene.a", index, envir=dummy)
index <- cbind(tmp[21:30],tmp[31:40])
assign("gene.b", index, envir=dummy)
cat("done.\n")

cat("---> creating an AffyBatch...\n")
samplenames <- c("sample1","sample2")
signal <- exp(rexp(n,1))
e <- cbind(exp(rnorm(n,4,1))+signal,exp(rnorm(n,4,1))+signal)
colnames(e) <- samplenames
afbatch <- new("AffyBatch",
               exprs=e,
               cdfName="dummy",
               ncol=NCOL,nrow=NROW)
cat("done.\n")


##can i get pms?
pms <- pm(afbatch)
mms <- mm(afbatch)

## normalize the AffyBatch
cat("---> normalizing an AffyBatch...\n")
n.afbatch <- normalize(afbatch, method="constant")
cat("done.\n")

## compute expression values
cat("---> computing expression values...\n")
e.set <- computeExprSet(n.afbatch, pmcorrect.method="pmonly", summary.method="avgdiff")
if (!is(e.set, "ExpressionSet"))
  stop("e.set does not inherit from 'ExpressionSet'!")
cat("done.\n")
