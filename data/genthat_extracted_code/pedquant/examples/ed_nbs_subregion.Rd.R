library(pedquant)


### Name: ed_nbs_subregion
### Title: subregion code of NBS economic data
### Aliases: ed_nbs_subregion

### ** Examples

# province code 
prov1 = ed_nbs_subregion(geo_type = 'province') 
# or using 'p' represents 'province'
prov2 = ed_nbs_subregion(geo_type = 'p') 

# city code in Chinese
city = ed_nbs_subregion(geo_type = 'c', eng = FALSE) 
# city code in English
city = ed_nbs_subregion(geo_type = 'c', eng = TRUE) 




