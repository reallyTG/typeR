## ----setup, include=F, echo=F, message= FALSE----------------------------
knitr::opts_chunk$set(fig.width=4, fig.height=4, fig.pos = "h", tidy = TRUE, tidy.opts=list(width.cutoff=60))

## ----include=F, echo=F---------------------------------------------------
packages <- c("NEArender","data.table","graphics","tinytex")
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())),repos = "http://cran.us.r-project.org")  
}

## ----include=F-----------------------------------------------------------
library(NEArender)
library(data.table)
library(graphics)
library(tinytex)

## ------------------------------------------------------------------------
# input <- fread("http://research.scilifelab.se/andrej_alexeyenko/downloads/test_data/FANTOM5.43samples.txt",
# sep="\t",header=T,stringsAsFactors=FALSE,data.table = F)
##  Converting genenames as rownames
# rownames(input) <-input[,1]
# input <- as.matrix(input[,c(2:ncol(input))])

data("fantom5.43samples")
input <- fantom5.43samples
dim(input)
ags.list1 <- samples2ags(input, Ntop=20, method="topnorm")

## ------------------------------------------------------------------------
data("tcga.gbm",package="NEArender")
ags.list3 <- mutations2ags(tcga.gbm, col.mask="[-.]01$")

## ------------------------------------------------------------------------
ags.list2 <-import.gs("http://research.scilifelab.se/andrej_alexeyenko/downloads/test_data/cluster2_Downregulated_ags.txt", Lowercase = 1, col.gene = 1,col.set = 3, gs.type = 'ags')

## ------------------------------------------------------------------------
fgs.list <- import.gs("http://research.scilifelab.se/andrej_alexeyenko/downloads/test_data/can.sig.go.txt",
Lowercase = 1, col.gene = 2, col.set = 3, gs.type = 'fgs')

## ------------------------------------------------------------------------
data(can.sig.go)
fgs.list <- import.gs(can.sig.go)

## ------------------------------------------------------------------------
data(net.kegg)
net <- import.net(net.kegg)
print(paste(names(net$links)[10], net$links[[10]], sep=": "))

## ------------------------------------------------------------------------
net <- import.net("http://research.scilifelab.se/andrej_alexeyenko/downloads/test_data/net.kegg.txt")

## ------------------------------------------------------------------------
net.merged <-"http://research.scilifelab.se/andrej_alexeyenko/downloads/test_data/merged6_and_wir1_HC2"
net <- import.net(net.merged)

## ------------------------------------------------------------------------
data(net.kegg)
net <- import.net(net.kegg);
fgs.genes <- as_genes_fgs(net);
#save_gs_list(fgs.genes, File = "~/single_gene_ags.groups.tsv");

## ----include=TRUE--------------------------------------------------------
n1 <- nea.render(AGS=ags.list1, FGS=fgs.list, NET=net)

## ----fig.width=4, fig.height=4, fig.cap=c("n1$chi - chi-square estimate","n1$z- zscores", "NEA- pvalues","NEA-qvalues")----
hist(n1$chi, breaks=100)    
hist(n1$z, breaks=100) 
hist(n1$p, breaks=100)  
hist(n1$q, breaks=100)  

## ----include=T,fig.width=4, fig.height=3, fig.cap=c("g1$estimate - an estimate of the odds ratio", "g1$n - number of ags genes that belongs to corresponding fgs","g1$p - the p-value of the fishers.exact test","g1$q - Adjusted p-values by \"BH-method\"")----
ags.list2 <- samples2ags(fantom5.43samples, Ntop=1000, method="topnorm")
g1 <- gsea.render(AGS=ags.list2, FGS=fgs.list, Lowercase = 1, 
ags.gene.col = 2, ags.group.col = 3, fgs.gene.col = 2, fgs.group.col = 3, 
echo=1, Ntotal = 20000, Parallelize=1)

hist(log(g1$estimate), breaks=100)  
hist(g1$n, breaks=100)  
hist(g1$p, breaks=100)  
hist(g1$q, breaks=100)  

## ----include=T, results='hide', fig.cap=c("ROC curve evaluating KEGG network (net.kegg)\"")----
b0 <- benchmark (NET = net,
 GS = fgs.list, 
 echo=1, graph=TRUE, na.replace = 0, mask = ".", minN = 0,
 coff.z = 1.965, coff.fdr = 0.1, Parallelize=1);

## ----eval=FALSE----------------------------------------------------------
#  b1 <- NULL;
#  for (mask in c("kegg_", "go_")) {
#  b1[[mask]] <- NULL;
#  ref_list <- list(net.kegg=net.kegg,net.merged=net.merged)
#  for (file.net in c("net.kegg","net.merged")) {
#  # a series of networks can be put here: c("net.kegg1", "net.kegg2", "net.kegg3") in ref_list
#  net <- import.net(ref_list[[file.net]], col.1 = 1, col.2 = 2, Lowercase = 1, echo = 1)
#  b1[[mask]][[file.net]] <- benchmark (NET = net, GS = fgs.list, echo=1,
#  graph=FALSE, na.replace = 0, mask = mask, minN = 0,  Parallelize=3);
#  roc(b1[["kegg_"]], coff.z = 2.57, main="kegg_");
#  roc(b1[["go_"]], coff.z = 2.57, main="go_");
#  }}
#  

## ----include=FALSE-------------------------------------------------------
library(RColorBrewer)
library(MASS)

## ----results="hide", fig.cap=c("Node degree distribution"),fig.show='hold'----
connectivityfile <-  system.file("extdata", "Connectivity.FC1_full", package = "NEArender")
connect <- connectivity(connectivityfile)

## ----include=T, results="hide", fig.cap=c("Second order topology"), fig.show='asis'----
topology2nd(NET=connectivityfile, Lowercase = 1, col.1 = 1, col.2 = 2)

