library(PKPDmisc)


### Name: auc_partial
### Title: Calculate partial AUC
### Aliases: auc_partial

### ** Examples

library(PKPDmisc)
library(dplyr, quiet = TRUE)
df <- capitalize_names(sd_oral_richpk) 
head(df)
df %>% group_by(ID) %>% 
summarize(pAUC0_10 = auc_partial(TIME, CONC, c(0,10)))

df %>% group_by(ID) %>% 
summarize(auc0_tlast = auc_partial(TIME, CONC)) 



