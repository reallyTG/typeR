library(emdi)


### Name: data_transformation
### Title: Tranforms dependent variables
### Aliases: data_transformation

### ** Examples

# Loading data - sample data
data("eusilcA_smp")

# Transform dependent variable in sample data with Box-Cox transformation
transform_data <- data_transformation(eqIncome ~ gender + eqsize + cash + 
self_empl + unempl_ben + age_ben + surv_ben + sick_ben + dis_ben + rent + 
fam_allow + house_allow + cap_inv + tax_adj, eusilcA_smp, "box.cox", 0.7)



