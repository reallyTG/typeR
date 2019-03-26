## ------------------------------------------------------------------------
library("atlantistools")
library("ggplot2")
library("gridExtra")
library("dplyr")

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

## ------------------------------------------------------------------------
nums <- load_nc(nc = file.path(d, "outputSETAS.nc"), 
                fgs = file.path(d, "SETasGroupsDem_NoCep.csv"), 
                bps = c("Filter_Shallow", "Filter_Other", "Filter_Deep", "Benthic_grazer", 
                        "Macrobenth_Deep", "Megazoobenthos", "Macrobenth_Shallow", "Macroalgae"), 
                select_groups = c("Planktiv_S_Fish", "Pisciv_S_Fish"), 
                select_variable = "Nums", 
                prm_run = file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm"), 
                bboxes = c(0, 6, 7, 8, 9, 10))

## ------------------------------------------------------------------------
structn <- load_nc(nc = file.path(d, "outputSETAS.nc"), 
                fgs = file.path(d, "SETasGroupsDem_NoCep.csv"),  
                   bps = c("Filter_Shallow", "Filter_Other", "Filter_Deep", "Benthic_grazer", 
                           "Macrobenth_Deep", "Megazoobenthos", "Macrobenth_Shallow", "Macroalgae"), 
                   select_groups = c("Planktiv_S_Fish", "Pisciv_S_Fish"), 
                   select_variable = "StructN", 
                   prm_run = file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm"), 
                   bboxes = c(0, 6, 7, 8, 9, 10))

## ------------------------------------------------------------------------
boundary_boxes <- get_boundary(boxinfo = load_box(file.path(d, "VMPA_setas.bgm")))
epibenthic_groups <- load_bps(fgs = file.path(d, "SETasGroupsDem_NoCep.csv"), init = file.path(d, "INIT_VMPA_Jan2015.nc"))

resn <- load_nc(nc = file.path(d, "outputSETAS.nc"), 
                fgs = file.path(d, "SETasGroupsDem_NoCep.csv"), 
                bps = epibenthic_groups, 
                select_groups = c("Planktiv_S_Fish", "Pisciv_S_Fish"), 
                select_variable = "ResN", 
                prm_run = file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm"), 
                bboxes = boundary_boxes)

## ------------------------------------------------------------------------
grazing <- load_nc(nc = file.path(d, "outputSETASPROD.nc"), 
                   fgs = file.path(d, "SETasGroupsDem_NoCep.csv"), 
                   bps = epibenthic_groups, 
                   select_groups = c("Megazoobenthos", "Cephalopod"), 
                   select_variable = "Grazing", 
                   prm_run = file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm"), 
                   bboxes = boundary_boxes)

## ------------------------------------------------------------------------
physics <- load_nc_physics(nc = file.path(d, "outputSETAS.nc"), select_physics = "volume", 
                           prm_run = file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm"),
                           bboxes = boundary_boxes, aggregate_layers = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  structn <- load_nc(nc = "outputSETAS.nc",
#                     fgs = "SETasGroupsDem_NoCep.csv",
#                     bps = c("Filter_Shallow", "Filter_Other", "Filter_Deep", "Benthic_grazer",
#                             "Macrobenth_Deep", "Megazoobenthos", "Macrobenth_Shallow", "Macroalgae"),
#                     select_groups = c("Planktiv_S_Fish", "Pisciv_S_Fish"),
#                     select_variable = "StructN",
#                     prm_run = "VMPA_setas_run_fishing_F_Trunk.prm",
#                     bboxes = c(0, 6, 7, 8, 9, 10))

## ---- eval = FALSE-------------------------------------------------------
#  structn <- load_nc(nc = "output\outputSETAS.nc",
#                     fgs = "SETasGroupsDem_NoCep.csv",
#                     bps = c("Filter_Shallow", "Filter_Other", "Filter_Deep", "Benthic_grazer",
#                             "Macrobenth_Deep", "Megazoobenthos", "Macrobenth_Shallow", "Macroalgae"),
#                     select_groups = c("Planktiv_S_Fish", "Pisciv_S_Fish"),
#                     select_variable = "StructN",
#                     prm_run = "VMPA_setas_run_fishing_F_Trunk.prm",
#                     bboxes = c(0, 6, 7, 8, 9, 10))

## ------------------------------------------------------------------------
bboxes <- get_boundary(boxinfo = load_box(file.path(d, "VMPA_setas.bgm")))
nc_gen   <- file.path(d, "outputSETAS.nc")
nc_prod  <- file.path(d, "outputSETASPROD.nc")
prm_run  <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs      <- file.path(d, "SETasGroupsDem_NoCep.csv")
bps <- load_bps(fgs = fgs, init = file.path(d, "INIT_VMPA_Jan2015.nc"))
bio_conv <- get_conv_mgnbiot(prm_biol = prm_biol)

groups_age <- c("Planktiv_S_Fish", "Pisciv_S_Fish")
groups_rest <- c("Cephalopod", "Megazoobenthos", "Diatom", "Lab_Det", "Ref_Det")

nums <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
                select_groups = groups_age, select_variable = "Nums",
                prm_run = prm_run, bboxes = bboxes)
sn <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
              select_groups = groups_age, select_variable = "StructN",
              prm_run = prm_run, bboxes = bboxes)
rn <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
              select_groups = groups_age, select_variable = "ResN",
              prm_run = prm_run, bboxes = bboxes)
n <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
             select_groups = groups_rest, select_variable = "N",
             prm_run = prm_run, bboxes = bboxes)
vol <- load_nc_physics(nc = nc_gen, select_physics = c("volume", "dz"),
                       prm_run = prm_run, bboxes = bboxes, aggregate_layers = F)

df_bio_spatial <- calculate_biomass_spatial(nums = nums, sn = sn, rn = rn, n = n, vol_dz = vol,
                                            bio_conv = bio_conv, bps = bps)

## ------------------------------------------------------------------------
bboxes <- get_boundary(boxinfo = load_box(file.path(d, "VMPA_setas.bgm")))
nc_gen   <- file.path(d, "outputSETAS.nc")
nc_prod  <- file.path(d, "outputSETASPROD.nc")
prm_run  <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs      <- file.path(d, "SETasGroupsDem_NoCep.csv")
bps <- load_bps(fgs = fgs, init = file.path(d, "INIT_VMPA_Jan2015.nc"))
bio_conv <- get_conv_mgnbiot(prm_biol = prm_biol)

groups_age <- c("Planktiv_S_Fish", "Pisciv_S_Fish")
groups_rest <- c("Cephalopod", "Megazoobenthos", "Diatom", "Lab_Det", "Ref_Det")

df_eat <- load_nc(nc = nc_prod, bps = bps, fgs = fgs,
               select_groups = groups_age, select_variable = "Eat",
               prm_run = prm_run, bboxes = bboxes)
df_grz <- load_nc(nc = nc_prod, bps = bps, fgs = fgs,
               select_groups = groups_rest, select_variable = "Grazing",
               prm_run = prm_run, bboxes = bboxes)
df_dm <- load_dietcheck(dietcheck = file.path(d, "outputSETASDietCheck.txt"),
                        fgs = fgs, prm_run = prm_run, version_flag = 2, convert_names = TRUE)
vol <- load_nc_physics(nc = nc_gen, select_physics = "volume",
                       prm_run = prm_run, bboxes = bboxes, aggregate_layers = F)

df_cons <- calculate_consumed_biomass(eat = df_eat, grazing = df_grz, dm = df_dm,
                                      vol = vol, bio_conv = bio_conv)

## ------------------------------------------------------------------------
# Aggregate spatial biomass!
biomass <- df_bio_spatial %>%
  agg_data(groups = c("species", "time"), fun = sum)

plot_line(biomass, ncol = 3)
plot_line(biomass, col = "species", ncol = 3)

# Aggregate spatial biomass for fully age structured groups!
biomass_age <- df_bio_spatial %>%
  filter(agecl > 2) %>%
  agg_data(groups = c("species", "agecl", "time"), fun = sum)

plot_line(biomass_age, col = "agecl")
plot_line(biomass_age, wrap = "agecl", col = "species", ncol = 3)

## ------------------------------------------------------------------------
ex_data <- read.csv(file.path(system.file("extdata", "setas-model-new-becdev", package = "atlantistools"), 
                              "setas-bench.csv"), stringsAsFactors = FALSE)
names(ex_data)[names(ex_data) == "biomass"] <- "atoutput"

data <- biomass
data$model <- "atlantis"
comp <- rbind(ex_data, data, stringsAsFactors = FALSE)

# Show atlantis as first factor!
comp$model <- factor(comp$model, levels = c("atlantis", sort(unique(comp$model))[sort(unique(comp$model)) != "atlantis"]))

# Create plot
plot_line(comp, col = "model", ncol = 3)

## ------------------------------------------------------------------------
# Use convert_relative_initial and {plot_add_box with plot_line.
# Firstly, use convert_relative_initial to generate a relative time series first.
# Aggregate the polygon and layer based data first.
structn_age <- agg_data(data = structn,  groups = c("species", "time", "agecl"), fun = mean)
df <- convert_relative_initial(structn_age)

# Create the base plot with plot_line.
plot <- plot_line(df, col = "agecl")

# Add lower and upper range.
plot_add_box(plot)

# You can set the upper and lower range of the box as you like!
plot_add_box(plot, range = c(0.8, 0.4))

## ------------------------------------------------------------------------
# Create spatial timeseries plots in conjuction with custom_grid to plot physics data.
plot <- plot_line(ref_physics, wrap = NULL)
custom_grid(plot, grid_x = "polygon", grid_y = "variable")

flux <- load_nc_physics(nc = nc_gen, select_physics = c("eflux", "vflux"),
                        prm_run = prm_run, bboxes = bboxes, aggregate_layers = FALSE)

plot <- plot_line(flux, wrap = NULL, col = "variable")
custom_grid(plot, grid_x = "polygon", grid_y = "layer")

## ---- fig.width = 7, fig.height = 5--------------------------------------
bgm_data <- convert_bgm(file.path(d, "VMPA_setas.bgm"))
plot_boxes(bgm_data)

## ------------------------------------------------------------------------
# Aggregate numbers.
nums_age <- agg_data(data = nums, groups = c("species", "agecl", "time"), fun = sum)

# Use agg_perc together with plot_bar to visualise the relative cohort structure over time.
df <- agg_perc(nums_age, groups = c("time", "species"))
plot_bar(df, fill = "agecl", wrap = "species")

df <- agg_perc(biomass_age, groups = c("time", "species"))
plot_bar(df, fill = "agecl", wrap = "species")

## ------------------------------------------------------------------------
feeding_plots <- plot_diet(df_cons, wrap_col = "agecl")
gridExtra::grid.arrange(feeding_plots[[1]])
gridExtra::grid.arrange(feeding_plots[[7]])

# Apply names() to the list of table-grobs to extract the predator name
names(feeding_plots)

## ---- eval = FALSE-------------------------------------------------------
#  # Save all plots to disc in multiple pdfs!
#  for (i in seq_along(feeding_plots)) {
#    pdf(file.path(d, paste0("feeding", i, ".pdf")), width = 14, height = 10)
#    grid.arrange(feeding_plots[[i]])
#    dev.off()
#  }
#  
#  # Save all plots to disc in one pdf!
#  pdf(file.path(d, "feeding.pdf"), width = 14, height = 10)
#  marrangeGrob(feeding_plots, nrow = 1, ncol = 1)
#  dev.off()

## ------------------------------------------------------------------------
new_prm <-  change_prm(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"), 
                       select_acronyms = "FPS", 
                       roc = 2, 
                       parameter = "KWRR", 
                       save_to_disc = FALSE)

## ------------------------------------------------------------------------
extract_prm(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"), variables = "KWRR_FPS")
extract_prm(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"), variables = "KWSR_FPS")

## ------------------------------------------------------------------------
new_prm <-  change_prm(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"), 
                       select_acronyms = c("FPL", "FPO", "FPS", "FVD", "FVV", "FVS", "FVB", "FVT", "FVO"), 
                       roc = runif(n = 9, min = 2, max = 5), 
                       parameter = "KWRR", 
                       save_to_disc = FALSE)

## ------------------------------------------------------------------------
new_prm <-  change_prm_cohort(prm_biol = file.path(d, "VMPA_setas_biol_fishing_Trunk.prm"), 
                              select_acronyms = c("FPL", "FPO"), 
                              roc = matrix(rep(2, times = 20), nrow = 2, ncol = 10), 
                              parameter = "C", 
                              save_to_disc = FALSE)

