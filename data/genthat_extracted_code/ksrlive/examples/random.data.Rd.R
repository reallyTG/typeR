library(ksrlive)


### Name: random.data
### Title: Create random data
### Aliases: random.data

### ** Examples

data(phosphonetworkdf)
data(datakin)
# only need what is present in data
phosphonetwork_data <- phosphonetwork_df[
phosphonetwork_df[,"SUB_IDENT"] %in% data_kin[,"SUB_IDENT"]
,]
fam <- list(akt = c("P31749", "P31751"))
kin_data_fam_exc <- KSR.list(phosphonetwork_data[, c("SUB_IDENT", "KIN_ACC_ID")], 
                             kinasefamilies = fam,
                             exclusive = TRUE)
# only do for Akt and Mtor (P31749, P42345)
substrate_profiles <- lapply(kin_data_fam_exc[c("P31749", "P42345")], 
function(x){data_kin[match(x, data_kin[,"SUB_IDENT"]),1:9]})

substrate_profiles_random <- lapply(substrate_profiles, 
function(x){rbind(x, random.data(x, random.seed = 123))})



