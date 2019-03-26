## ---- echo=FALSE---------------------------------------------------------
library('BTR')

## ---- eval = FALSE-------------------------------------------------------
#  install.packages('BTR')

## ---- eval = FALSE-------------------------------------------------------
#  install.packages('devtools')
#  devtools::install_github("cheeyeelim/BTR", ref="main")

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  data(wilson_raw_data)
#  round(wilson_raw_data[1:5,1:5], 4)

## ---- echo=FALSE---------------------------------------------------------
data(wilson_raw_data)
knitr::kable(round(wilson_raw_data[1:5,1:5], 4))

## ---- eval=FALSE---------------------------------------------------------
#  edata = initialise_raw_data(wilson_raw_data, max_expr='low') #max_expr='low' because this is qPCR data.

## ---- eval=FALSE---------------------------------------------------------
#  data(krum_bmodel)
#  head(krum_bmodel)

## ---- echo=FALSE---------------------------------------------------------
data(krum_bmodel)
knitr::kable(head(krum_bmodel))

## ---- eval=FALSE---------------------------------------------------------
#  bmodel = initialise_model(krum_bmodel)

## ---- eval=FALSE---------------------------------------------------------
#  data(krum_istate)
#  head(krum_istate)

## ---- echo=FALSE---------------------------------------------------------
data(krum_istate)
knitr::kable(head(krum_istate))

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  set.seed(0) #use to ensure reproducibility. remove in actual use.
#  
#  #(1) Setup paths and environment.
#  library(BTR)
#  
#  #If intending to use parallel processing, uncomment the following lines.
#  #library(doParallel)
#  #num_core = 4 #specify the number of cores to be used.
#  #doParallel::registerDoParallel(cores=num_core)
#  
#  #(2) Load data.
#  data(wilson_raw_data) #load a data frame of expression data.
#  cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')
#  
#  #(3) Filter cell types.
#  cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) | grepl('mep', rownames(cdata))
#  fcdata = cdata[cell_ind,] #select only relevant cells.
#  
#  #(4) Filter genes.
#  gene_ind = c('fli1', 'gata1', 'gata2', 'gfi1', 'scl', 'sfpi1') #select genes to be included.
#  fcdata = fcdata[, gene_ind]
#  
#  #(5) Inferring Boolean model.
#  final_model = model_train(cdata=fcdata, max_varperrule=3, verbose=T)
#  
#  #(6) Visualise the Boolean model generated.
#  plotBM(final_model)

## ---- tidy=TRUE----------------------------------------------------------
set.seed(0) #use to ensure reproducibility. remove in actual use.

#(1) Setup paths and environment.
library(BTR)

#If intending to use parallel processing, uncomment the following lines. 
#library(doParallel)
#num_core = 4 #specify the number of cores to be used.
#doParallel::registerDoParallel(cores=num_core)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(2) Load data.
#  data(wilson_raw_data) #load a data frame of expression data.
#  cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')

## ---- tidy=TRUE , eval=FALSE, tidy=TRUE----------------------------------
#  #(3) Filter cell types.
#  cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) | grepl('mep', rownames(cdata))
#  fcdata = cdata[cell_ind,] #select only relevant cells.
#  
#  #(4) Filter genes.
#  gene_ind = c('fli1', 'gata1', 'gata2', 'gfi1', 'scl', 'sfpi1') #select genes to be included.
#  fcdata = fcdata[, gene_ind]

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(5) Inferring Boolean model.
#  final_model = model_train(cdata=fcdata, max_varperrule=3, verbose=T)
#  
#  #(6) Visualise the Boolean model generated.
#  plotBM(final_model)

## ---- echo=FALSE, fig.show='hold', message=FALSE, dpi=75, fig.width=6, fig.height=6----
data(example_models)
plotBM(emodel1)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  set.seed(0) #use to ensure reproducibility. remove in actual use.
#  
#  #(1) Setup paths and environment.
#  library(BTR)
#  
#  #If intending to use parallel processing, uncomment the following lines.
#  #library(doParallel)
#  #num_core = 4 #specify the number of cores to be used.
#  #doParallel::registerDoParallel(cores=num_core)
#  
#  #(2) Load data.
#  data(krum_bmodel) #load a data frame of Boolean model.
#  data(krum_istate) #load a data frame of initial state.
#  data(wilson_raw_data) #load a data frame of expression data.
#  
#  bmodel = initialise_model(krum_bmodel)
#  istate = krum_istate
#  cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')
#  
#  #(3) Filter cell types.
#  cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) | grepl('mep', rownames(cdata))
#  fcdata = cdata[cell_ind,] #select only relevant cells.
#  
#  #(4) Inferring Boolean model.
#  final_model = model_train(cdata=fcdata, bmodel=bmodel, istate=istate, max_varperrule=3, verbose=T)
#  
#  #(5) Visualise the Boolean model generated.
#  plotBM(final_model)

## ---- tidy=TRUE----------------------------------------------------------
set.seed(0) #use to ensure reproducibility. remove in actual use.

#(1) Setup paths and environment.
library(BTR)

#If intending to use parallel processing, uncomment the following lines. 
#library(doParallel)
#num_core = 4 #specify the number of cores to be used.
#doParallel::registerDoParallel(cores=num_core)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(2) Load data.
#  #(2) Load data.
#  data(krum_bmodel) #load a data frame of Boolean model.
#  data(krum_istate) #load a data frame of initial state.
#  data(wilson_raw_data) #load a data frame of expression data.
#  
#  bmodel = initialise_model(krum_bmodel)
#  istate = krum_istate
#  cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')

## ---- tidy=TRUE , eval=FALSE, tidy=TRUE----------------------------------
#  #(3) Filter cell types.
#  cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) | grepl('mep', rownames(cdata))
#  fcdata = cdata[cell_ind,] #select only relevant cells.

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(4) Inferring Boolean model.
#  final_model = model_train(cdata=fcdata, bmodel=bmodel, istate=istate, max_varperrule=3, verbose=T)
#  
#  #(5) Visualise the Boolean model generated.
#  plotBM(final_model)

## ---- echo=FALSE, fig.show='hold', message=FALSE, dpi=75, fig.width=6, fig.height=6----
data(example_models)
plotBM(emodel2)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  set.seed(0) #use to ensure reproducibility. remove in actual use.
#  
#  #(1) Setup paths and environment.
#  library(BTR)
#  
#  #If intending to use parallel processing, uncomment the following lines.
#  #library(doParallel)
#  #num_core = 4 #specify the number of cores to be used.
#  #doParallel::registerDoParallel(cores=num_core)
#  
#  #(2) Load data.
#  data(krum_bmodel) #load a data frame of Boolean model.
#  data(krum_istate) #load a data frame of initial state.
#  data(wilson_raw_data) #load a data frame of expression data.
#  
#  bmodel = initialise_model(krum_bmodel)
#  istate = krum_istate
#  cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')
#  
#  #(3) Filter cell types.
#  cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) | grepl('mep', rownames(cdata))
#  fcdata = cdata[cell_ind,] #select only relevant cells.
#  
#  #(4) Adding extra genes to the initial Boolean model.
#  #extra_genes = setdiff(colnames(wilson_raw_data), bmodel@target) #to view available genes to be added.
#  #print(extra_genes) #to view available genes to be added.
#  add_gene = 'ldb1' #genes to be added: ldb1
#  grown_bmodel = grow_bmodel(add_gene, bmodel)
#  
#  #(5) Estimating initial state for the extra genes. (estimating from CMPs)
#  tmp_istate = mean(cdata[grepl('cmp', rownames(cdata)), add_gene])
#  tmp_istate = matrix(round(tmp_istate), nrow=1)
#  colnames(tmp_istate) = add_gene
#  grown_istate = cbind(istate, tmp_istate)
#  grown_istate = initialise_data(grown_istate)
#  
#  #(6) Inferring Boolean model.
#  final_model = model_train(cdata=fcdata, bmodel=grown_bmodel, istate=grown_istate, verbose=T)
#  
#  #(7) Visualise the Boolean model generated.
#  plotBM(final_model)

## ---- tidy=TRUE----------------------------------------------------------
set.seed(0) #use to ensure reproducibility. remove in actual use.

#(1) Setup paths and environment.
library(BTR)

#If intending to use parallel processing, uncomment the following lines. 
#library(doParallel)
#num_core = 4 #specify the number of cores to be used.
#doParallel::registerDoParallel(cores=num_core)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(2) Load data.
#  data(krum_bmodel) #load a data frame of Boolean model.
#  data(krum_istate) #load a data frame of initial state.
#  data(wilson_raw_data) #load a data frame of expression data.
#  
#  bmodel = initialise_model(krum_bmodel)
#  istate = krum_istate
#  cdata = initialise_raw_data(wilson_raw_data, max_expr = 'low')

## ---- tidy=TRUE , eval=FALSE---------------------------------------------
#  #(3) Filter cell types.
#  cell_ind = grepl('cmp', rownames(cdata)) | grepl('gmp', rownames(cdata)) | grepl('mep', rownames(cdata))
#  fcdata = cdata[cell_ind,] #select only relevant cells.

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(4) Adding extra genes to the initial Boolean model.
#  #extra_genes = setdiff(colnames(wilson_raw_data), bmodel@target)
#  #print(extra_genes) #to view available genes to be added.
#  add_gene = 'ldb1' #genes to be added: ldb1
#  grown_bmodel = grow_bmodel(add_gene, bmodel)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(5) Estimating initial state for the extra genes. (estimating from CMPs)
#  tmp_istate = mean(cdata[grepl('cmp', rownames(cdata)), add_gene])
#  tmp_istate = matrix(round(tmp_istate), nrow=1)
#  colnames(tmp_istate) = add_gene
#  grown_istate = cbind(istate, tmp_istate)
#  grown_istate = initialise_data(grown_istate)

## ---- eval=FALSE, tidy=TRUE----------------------------------------------
#  #(6) Inferring Boolean model.
#  final_model = model_train(cdata=fcdata, bmodel=grown_bmodel, istate=grown_istate, verbose=T)
#  
#  #(7) Visualise the Boolean model generated.
#  plotBM(final_model)

## ---- echo=FALSE, fig.show='hold', message=FALSE, dpi=75, fig.width=6, fig.height=6----
data(example_models)
plotBM(emodel3)

