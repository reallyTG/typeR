## ------------------------------------------------------------------------
library("atlantistools")
library("ggplot2")
library("gridExtra")

fig_height2 <- 11
gen_labels <- list(x = "Time [years]", y = "Biomass [t]")

# You should be able to build the vignette either by clicking on "Knit PDF" in RStudio or with
# rmarkdown::render("model-calibration.Rmd")

## ------------------------------------------------------------------------
result <- preprocess

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

# External recruitment data
ex_rec_ssb <- read.csv(file.path(d, "setas-ssb-rec.csv"), stringsAsFactors = FALSE)

# External biomass data
ex_bio <- read.csv(file.path(d, "setas-bench.csv"), stringsAsFactors = FALSE)

# bgm file
bgm <- file.path(d, "VMPA_setas.bgm")

## ---- fig.width = 14, fig.height = 8-------------------------------------
df_bio <- combine_groups(result$biomass, group_col = "species", combine_thresh = 10)
plot <- plot_bar(df_bio)
update_labels(plot, labels = gen_labels)

## ------------------------------------------------------------------------
plot <- plot_line(result$biomass)
update_labels(plot, labels = gen_labels)

## ------------------------------------------------------------------------
plot <- plot_line(result$biomass_age, col = "agecl")
update_labels(p = plot, labels = c(gen_labels, list(colour = "Ageclass")))

## ---- fig.height = fig_height2-------------------------------------------
plot <- plot_line(result$nums)
update_labels(p = plot, labels = list(x = "Time [years]", y = "Numbers"))

## ---- fig.height = fig_height2-------------------------------------------
plot <- plot_line(result$nums_age, col = "agecl")
update_labels(p = plot, labels = list(x = "Time [years]", y = "Numbers", colour = "Ageclass"))

## ------------------------------------------------------------------------
plot_rec(result$ssb_rec, ex_data = ex_rec_ssb)

## ------------------------------------------------------------------------
names(ex_bio)[names(ex_bio) == "biomass"] <- "atoutput"

data <- result$biomass
data$model <- "atlantis"
comp <- rbind(ex_bio, data, stringsAsFactors = FALSE)

# Show atlantis as first factor!
comp$model <- factor(comp$model, levels = c("atlantis", sort(unique(comp$model))[sort(unique(comp$model)) != "atlantis"]))

# Create plot
plot <- plot_line(comp, col = "model")
update_labels(plot, gen_labels)

## ------------------------------------------------------------------------
plot <- plot_line(result$biomass) %>% update_labels(labels = gen_labels)
plot_add_range(plot, ex_bio)

## ---- fig.width = 30, fig.height = 12------------------------------------
plot <- plot_line(result$physics, wrap = NULL)
custom_grid(plot, grid_x = "polygon", grid_y = "variable")

## ---- results = 'asis', fig.width = 30, fig.height = 12------------------
physics <- result$physics %>%
  flip_layers() %>%
  split(., .$variable)

plots <- lapply(physics, plot_line, wrap = NULL) %>% 
  lapply(., custom_grid, grid_x = "polygon", grid_y = "layer")

for (i in seq_along(plots)) {
  cat(paste0("## ", names(plots)[i]), sep = "\n")
  plot <- update_labels(plots[[i]], labels = list(y = names(plots)[i]))
  print(plot)
  cat("\n\n")
}

## ---- fig.width = 30, fig.height = 12------------------------------------
plot <- flip_layers(result$flux) %>% 
  plot_line(wrap = NULL, col = "variable")
custom_grid(plot, grid_x = "polygon", grid_y = "layer")

## ---- fig.width = 30, fig.height = 12------------------------------------
plot <- flip_layers(result$sink) %>% 
  plot_line(wrap = NULL, col = "variable")
custom_grid(plot, grid_x = "polygon", grid_y = "layer")

## ------------------------------------------------------------------------
check_dz <- result$dz %>% 
  dplyr::left_join(result$nominal_dz, by = c("polygon", "layer")) %>% 
  dplyr::mutate(check_dz = atoutput.x / atoutput.y) %>% 
  dplyr::filter(!is.na(check_dz)) # remove sediment layer

plot <- plot_line(check_dz, x = "time", y = "check_dz", wrap = "polygon", col = "layer")
update_labels(plot, list(x = "Time [years]", y = expression(dz/nominal_dz)))

## ---- fig.height = fig_height2-------------------------------------------
df_rel <- convert_relative_initial(result$structn_age)
plot <- plot_line(df_rel, col = "agecl")
plot <- update_labels(plot, list(x = "Time [years]", y = expression(SN/SN[init])))
plot_add_box(plot)

## ---- fig.height = fig_height2-------------------------------------------
df_rel <- convert_relative_initial(result$resn_age)
plot <- plot_line(df_rel, col = "agecl")
plot <- update_labels(plot, list(x = "Time [years]", y = expression(RN/RN[init])))
plot_add_box(plot)

## ---- fig.height = fig_height2-------------------------------------------
df_rel <- convert_relative_initial(result$biomass_age)
plot <- plot_line(df_rel, col = "agecl")
plot <- update_labels(plot, list(x = "Time [years]", y = expression(Biomass/Biomass[init])))
plot_add_box(plot)

## ---- fig.height = fig_height2-------------------------------------------
df_rel <- convert_relative_initial(result$eat_age)
plot <- plot_line(df_rel, col = "agecl")
plot <- update_labels(plot, list(x = "Time [years]", y = expression(Cons./Cons.[init])))
plot_add_box(plot)

## ---- fig.height = fig_height2-------------------------------------------
df_rel <- convert_relative_initial(result$growth_age)
plot <- plot_line(df_rel, col = "agecl")
plot <- update_labels(plot, list(x = "Time [years]", y = expression(Growth/Growth[init])))
plot_add_box(plot)

## ------------------------------------------------------------------------
plot <- plot_line(result$growth_rel_init, y = "gr_rel", col = "agecl")
update_labels(plot, list(y = expression((Growth - Growth[req])/Growth[req])))

## ---- fig.height = fig_height2-------------------------------------------
df_rel <- convert_relative_initial(result$nums_age)
plot <- plot_line(df_rel, col = "agecl")
plot <- update_labels(plot, list(x = "Time [years]", y = expression(Numbers/Numbers[init])))
plot_add_box(plot)

## ------------------------------------------------------------------------
df_rel <- convert_relative_initial(result$biomass)
plot <- plot_line(df_rel)
plot <- update_labels(plot, list(x = "Time [years]", y = expression(Biomass/Biomass[init])))
plot_add_box(plot)

## ---- fig.height = fig_height2-------------------------------------------
df <- agg_perc(result$nums_age, groups = c("time", "species"))
plot <- plot_bar(df, fill = "agecl", wrap = "species")
update_labels(plot, labels = list(x = "Time [years]", y = "Numbers [%]"))

## ---- fig.height = fig_height2-------------------------------------------
df <- agg_perc(result$biomass_age, groups = c("time", "species"))
plot <- plot_bar(df, fill = "agecl", wrap = "species")
update_labels(plot, labels = list(x = "Time [years]", y = "Biomass [%]"))

## ---- echo=FALSE, results = 'asis', fig.width = 14, fig.height = 9-------
plots <- plot_diet(result$biomass_consumed, wrap_col = "agecl", combine_thresh = 7)
for (i in seq_along(plots)) {
  cat(paste0("## Diet plot ", i, ": ", names(plots)[i]), sep = "\n")
  gridExtra::grid.arrange(plots[[i]])
  cat("\n\n")
}

## ---- echo=FALSE, results = 'asis', fig.width = 14, fig.height = 9-------
plots <- plot_spatial_box(result$biomass_spatial_stanza, bgm_as_df = convert_bgm(bgm = bgm), timesteps = 7)
for (i in seq_along(plots)) {
  cat(paste0("## Spatial Plot ", i, ": ", names(plots)[i]), sep = "\n")
  gridExtra::grid.arrange(plots[[i]])
  cat("\n\n")
}

## ---- echo=FALSE, results = 'asis', fig.width = 14, fig.height = 9-------
plots <- plot_spatial_ts(result$biomass_spatial_stanza, bgm_as_df = convert_bgm(bgm = bgm), vol = result$vol)
for (i in seq_along(plots)) {
  cat(paste0("## Spatial Plot ", i, ": ", names(plots)[i]), sep = "\n")
  gridExtra::grid.arrange(plots[[i]])
  cat("\n\n")
}

