library(MPTmultiverse)


### Name: fit_mpt
### Title: Multiverse Analysis for MPT Models
### Aliases: fit_mpt

### ** Examples


# ------------------------------------------------------------------------------
# MPT model definition & Data

EQN_FILE <- system.file("extdata", "prospective_memory.eqn", package = "MPTmultiverse")
DATA_FILE <- system.file("extdata", "smith_et_al_2011.csv", package = "MPTmultiverse")

### if .csv format uses semicolons ";" (e.g., German format):
# data <- read.csv2(DATA_FILE, fileEncoding = "UTF-8-BOM")
### if .csv format uses commata "," (international format):
data <- read.csv(DATA_FILE, fileEncoding = "UTF-8-BOM")
data <- data[c(1:10, 113:122),]  ## select only subset of data for example
head(data)

COL_CONDITION <- "WM_EX"  # name of the variable encoding group membership

# experimental condition should be labeled meaningfully ----
unique(data[[COL_CONDITION]])

data[[COL_CONDITION]] <- factor(
  data[[COL_CONDITION]]
  , levels = 1:2
  , labels = c("low_WM", "high_WM")
)

# define core parameters:
CORE <- c("C1", "C2")

## Not run: 
##D op <- mpt_options() 
##D ## to reset default options (which you would want) use:
##D mpt_options("default")
##D 
##D mpt_options() # to see the settings 
##D ## Note: settings are also saved in the results tibble
##D   
##D ## without specifying method, all are used per default
##D fit_all <- fit_mpt(
##D   model = EQN_FILE
##D   , dataset = DATA_FILE
##D   , data = data
##D   , condition = COL_CONDITION
##D   , core = CORE
##D )
##D 
##D mpt_options(op) ## reset options  
## End(Not run)

load(system.file("extdata", "prospective_memory_example.rda", package = "MPTmultiverse"))

# Although we requested all 10 methods, only 9 worked:
fit_all$method
# Jags variant of beta MPT is missing.

# the returned method has a plot method. For example, for the group-level estimates:
plot(fit_all, which = "est")

## Not run: 
##D ### Full analysis of results requires dplyr and tidyr (or just 'tidyverse')
##D library("dplyr")
##D library("tidyr")
##D 
##D ## first few columns identify model, data, and estimation approach/method
##D ## remaining columns are list columns containing the results for each method
##D ## use unnest to work with each of the results columns
##D glimpse(fit_all) 
##D 
##D ## Let us inspect the group-level estimates
##D fit_all %>% 
##D   select(method, pooling, est_group) %>% 
##D   unnest() 
##D 
##D ## which we can plot again
##D plot(fit_all, which = "est")
##D 
##D ## Next we take a look at the GoF
##D fit_all %>% 
##D   select(method, pooling, gof_group) %>% 
##D   unnest() %>% 
##D   as.data.frame()
##D 
##D # Again, we can plot it as well
##D plot(fit_all, which = "gof2")  ## use "gof1" for overall GoF
##D 
##D ## Finally, we take a look at the differences between conditions
##D fit_all %>% 
##D   select(method, pooling, test_between) %>% 
##D   unnest() 
##D 
##D # and then we plot it
##D plot(fit_all, which = "test_between")
##D 
##D 
##D ### Also possible to only use individual methods:
##D only_asymptotic <- fit_mpt(
##D   model = EQN_FILE
##D   , dataset = DATA_FILE
##D   , data = data
##D   , condition = COL_CONDITION
##D   , core = CORE
##D   , method = "asymptotic_no"
##D )
##D only_asymptotic$est_group
##D 
##D bayes_complete <- fit_mpt(
##D   model = EQN_FILE
##D   , dataset = DATA_FILE
##D   , data = data
##D   , condition = COL_CONDITION
##D   , core = CORE
##D   , method = "simple_pooling"
##D )
##D bayes_complete$est_group
##D 
## End(Not run)



