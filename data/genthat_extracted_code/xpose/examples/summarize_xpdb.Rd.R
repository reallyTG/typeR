library(xpose)


### Name: summarize_xpdb
### Title: Group/ungroup and summarize variables in an xpdb
### Aliases: summarize_xpdb group_by.xpose_data ungroup.xpose_data
###   summarize.xpose_data summarise.xpose_data

### ** Examples

# Create a distribution plot of Cmax
xpdb_ex_pk %>% 
 group_by(ID, SEX, .problem = 1) %>% 
 summarize(CMAX = max(DV), .problem = 1) %>% 
 ungroup(.problem = 1) %>% 
 xplot_distrib(aes(x = CMAX, density_fill = SEX), type = 'dr')
 



