## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "figures/GPrank-"
)

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("PROBIC/GPrank")

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("GPrank")

## ------------------------------------------------------------------------
library("GPrank")

## ------------------------------------------------------------------------
t=seq(0,20,5)
y=sin(t)
v=0.01*runif(5)
kernelTypes=c('rbf','white','fixedvariance')
model=constructModel(t,y,v,kernelTypes)

## ------------------------------------------------------------------------
test_result=apply_gpTest(t,y,v)
null_model=test_result$nullModel
model=test_result$model
logBF=test_result$logBF
logBF

## ------------------------------------------------------------------------
color="lightpink" # color=getColorVector()[1]
ylimits=getYlimits(y,v) # optional argument, also default
plotGP(model, color, ylimits)
title(xlab="t", ylab="y")

## ----eval=FALSE----------------------------------------------------------
#  BF=c(3,5) # Bayes factors
#  FoldChange=c(1.2,0.8) # Fold changes
#  dbParams=list("BF"=BF,"Fold change"=FoldChange)
#  identifiers=c("geneA","geneB")
#  dbInfo=list(database_name="testdb","database_params"=dbParams,"identifiers"=identifiers)
#  figures=c("figures/geneA_GP.png","figures/geneB_GP.png")
#  createDatabase(dbInfo,figures)

## ------------------------------------------------------------------------
data(RNAseqDATA)

## ------------------------------------------------------------------------
t=log(c(0,5,10,20,40,80,160,320,640,1280)+5) # One can apply transforation on time points
names(t)=c("t0000.rpkm","t0005.rpkm","t0010.rpkm","t0020.rpkm",
"t0040.rpkm","t0080.rpkm","t0160.rpkm","t0320.rpkm","t0640.rpkm",
"t1280.rpkm") # matches with the names of the BitSeq output files
trFileName="example_tr"
bitseq_sampleData=bitseq_rnaSeqData(t,trFileName)

## ------------------------------------------------------------------------
gene_gpData=RNAseqDATA$gene
gene_GP_models=bitseq_fitGPs(gene_gpData)
gene_GP_models$logBayesFactors

## ----eval=FALSE----------------------------------------------------------
#  gene_GP_models=bitseq_fitGPs(gene_gpData, fileName_logBF,fileName_ModelParams,fileName_NullModelParams)

## ----fig.cap = "Fitted GP model for the overall gene expression levels"----
item="ARAP2"
multi=0 # single GP plot in the figure
ylimits=NULL
x_ticks=NULL
x_label="log(5 + t/min)"
y_label="Expression level (log-rpkm)"
bitseq_plotGP(item, gene_GP_models, gene_gpData, multi, ylimits, x_ticks, x_label, y_label)

## ----eval=FALSE----------------------------------------------------------
#  bitseq_plotGP(item, gene_GP_models, gene_gpData, multi, ylimits, x_ticks, x_label, y_label, plotName="ARAP2_gene.png")

## ----fig.cap = "Fitted GP model for the absolute transcript expression levels"----
abstr_gpData=RNAseqDATA$abstr
abstr_GP_models=bitseq_fitGPs(abstr_gpData)
item="ARAP2"
multi=1
ylimits=NULL
x_ticks=NULL
x_label="log(5 + t/min)"
y_label="Expression level (log-rpkm)"
bitseq_plotGP(item, abstr_GP_models, abstr_gpData, multi, ylimits, x_ticks, x_label, y_label)

## ----fig.cap = "Fitted GP model for the relative transcript expression levels"----
reltr_gpData=RNAseqDATA$reltr
reltr_GP_models=bitseq_fitGPs(reltr_gpData)
item="ARAP2"
multi=1
ylimits=c(0,1) # ratio range between 0 and 1
x_ticks=NULL
x_label="log(5 + t/min)"
y_label="Relative expression level"
plotName="ARAP2_reltr.pdf"
bitseq_plotGP(item, reltr_GP_models, reltr_gpData, multi, ylimits, x_ticks, x_label, y_label)

## ------------------------------------------------------------------------
data(snpData)

## ------------------------------------------------------------------------
dataFileName="sampleCountsData"
sampleSNPdata=bbgp_snpData(dataFileName)

## ------------------------------------------------------------------------
x=as.matrix(as.numeric(colnames(snpData$counts)))
counts=as.matrix(snpData$counts[5,]) # take the fifth SNP in the sample data as example:
seq_depth=as.matrix(snpData$seq_depth[5,])
bbgp=get_bbgpMeanStd(x,counts,seq_depth)
t=bbgp$time
y=bbgp$posteriorMean
v=(bbgp$posteriorStd)^2

## ------------------------------------------------------------------------
snp_gpTest=apply_gpTest(t,y,v)
snp_gpTest$logBF

## ----fig.cap = "Fitted GP model of the SNP frequencies across generations"----
model=snp_gpTest$model
ylims=c(0,1)
plotGP(model, ylimits=ylims, jitterx=TRUE)
title(xlab="Time", ylab="Frequency")

## ------------------------------------------------------------------------
sessionInfo()

