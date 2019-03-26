## ---- eval=FALSE, echo=TRUE, results='asis'------------------------------
## install.packages('neat')

## ---- eval=TRUE, echo=TRUE, results='asis'-------------------------------
library('neat')

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
data(yeast) # load the data
ls(yeast) # display the content of the list

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
induced_genes = list('ESR 2' = yeast$esr2) # set of differentially expressed genes 
#(ESR 2 is the set of induced ESR genes)
functional_sets = yeast$goslimproc[c(72,75)] # two functional gene sets of interest: 
#response to heat and to starvation

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
test = neat(alist = induced_genes, blist = functional_sets, network = yeast$yeastnet,
            nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)

## ---- eval=TRUE, echo=FALSE, results='markup'----------------------------
test$expected_nab = round(test$expected_nab,1)
test$pvalue = round(test$pvalue,4)

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
print(test)

## ---- eval=FALSE, echo=TRUE, results='markup'----------------------------
## neat(alist, blist, network, nettype, nodes, alpha = NULL,
##      anames = NULL, bnames = NULL)

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
A = matrix(0, nrow=7, ncol=7)
labels = letters[1:7]
rownames(A) = labels; colnames(A) = labels
A[1,c(2,3)]=1; A[2,c(5,7)]=1;A[3,c(1,4)]=1;A[4,c(2,5,7)]=1;A[6,c(2,5)]=1;A[7,4]=1
print(A)

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
set1 = c('a','e')
set2 = c('c','g')
set3 = c('d','f')

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3)

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
library(Matrix)
as(A, 'sparseMatrix')

## ---- eval=TRUE, echo=FALSE, results='markup'----------------------------
networkmatrix(A, labels, 'directed')

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
test1 = neat(alist = alist, blist = blist, network = A, 
             nettype = 'directed', nodes = labels)
print(test1)

## ---- eval=TRUE, echo=TRUE, results='markup'-----------------------------
test2 = neat(alist = alist, blist = blist, network = A, 
             nettype = 'directed', nodes = labels, alpha = 0.05)
print(test2)

