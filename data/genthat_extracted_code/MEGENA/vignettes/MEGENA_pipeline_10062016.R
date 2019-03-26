## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----correlation,message=FALSE-------------------------------------------
rm(list = ls()) # rm R working space

library(MEGENA)

# input parameters
n.cores <- 2; # number of cores/threads to call for PCP
doPar <-TRUE; # do we want to parallelize?
method = "pearson" # method for correlation. either pearson or spearman. 
FDR.cutoff = 0.05 # FDR threshold to define significant correlations upon shuffling samples. 
module.pval = 0.05 # module significance p-value. Recommended is 0.05. 
hub.pval = 0.05 # connectivity significance p-value based random tetrahedral networks
cor.perm = 10; # number of permutations for calculating FDRs for all correlation pairs. 
hub.perm = 100; # number of permutations for calculating connectivity significance p-value. 

# annotation to be done on the downstream
annot.table=NULL
id.col = 1
symbol.col= 2
###########

data(Sample_Expression) # load toy example data

ijw <- calculate.correlation(datExpr,doPerm = cor.perm,output.corTable = FALSE,output.permFDR = FALSE)

## ----PFN-----------------------------------------------------------------
#### register multiple cores if needed: note that set.parallel.backend() is deprecated. 
run.par = doPar & (getDoParWorkers() == 1) 
if (run.par)
{
  cl <- parallel::makeCluster(n.cores)
  registerDoParallel(cl)
  # check how many workers are there
  cat(paste("number of cores to use:",getDoParWorkers(),"\n",sep = ""))
}

##### calculate PFN
el <- calculate.PFN(ijw[,1:3],doPar = doPar,num.cores = n.cores,keep.track = FALSE)
g <- graph.data.frame(el,directed = FALSE)

## ----MCA,results="hide",warning=FALSE------------------------------------

##### perform MCA clustering.
MEGENA.output <- do.MEGENA(g,
 mod.pval = module.pval,hub.pval = hub.pval,remove.unsig = TRUE,
 min.size = 10,max.size = vcount(g)/2,
 doPar = doPar,num.cores = n.cores,n.perm = hub.perm,
 save.output = FALSE)

###### unregister cores as these are not needed anymore.
if (getDoParWorkers() > 1)
{
  env <- foreach:::.foreachGlobals
  rm(list=ls(name=env), pos=env)
}



## ----summarize-----------------------------------------------------------
summary.output <- MEGENA.ModuleSummary(MEGENA.output,
	mod.pvalue = module.pval,hub.pvalue = hub.pval,
	min.size = 10,max.size = vcount(g)/2,
	annot.table = annot.table,id.col = id.col,symbol.col = symbol.col,
	output.sig = TRUE)

if (!is.null(annot.table))
{
  # update annotation to map to gene symbols
  V(g)$name <- paste(annot.table[[symbol.col]][match(V(g)$name,annot.table[[id.col]])],V(g)$name,sep = "|")
  summary.output <- output[c("mapped.modules","module.table")]
  names(summary.output)[1] <- "modules"
}

print(head(summary.output$modules,2))
print(summary.output$module.table)

## ----modulePlot----------------------------------------------------------
pnet.obj <- plot_module(output.summary = summary.output,PFN = g,subset.module = "c1_3",
	layout = "kamada.kawai",label.hubs.only = TRUE,
	gene.set = NULL,color.code =  "grey",
	output.plot = FALSE,out.dir = "modulePlot",col.names = c("magenta","green","cyan"),label.scaleFactor = 20,
	hubLabel.col = "black",hubLabel.sizeProp = 1,show.topn.hubs = Inf,show.legend = TRUE)

#X11();
print(pnet.obj[[1]])

## ----module hierarchy----------------------------------------------------
module.table <- summary.output$module.table
colnames(module.table)[1] <- "id" # first column of module table must be labelled as "id".

hierarchy.obj <- plot_module_hierarchy(module.table = module.table,label.scaleFactor = 0.15,
                                    arrow.size = 0.03,node.label.color = "blue")
#X11();
print(hierarchy.obj[[1]])

