## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----example, eval=FALSE-------------------------------------------------
#  ## Basic example using the default cutoff
#  slide(infected = I_sig, uninfected = UN_sig)
#  
#  ## Using bootstrap to determine cutoff, then running SLIDE
#  cutoff <- bootstrap_cutoff(uninfected = UN_sig, fraction = (nrow(I_sig)/nrow(UN_sig)), iter = 40)
#  slide(infected = I_sig, uninfected = UN_sig, cutoff = cutoff)
#  

