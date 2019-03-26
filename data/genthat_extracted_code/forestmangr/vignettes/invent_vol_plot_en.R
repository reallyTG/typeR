## ---- echo = FALSE, message = FALSE--------------------------------------
knitr::opts_chunk$set(collapse = T, comment = "#>")
knitr::opts_chunk$set(fig.width=7, fig.height=5)
options(tibble.print_min = 6L, tibble.print_max = 6L)
library(forestmangr)
library(dplyr)

## ------------------------------------------------------------------------
library(forestmangr)
library(dplyr)
data(exfm9)
data_ex <- exfm9
data_ex

## ------------------------------------------------------------------------
dom_height(df=data_ex,th="TH",dbh="DBH",plot="PLOT",obs="OBS",dom="D")

## ------------------------------------------------------------------------
data_ex <- dom_height(data_ex,"TH","DBH","PLOT","OBS","D",merge_data = TRUE)
head(as.data.frame(data_ex))

## ------------------------------------------------------------------------
data_ex <- data_ex %>% 
  lm_table(log(TH) ~ inv(DBH) + log(DH),output="merge_est",est.name="CL") %>% 
  lm_table(log(TH) ~ log(DBH), output="merge_est",est.name="Henricksen") 
head(data_ex)

## ---- warning=FALSE------------------------------------------------------
resid_plot(data_ex, "TH", "CL","Henricksen")

## ------------------------------------------------------------------------
 data_ex <- data_ex %>% 
  mutate( TH_EST = ifelse(is.na(TH), CL, TH ), CL=NULL,Henricksen=NULL )
head(data_ex)

## ------------------------------------------------------------------------
tabcoef_vwb <- data.frame(b0=-9.595863,b1=1.889372,b2=0.9071631)
tabcoef_vwb

## ------------------------------------------------------------------------
tabcoef_vwob <- data.frame(b0=-9.808975,b1=1.918007,b2=0.908154)
tabcoef_vwob

## ------------------------------------------------------------------------
data_ex <- data_ex %>% 
    mutate(CSA = pi*DBH^2/40000,
         AGE = as.numeric(MEASUREMENT_DATE - PLANTING_DATE) / 30,
         VWB = exp(tabcoef_vwb$b0 + tabcoef_vwb$b1*log(DBH) + tabcoef_vwb$b2*log(TH_EST) ),
         VWOB = exp(tabcoef_vwob$b0 + tabcoef_vwob$b1*log(DBH) + tabcoef_vwob$b2*log(TH_EST) ) )
head(data_ex)

## ------------------------------------------------------------------------
tab_invt <- plot_summarise(df=data_ex,plot="PLOT",plot_area="PLOT_AREA",dbh="DBH",                           th="TH_EST",total_area="STRATA_AREA",vwb="VWB",vwob="VWOB",dh="DH",age="AGE")
head(as.data.frame(tab_invt))   

