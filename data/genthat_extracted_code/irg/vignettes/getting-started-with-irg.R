## ----knitrsetup, include = FALSE-----------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = '#>',
  eval = FALSE
)
options(scipen = 9999)

## ----remotes-------------------------------------------------------------
#  remotes::install_gitlab('robit.a/irg')

## ----extdata, eval = TRUE------------------------------------------------
library(irg)
library(data.table)

ndvi <- fread(system.file('extdata', 'ndvi.csv', package = 'irg'))

# or look at the help page
?ndvi

## ----printdata, eval = TRUE, echo = FALSE--------------------------------
knitr::kable(ndvi[90:95])

## ----setdt---------------------------------------------------------------
#  # Pretend
#  DF <- as.data.frame(ndvi)
#  
#  # Convert by reference
#  setDT(DF)

## ----functGraphViz, eval = TRUE, echo = FALSE, self_contained = FALSE----
library(DiagrammeR)
g <- grViz(
	"
	digraph irg_functions  {
	graph [rankdir=LR, compound=TRUE, fontsize = 28]

	node[shape=none, fontsize=28]

	subgraph cluster_filt{
	label= '1)'; labeljust='l';
	Filtering -> filter_ndvi [dir=none]
	filter_ndvi -> filter_qa [dir=none]
	filter_ndvi -> filter_winter [dir=none]
  filter_ndvi -> filter_roll [dir=none]
  filter_ndvi -> filter_top [dir=none]

	filter_top -> filter_roll -> filter_winter -> filter_qa [dir=back]
	{rank=same; filter_qa; filter_winter; filter_roll; filter_top}
	}

	subgraph cluster_scal{
  label= '2)' labeljust='l';

	Scaling -> scale_doy [dir=none]
	Scaling -> scale_ndvi [dir=none]
	}

	subgraph cluster_mod{
  label= '3)' labeljust='l';

	Modeling -> model_start [dir=none]
	Modeling -> model_params [dir=none]
	Modeling -> model_ndvi [dir=none]

	model_ndvi -> model_params -> model_start [dir=back]
	{rank=same; model_ndvi; model_params; model_start}
	}

	subgraph cluster_irg{
  label= '4)' labeljust='l';

	IRG -> calc_irg [dir=none]
	}

  Filtering -> Scaling -> Modeling -> IRG
	
	# irg -> Filtering
	# irg -> Scaling
	# irg -> Modeling
	# irg -> IRG

	}
	", width = 700, height = 600)
g

## ---- eval = TRUE, echo = FALSE------------------------------------------
fs <-
	data.table(functions = as.character(lsf.str('package:irg')))[, 
             arguments := paste(unlist(formalArgs(functions)), 
            									 collapse = ', ' ), 
             by = functions]

## ---- eval = TRUE--------------------------------------------------------
out <- irg(ndvi)

## ---- eval = TRUE, echo = FALSE------------------------------------------
knitr::kable(out[between(t, 0.4, 0.5)][1:5, .(id, yr, t, fitted, irg)])

## ---- echo = FALSE, eval = TRUE------------------------------------------
# fs[grepl('qa', functions), order := 1]
# fs[grepl('winter', functions), order := 2]
# fs[grepl('roll', functions), order := 3]
# fs[grepl('top', functions), order := 4]
knitr::kable(fs[grepl('filter', functions), .(functions, arguments)])

## ---- eval = FALSE-------------------------------------------------------
#  # Load data.table
#  library(data.table)
#  library(irg)
#  
#  # Read in example data
#  ndvi <- fread(system.file('extdata', 'ndvi.csv', package = 'irg'))
#  
#  # Filter NDVI time series
#  filter_qa(ndvi, qa = 'SummaryQA', good = c(0, 1))
#  
#  filter_winter(ndvi, probs = 0.025, limits = c(60L, 300L),
#  							doy = 'DayOfYear', id = 'id')
#  
#  filter_roll(ndvi, window = 3L, id = 'id', method = 'median')
#  
#  filter_top(ndvi, probs = 0.925, id = 'id')
#  

## ------------------------------------------------------------------------
#  # Scale variables
#  scale_doy(ndvi, doy = 'DayOfYear')
#  scale_ndvi(ndvi)

## ------------------------------------------------------------------------
#  # Guess starting parameters
#  model_start(ndvi, id = 'id', year = 'yr')
#  
#  # Double logistic model parameters given starting parameters for nls
#  mods <- model_params(
#    ndvi,
#    returns = 'models',
#    id = 'id', year = 'yr',
#    xmidS = 'xmidS_start', xmidA = 'xmidA_start',
#    scalS = 0.05,
#    scalA = 0.01
#  )
#  
#  # Fit double log to NDVI
#  fit <- model_ndvi(mods, observed = FALSE)

## ------------------------------------------------------------------------
#  # Guess starting parameters
#  model_start(ndvi, id = 'id', year = 'yr')
#  
#  # Double logistic model parameters given starting parameters for nls
#  model_params(
#    ndvi,
#    returns = 'columns',
#    id = 'id', year = 'yr',
#    xmidS = 'xmidS_start', xmidA = 'xmidA_start',
#    scalS = 0.05,
#    scalA = 0.01
#  )
#  
#  # Fit double log to NDVI
#   model_ndvi(ndvi, observed = TRUE)

## ------------------------------------------------------------------------
#  # Calculate IRG for each day of the year
#  calc_irg(fit)
#  
#  # or for observed data
#  calc_irg(ndvi)

