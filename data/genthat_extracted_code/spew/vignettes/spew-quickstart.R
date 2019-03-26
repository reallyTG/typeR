## ---- include=FALSE------------------------------------------------------
library(knitr) # We need the knitr package to set chunk options
# Set default knitr options for knitting code into the report:
# opts_chunk$set(cache=TRUE, autodep=TRUE, cache.comments=FALSE)

## ---- eval = FALSE-------------------------------------------------------
#    install.packages("spew")

## ------------------------------------------------------------------------
library(spew)

## ---- warning = FALSE, results = 'hide', echo = TRUE, message = FALSE----
data(tartanville)

tartanville_syneco <- spew(tartanville$pop_table, tartanville$shapefile,
                            tartanville$pums_h, tartanville$pums_p)

plot_syneco(tartanville, tartanville_syneco, region_name = "Tartanville")

out <-  summarize_spew_out(tartanville_syneco, vars_to_sum_h = c("puma_id"),
                            vars_to_sum_p = c("SEX"),
                           vars_to_sum_env = NULL, top_region_id = "Tartanville")
print(out)

g <- plot_characteristic_proportions(feature_name = "Sex", legend_name = "Sex",
                                feature_df = out$SEX,
                                category_names = c("Male", "Female"),
                                text_size = 10,
                                region_colors = c("lightslateblue", "maroon1"))

g <- plot_pop_totals(feature_df = out$pop_totals, type = "n_people")

## ------------------------------------------------------------------------
data(tartanville)
shapefile <- list(boundaries = tartanville$shapefile, roads = tartanville$roads)

tartanville_syneco <- spew(tartanville$pop_table, shapefile,
                            tartanville$pums_h, tartanville$pums_p,
                            locations_method = "roads", road_noise = .05)

plot_syneco(tartanville, tartanville_syneco, region_name = "Tartanville")

## ------------------------------------------------------------------------
NP_avg <- c(3.2, 0, 6.0,
            2.0, 3.2, 3.1,
            4.0, 4.8, 3.9)
supplementary_data <- list(moments = make_mm_obj(moments_list =
                           list(mom1 = data.frame(place_id = paste0("T", 1:9),
                                                  puma_id = "T",
                                                  NP = NP_avg)),
                           assumption = "independence",
                                nMom = 1, type = "cont"))

## ---- warnings = FALSE---------------------------------------------------
data(tartanville)
tartanville_syneco_mm <- spew(pop_table = tartanville$pop_table, 
                              shapefile = tartanville$shapefile,
                              pums_h = tartanville$pums_h, 
                              pums_p = tartanville$pums_p,
                              marginals = supplementary_data$moments, 
                              sampling_method = "mm")

non_empty_regions <- sapply(tartanville_syneco_mm, class) == "list"
synthetic_NP_avg <- sapply(tartanville_syneco_mm[non_empty_regions], function(ll){
    mean(ll$households$NP, na.rm = TRUE)
    })
sum(abs(synthetic_NP_avg - NP_avg[-2]))


# Comparing to uniform sampling
synthetic_NP_avg_unif<- sapply(tartanville_syneco[non_empty_regions], function(ll){
    mean(ll$households$NP, na.rm = TRUE)
    })
sum(abs(synthetic_NP_avg_unif- NP_avg[-2]))

## ------------------------------------------------------------------------
## Income
var_name <- "HHINC"
## How to cut the variable
type <- "ord"
bounds <- data.frame(lower = c(0, 50), upper = c(49, Inf))
category_name <- c("HHINC_0-49", "HHINC_50-Inf")
## How often we expect to see each category for each region.
df <- data.frame(place_id = paste0("T", 1:9),  v1 = c(30, 0, 5, 10, 13, 9, 2, 1, 5))
df$v2 <- tartanville$pop_table$n_house - df$v1
#
ipf_obj_hhinc<- make_ipf_obj(var_name, type, bounds, category_name, df = df)

ipf_obj_hhinc

## Head of Household Race
var_name <- c("RAC1P")
type <- "cat"
bounds <- data.frame(lower = c(1, 2), upper = c(1, 2))
category_name <- c("Tartan", "Argyle")
df2 <- data.frame(place_id = paste0("T", 1:9),  v1 = c(28, 0, 4, 1, 5, 8, 2, 1, 3))
df2$v2 <- tartanville$pop_table$n_house - df2$v1
ipf_obj_rac1p <- make_ipf_obj(var_name, type, bounds, category_name, df = df2)

# Combine both together
ipf_obj <- list(HHINC = ipf_obj_hhinc[[1]], RAC1P = ipf_obj_rac1p[[1]])
supplementary_data <- list(moments = ipf_obj)

## ------------------------------------------------------------------------
pums_h <- align_pums(tartanville$pums_h, ipf_obj, suffix = "_ipf") # split into categories
knitr::kable(head(pums_h))

## ---- warnings = FALSE---------------------------------------------------
tartanville_syneco_ipf <- spew(tartanville$pop_table, tartanville$shapefile,
                               pums_h, tartanville$pums_p,
                               marginals = supplementary_data$moments, 
                               sampling_method = "ipf")


out <-  summarize_spew_out(tartanville_syneco_ipf, vars_to_sum_h = c("HHINC_ipf", "RAC1P_ipf"),
                            vars_to_sum_p = c("SEX"),
                    vars_to_sum_env = NULL, top_region_id = "Tartanville",
                    marginals = supplementary_data$moments)

sum(abs(as.matrix(out$HHINC_ipf[order(out$HHINC_ipf$region), -3]) - as.matrix(df[-2, -1])))
sum(abs(as.matrix(out$RAC1P_ipf[order(out$HHINC_ipf$region), -3]) - as.matrix(df2[-2, -1])))

## ------------------------------------------------------------------------
knitr::kable(tartanville$environments)
tartanville_syneco <- spew(tartanville$pop_table, tartanville$shapefile,
                              tartanville$pums_h, tartanville$pums_p)

plot_syneco(tartanville, tartanville_syneco,
            region_name = "Tartanville")

## ------------------------------------------------------------------------
t1_people <- tartanville_syneco[[1]]$people
t1_students <- subset(t1_people, subset = (t1_people$AGEP >= 5 & t1_people$AGEP <= 18))
places <- subset(tartanville$environments, tartanville$environments$Type == "School")

## ------------------------------------------------------------------------
t1_assignments <- assign_place_coords(t1_students, places = places, place_name = "school")
table(t1_assignments$school)

## ------------------------------------------------------------------------
t1_assignments <- assign_place_coords(t1_students, places = places, place_name = "school", method = "capacity")
table(t1_assignments$school)

## ------------------------------------------------------------------------
data(tartanville)
names(tartanville)
class(tartanville)
lapply(tartanville, class)

## ------------------------------------------------------------------------
data(tartanville)
class(tartanville$roads)

