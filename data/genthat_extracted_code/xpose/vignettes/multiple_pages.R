## ---- include = FALSE-----------------------------------------------------------------------------
library(xpose)
options(width = 100)

xpdb <- xpdb_ex_pk

knitr::opts_chunk$set(fig.dpi    = 96,
                      fig.align  = 'center', 
                      fig.height = 4, 
                      fig.width  = 6,
                      out.width  = '75%',
                      comment    = '',
                      message    = FALSE)

## ----demo panels, fig.height = 6------------------------------------------------------------------
# Example with a string
dv_vs_ipred(xpdb, facets = c('SEX', 'MED1'))

# Example with a formula
dv_vs_ipred(xpdb, facets = SEX~MED1, margins = TRUE)

## ---- message = FALSE-----------------------------------------------------------------------------
dv_vs_ipred(xpdb, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1)

## ---- messages = TRUE-----------------------------------------------------------------------------
dv_vs_ipred(xpdb, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1, page = 1)

## ---- eval = FALSE--------------------------------------------------------------------------------
#  # Create an xpose_plot, by default page = 1
#  p1 <- dv_vs_ipred(xpdb, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1)
#  
#  # Change the page to be drawn
#  print(p1, page = 2)

## -------------------------------------------------------------------------------------------------
dv_vs_ipred(xpdb, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1, page = 1, caption = 'Page @page of @lastpage')

## -------------------------------------------------------------------------------------------------
xpdb_numbered <- update_themes(xpdb, xp_theme = list(caption_suffix = ', page @page of @lastpage'))

dv_vs_ipred(xpdb_numbered, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1, page = 2)

## ---- eval = FALSE--------------------------------------------------------------------------------
#  dv_vs_ipred(xpdb_numbered, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1) %>%
#  xpose_save(file = 'dv_vs_ipred_multiple.pdf')

## ---- eval = FALSE--------------------------------------------------------------------------------
#  dv_vs_ipred(xpdb_numbered, facets = c('SEX', 'MED1'), ncol = 2, nrow = 1) %>%
#  xpose_save(file = '@run_@plotfun_%03d.png')

