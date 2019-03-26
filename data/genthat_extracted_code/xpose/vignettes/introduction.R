## ---- include = FALSE----------------------------------------------------
library(xpose)

xpdb <- xpdb_ex_pk %>% 
  set_var_types(idv = 'TIME')

knitr::opts_chunk$set(fig.dpi    = 96,
                      fig.align  = 'center', 
                      fig.height = 4, 
                      fig.width  = 4,
                      out.width  = '50%',
                      comment    = '',
                      message    = FALSE)

## ----demo print xpose_data-----------------------------------------------
xpdb # or print(xpdb)

## ----demo xpose summary--------------------------------------------------
summary(xpdb)

## ----demo prm_table------------------------------------------------------
prm_table(xpdb)

## ----demo list_vars------------------------------------------------------
list_vars(xpdb)

## ---- eval = FALSE-------------------------------------------------------
#  xpose_data(runno = '001') %>%
#    dv_vs_ipred() %>%
#    xpose_save(file = 'run001_dv_vs_ipred.pdf')

## ---- change idv---------------------------------------------------------
# With the TIME default
xpdb %>% 
  dv_vs_idv()

# After IDV reassignment
xpdb %>% 
  set_var_types(idv = 'TAD') %>% 
  dv_vs_idv()

## ----demo basic gof------------------------------------------------------
# DV vs. IPRED plot
dv_vs_ipred(xpdb)

# CWRES vs. PRED plot
res_vs_pred(xpdb, res = 'CWRES')

## ---- eval = FALSE-------------------------------------------------------
#  # Save the last generated plot
#  dv_vs_ipred(xpdb)
#  xpose_save(file = 'run001_dv_vs_ipred.pdf')
#  
#  # Template titles can also be used in filename and the directory
#  xpdb %>%
#   dv_vs_ipred() %>%
#   xpose_save(file = '@run_@plotfun_[@ofv].jpeg', dir = '@dir')

