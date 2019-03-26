## ------------------------------------------------------------------------
library(santaR)

# data (keep the 3rd variable)
var1_data <- acuteInflammation$data[,3]
# metadata (common to all variables)
var1_meta <- acuteInflammation$meta

# 7 unique time-points
unique(var1_meta$time)
# 8 individuals
unique(var1_meta$ind)
# 2 groups
unique(var1_meta$group)

# 72 measurements for the given variable
var1_data

## ---- eval = FALSE-------------------------------------------------------
#  var1_input  <- get_ind_time_matrix( Yi=var1_data, ind=var1_meta$ind, time=var1_meta$time)
#  var1_input

## ---- results = "asis", echo = FALSE-------------------------------------
var1_input  <- get_ind_time_matrix( Yi=var1_data, ind=var1_meta$ind, time=var1_meta$time)
pander::pandoc.table(var1_input)

## ---- eval = FALSE-------------------------------------------------------
#  var1_group  <- get_grouping( ind=var1_meta$ind, group=var1_meta$group)
#  var1_group

## ---- results = "asis", echo = FALSE-------------------------------------
var1_group  <- get_grouping( ind=var1_meta$ind, group=var1_meta$group)
pander::pandoc.table(var1_group)

## ------------------------------------------------------------------------
var_eigen  <- get_eigen_spline( inputData=acuteInflammation$data, ind=acuteInflammation$meta$ind, time=acuteInflammation$meta$time)

## ---- eval=FALSE---------------------------------------------------------
#  # The projection of each eigen-spline at each time-point:
#  var_eigen$matrix

## ---- results = "asis", echo = FALSE-------------------------------------
pander::pandoc.table(var_eigen$matrix)

## ------------------------------------------------------------------------
# The variance explained by each eigen-spline
var_eigen$variance
# PCA summary
summary(var_eigen$model)

## ---- eval = FALSE-------------------------------------------------------
#  # The projection of each eigen-spline at each time-point:
#  get_eigen_DF(var_eigen)
#  
#  # $df

## ---- results = "asis", echo = FALSE-------------------------------------
tmpDF <- get_eigen_DF(var_eigen)
pander::pandoc.table(tmpDF$df)

## ---- eval = FALSE-------------------------------------------------------
#  # $wdf

## ---- results = "asis", echo = FALSE-------------------------------------
pander::pandoc.table(tmpDF$wdf)

## ---- fig.width = 7, fig.height = 7, dpi = 80----------------------------
library(gridExtra)

# generate all the parameter values across df
var_eigen_paramEvo  <- get_param_evolution(var_eigen, step=0.1)

# plot the metric evolution
plot(arrangeGrob(grobs=plot_param_evolution(var_eigen_paramEvo, scaled=FALSE)))

# Scale the metrics for each eigen-spline between 0 and 1
plot(arrangeGrob(grobs=plot_param_evolution(var_eigen_paramEvo, scaled=TRUE)))

## ---- fig.width = 8, fig.height =8, dpi = 90-----------------------------
library(gridExtra)

# plot all eigen-projections
plot(arrangeGrob(grobs=get_eigen_DFoverlay_list(var_eigen, manualDf = 5)))

## ---- fig.width = 7, fig.height = 5, dpi = 80----------------------------
# dfCutOff controls which cut-off is to be applied
plot_nbTP_histogram(var_eigen, dfCutOff=5)

## ------------------------------------------------------------------------
var1 <- santaR_fit(var1_input, df=5, groupin=var1_group)

# it is possible to access the SANTAObj structure, which will be filled in the following steps
var1$properties
var1$general
var1$groups$Group1

## ------------------------------------------------------------------------
var1 <- santaR_CBand(var1)

## ---- fig.width = 7, fig.height = 5, dpi = 96----------------------------
santaR_plot(var1)

## ------------------------------------------------------------------------
var1 <- santaR_pvalue_dist(var1)
# p-value
var1$general$pval.dist
# lower p-value confidence range
var1$general$pval.dist.l
# upper p-value confidence range
var1$general$pval.dist.u
# curve correlation coefficiant
var1$general$pval.curveCorr

