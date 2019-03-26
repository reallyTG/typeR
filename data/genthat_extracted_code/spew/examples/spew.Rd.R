library(spew)


### Name: spew
### Title: SPEW algorithm to generate synthetic ecosystems
### Aliases: spew

### ** Examples

# Call spew with default data from tartanville ---
data(tartanville)
tartanville_syneco <- spew(pop_table = tartanville$pop_table, 
                           shapefile = tartanville$shapefile, 
                           pums_h = tartanville$pums_h, 
                           pums_p = tartanville$pums_p)
                           
# Call spew with road-based location sampling ---
roads_shapefile <- list(boundaries = tartanville$shapefile, 
                        roads = tartanville$roads)                            
tartanville_syneco_roads <- spew(tartanville$pop_table, roads_shapefile,
                                 tartanville$pums_h, tartanville$pums_p,
                                 locations_method = "roads", road_noise = .05)

# Call spew with ipf agent-sampling ---

# Household income marginal 
var_name <- "HHINC"
type <- "ord"
bounds <- data.frame(lower = c(0, 50), upper = c(49, Inf))
category_name <- c("HHINC_0-49", "HHINC_50-Inf")
df <- data.frame(place_id = paste0("T", 1:9),  v1 = c(30, 0, 5, 10, 13, 9, 2, 1, 5))
df$v2 <- tartanville$pop_table$n_house - df$v1
ipf_obj_hhinc<- make_ipf_obj(var_name, type, bounds, category_name, df = df)
# Head of Household Race Marginal 
var_name <- c("RAC1P")
type <- "cat"
bounds <- data.frame(lower = c(1, 2), upper = c(1, 2))
category_name <- c("Tartan", "Argyle")
df2 <- data.frame(place_id = paste0("T", 1:9),  v1 = c(28, 0, 4, 1, 5, 8, 2, 1, 3))
df2$v2 <- tartanville$pop_table$n_house - df2$v1
ipf_obj_rac1p <- make_ipf_obj(var_name, type, bounds, category_name, df = df2)
ipf_obj <- list(HHINC = ipf_obj_hhinc[[1]], RAC1P = ipf_obj_rac1p[[1]])
supplementary_data <- list(moments = ipf_obj)

tartanville_syneco_ipf <- spew(tartanville$pop_table, tartanville$shapefile,
                              tartanville$pums_h, tartanville$pums_p,
                               marginals = supplementary_data$moments, 
                              sampling_method = "ipf")

# Call spew with moment-matching agent-sampling 
NP_avg <- c(3.2, 0, 6.0, 2.0, 3.2, 3.1, 4.0, 4.8, 3.9)
supplementary_data <- list(moments = make_mm_obj(moments_list = 
                           list(mom1 = data.frame(place_id = paste0("T", 1:9), 
                                puma_id = "T", NP = NP_avg)), 
                           assumption = "independence", nMom = 1, type = "cont"))
tartanville_syneco_mm <- spew(pop_table = tartanville$pop_table, 
                             shapefile = tartanville$shapefile,
                             pums_h = tartanville$pums_h, 
                             pums_p = tartanville$pums_p,
                             marginals = supplementary_data$moments, 
                             sampling_method = "mm")




