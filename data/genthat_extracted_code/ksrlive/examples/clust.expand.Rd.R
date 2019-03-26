library(ksrlive)


### Name: clust.expand
### Title: Find clusters containing core substrates
### Aliases: clust.expand

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

target <- 3
substrate_profiles_tight <- lapply(substrate_profiles_random, function(x){
tightClust::tight.clust(x, target = target, k.min = 7, resamp.num = 100, random.seed = 12345)
})

kin_clust<- mapply(function(x,y){clustering(x, y)}, 
                        substrate_profiles_tight, substrate_profiles, SIMPLIFY = FALSE)
                        
# do clustering using all available substrates
kin_data_fam <- KSR.list(phosphonetwork_data[, c("SUB_IDENT", "KIN_ACC_ID")], 
                         kinasefamilies = fam)

substrate_profiles_all <- lapply(kin_data_fam[c("P31749", "P42345")], 
function(x){data_kin[match(x, data_kin[,"SUB_IDENT"]),1:9]})

substrate_profiles_random_all <- lapply(substrate_profiles_all, 
                       function(x){rbind(x, random.data(x, random.seed = 123))})

target <- 3
substrate_profiles_tight_all <- lapply(substrate_profiles_random_all, function(x){
tightClust::tight.clust(x, target = target, k.min = 7, resamp.num = 100, random.seed = 12345)
})

kin_clust_all <- mapply(function(x,y){clustering(x, y)}, 
                        substrate_profiles_tight_all, substrate_profiles_all, 
                        SIMPLIFY = FALSE)
                        
expand_all <- mapply(function(x,y){clust.expand(x, y)}, 
                        kin_clust, kin_clust_all, SIMPLIFY = FALSE)



