## ----include=FALSE, cache=FALSE------------------------------------------
library(knitr)
opts_chunk$set(concordance=TRUE, cache=TRUE, message=FALSE)

## ----include=FALSE-------------------------------------------------------
opts_chunk$set(width = 7)

## ----echo=FALSE----------------------------------------------------------
rm(list=ls())

## ----eval=FALSE----------------------------------------------------------
#  install.packages("mizer")

## ----results='hide'------------------------------------------------------
library(mizer)

## ----label=help_demo, eval=FALSE-----------------------------------------
#  help(package="mizer")
#  help(mizer)
#  help(project)

## ----label=help_plot, eval=FALSE-----------------------------------------
#  help(plot, package="mizer")

## ----label=help_FL, eval=FALSE-------------------------------------------
#  method ? getFeedingLevel

## ----label=help_MP_class, eval=FALSE-------------------------------------
#  class ? MizerParams

## ----label=help_set_community_model, eval=FALSE--------------------------
#  ?set_community_model

## ----label=demo_comm_model_params----------------------------------------
params <- set_community_model(z0 = 0.1, f0 = 0.7, alpha = 0.2, recruitment = 4e7)

## ----label=class_comm_params---------------------------------------------
class(params)

## ----label=slots_MP------------------------------------------------------
slotNames(params)

## ----label=demo_slot_accessor, results='hide'----------------------------
params@w

## ----label=summary_comm_params-------------------------------------------
summary(params)

## ----label=demo_comm_run-------------------------------------------------
sim <- project(params, t_max=50, effort = 0)

## ----plot_comm_sim, eval=FALSE-------------------------------------------
#  plot(sim)

## ----label=print_plot_comm_sim, echo=FALSE, fig.height=9-----------------
plot(sim)

## ----label=get_m2_comm---------------------------------------------------
m2 <- getM2(sim)

## ----label=m2_comm_final_time_step, results='hide'-----------------------
m2[51,]

## ----label=print_plot_comm_m2, echo=FALSE, warning=FALSE, fig.height=4----
plot(x = sim@params@w, y = m2[51,], log="xy", type="l", xlab = "Size", ylab = "Predation mortality")

## ----label=set_comm_fishing----------------------------------------------
params_knife <- set_community_model(z0 = 0.1, recruitment = 4e7,
    alpha = 0.2, f0 = 0.7, knife_edge_size = 1000)

## ----label=sim_comm_no_fish----------------------------------------------
sim0 <- project(params_knife, effort = 0, t_max = 50)

## ----label=sim_comm_with_fish--------------------------------------------
sim1 <- project(params_knife, effort = 1, t_max = 50)

## ----label=plot_comm_fmort, eval=FALSE-----------------------------------
#  plot(sim1)

## ----label=print_plot_comm_fmort, echo=FALSE, fig.height=9---------------
plot(sim1)

## ----label='dim_n'-------------------------------------------------------
dim(sim0@n)

## ----label='relative_comm_abundance'-------------------------------------
relative_abundance <- sim1@n[51,,] / sim0@n[51,,]

## ----label=plot_relative_comm_abund, eval=FALSE--------------------------
#  plot(x=sim0@params@w, y=relative_abundance, log="x", type="n",
#      xlab = "Size (g)", ylab="Relative abundance")
#  lines(x=sim0@params@w, y=relative_abundance)
#  lines(x=c(min(sim0@params@w),max(sim0@params@w)), y=c(1,1),lty=2)

## ----label=print_plot_relative_comm_abund, echo=FALSE, fig.height=4------
plot(x=sim0@params@w, y=relative_abundance, log="x", type="n",
    xlab = "Size (g)", ylab="Relative abundance")
lines(x=sim0@params@w, y=relative_abundance)
lines(x=c(min(sim0@params@w),max(sim0@params@w)), y=c(1,1),lty=2)

## ----label=comm_params_sigma1--------------------------------------------
params_sigma1 <- set_community_model(z0 = 0.1,
     f0 = 0.7, alpha = 0.2, recruitment = 4e7, sigma = 1)

## ----label=comm_project_sigma1-------------------------------------------
sim_sigma1 <- project(params_sigma1, effort = 0, t_max = 50, dt=0.01)

## ----label=plot_comm_biomass_sigma1, eval=FALSE--------------------------
#  plotBiomass(sim_sigma1)

## ----label=print_plot_comm_biomass_sigma1, echo=FALSE, fig.height=4, fig.keep='last'----
plotBiomass(sim_sigma1)

## ----label=help_set_trait_model, eval=FALSE------------------------------
#  ?set_trait_model

## ----label=demo_trait_model_params---------------------------------------
params <- set_trait_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e5)

## ----label=class_trait_params--------------------------------------------
class(params)

## ----label=summary_comm_params2------------------------------------------
summary(params)

## ----label=trait_project_no_fishing--------------------------------------
sim <- project(params, t_max=75, effort = 0)

## ----plot_comm_sim_2, eval=FALSE-----------------------------------------
#  plot(sim)

## ----label=print_plot_trait_sim, echo=FALSE, fig.height=9----------------
plot(sim)

## ----label=set_trait_fishing---------------------------------------------
params_knife <- set_trait_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e5,
    knife_edge_size = 1000)

## ----label=sim_trait_no_fish---------------------------------------------
sim0 <- project(params_knife, effort = 0, t_max = 75)

## ----label=sim_trait_with_fish-------------------------------------------
sim1 <- project(params_knife, effort = 0.75, t_max = 75)

## ----label=plot_trait_fmort, eval=FALSE----------------------------------
#  plot(sim1)

## ----label=print_plot_trait_fmort, echo=FALSE, fig.height=9--------------
plot(sim1)

## ----label=trait_dim_n---------------------------------------------------
dim(sim0@n)

## ----label = total_abund_trait-------------------------------------------
total_abund0 <- apply(sim0@n[76,,],2,sum)
total_abund1 <- apply(sim1@n[76,,],2,sum)

## ----label='relative_comm_abundance2'------------------------------------
relative_abundance <- total_abund1 / total_abund0

## ----label=plot_relative_comm_abund2, eval=FALSE-------------------------
#  plot(x=sim0@params@w, y=relative_abundance, log="xy", type="n", xlab = "Size (g)",
#      ylab="Relative abundance", ylim = c(0.1,10))
#  lines(x=sim0@params@w, y=relative_abundance)
#  lines(x=c(min(sim0@params@w),max(sim0@params@w)), y=c(1,1),lty=2)

## ----label=show_plot_relative_comm_abund, echo=FALSE, fig.height=4-------
plot(x=sim0@params@w, y=relative_abundance, log="xy", type="n", xlab = "Size (g)",
    ylab="Relative abundance", ylim = c(0.1,10))
lines(x=sim0@params@w, y=relative_abundance)
lines(x=c(min(sim0@params@w),max(sim0@params@w)), y=c(1,1),lty=2)

## ----label='get_M2_trait'------------------------------------------------
m2_no_fishing <- getM2(sim0)[76,1,]
m2_with_fishing <- getM2(sim1)[76,1,]

## ----label=plot_relative_trait_m2, eval=FALSE----------------------------
#  plot(x = sim0@params@w, y = m2_no_fishing, log="x", type="n", xlab = "Size (g)",
#      ylab = "M2")
#  lines(x = sim0@params@w, y = m2_no_fishing, lty=2)
#  lines(x = sim0@params@w, y = m2_with_fishing)

## ----label=print_plot_relative_trait_m2, echo = FALSE, fig.height=4------
plot(x = sim0@params@w, y = m2_no_fishing, log="x", type="n", xlab = "Size (g)",
    ylab = "M2")
lines(x = sim0@params@w, y = m2_no_fishing, lty=2)
lines(x = sim0@params@w, y = m2_with_fishing)

## ----label=calc_trait_winf-----------------------------------------------
no_sp <- 10
min_w_inf <- 10
max_w_inf <- 1e5
w_inf <- 10^seq(from=log10(min_w_inf), to = log10(max_w_inf), length=no_sp)

## ----label=calc_knife_edge_trait-----------------------------------------
knife_edges <- w_inf * 0.05

## ----label=trait_industrial_gear_names-----------------------------------
other_gears <- w_inf > 500
gear_names <- rep("Industrial", no_sp)
gear_names[other_gears] <- "Other"

## ----label=set_trait_multiple_gears--------------------------------------
params_multi_gear <- set_trait_model(no_sp = no_sp, min_w_inf = min_w_inf,
    max_w_inf = max_w_inf, knife_edge_size = knife_edges, gear_names = gear_names)

## ----label=looking_at_trait_species_params, results='hide'---------------
params_multi_gear@species_params

## ----label=project_multi_gear_trait_single_effort------------------------
sim_multi_gear <- project(params_multi_gear, t_max = 75, effort = 0.5)

## ----label=plot_multi_gear_trait_single_effort, eval=FALSE---------------
#  plot(sim_multi_gear)

## ----label=print_plot_trait_multi_gear_single_effort, echo=FALSE, fig.height=9----
plot(sim_multi_gear)

## ----label=project_trait_multigear---------------------------------------
sim_multi_gear <- project(params_multi_gear, t_max = 75,
    effort = c(Industrial = 0.75, Other = 0))

## ----label=plot_multi_gear_trait, eval=FALSE-----------------------------
#  plot(sim_multi_gear)

## ----label=print_plot_trait_multi_gear, echo=FALSE, fig.height=9---------
plot(sim_multi_gear)

## ----label = industrial_fishery_simulation-------------------------------
sim_industrial0 <- project(params_multi_gear, t_max = 75, effort = 0)
sim_industrial1 <- project(params_multi_gear, t_max = 75,
    effort = c(Industrial = 0.75, Other = 0))
total_abund0 <- apply(sim_industrial0@n[76,,],2,sum)
total_abund1 <- apply(sim_industrial1@n[76,,],2,sum)
relative_abundance <- total_abund1 / total_abund0

## ----label=plot_relative_comm_abund_industrial, eval=FALSE---------------
#  plot(x=sim0@params@w, y=relative_abundance, log="xy", type="n", xlab = "Size (g)",
#      ylab="Relative abundance", ylim = c(0.1,10))
#  lines(x=sim0@params@w, y=relative_abundance)
#  lines(x=c(min(sim0@params@w),max(sim0@params@w)), y=c(1,1),lty=2)

## ----label=show_plot_relative_comm_abund_industrial, echo=FALSE, fig.height = 4----
plot(x=sim0@params@w, y=relative_abundance, log="xy", type="n", xlab = "Size (g)",
    ylab="Relative abundance", ylim = c(0.1,10))
lines(x=sim0@params@w, y=relative_abundance)
lines(x=c(min(sim0@params@w),max(sim0@params@w)), y=c(1,1),lty=2)

## ----eval=FALSE----------------------------------------------------------
#  ?knife_edge

## ----label=help_MP_constructor, eval=FALSE-------------------------------
#  help(MizerParams)

## ----label = get_location_for_ns_params,eval=FALSE-----------------------
#  system.file("doc/NS_species_params.csv",package="mizer")

## ------------------------------------------------------------------------
params_data <- read.csv("NS_species_params.csv")

## ------------------------------------------------------------------------
class(params_data)

## ----label=show_simple_params_data---------------------------------------
params_data

## ----label=first_MP, results='hide'--------------------------------------
params <- MizerParams(params_data)

## ----label=class_MP------------------------------------------------------
class(params)

## ----label=looking_at_params_slot----------------------------------------
params@species_params

## ----label=summary_params, results='hide'--------------------------------
summary(params)

## ----label=MP_200, eval=FALSE--------------------------------------------
#  params200 <- MizerParams(params_data, no_w=200)
#  summary(params200)

## ----eval=FALSE----------------------------------------------------------
#  system.file("doc/inter.csv",package="mizer")

## ------------------------------------------------------------------------
inter <- read.csv("inter.csv", row.names=1)

## ----label=inter_df_to_matrix--------------------------------------------
inter <- as(inter, "matrix")

## ----results='hide'------------------------------------------------------
params <- MizerParams(params_data, interaction = inter)

## ------------------------------------------------------------------------
params_data_gears <- params_data
params_data_gears$gear <- c("Industrial","Industrial","Industrial",
		      "Pelagic","Beam","Otter",
		      "Beam","Otter","Beam",
		      "Otter","Otter","Otter")

## ----label=set_params_gears, results='hide'------------------------------
params_gears <- MizerParams(params_data_gears, interaction = inter)

## ----label = remaking_simple_ms_params, results='hide'-------------------
params <- MizerParams(params_data, interaction = inter)

## ----label=siple_projection_single_effort--------------------------------
sim <- project(params, effort = 1, t_max = 10, dt = 0.1, t_save = 1)

## ----label=plot_basic_ms_sim, eval=FALSE---------------------------------
#  plot(sim)

## ----label=print_plot_basic_ms_sim, echo=FALSE, fig.height=9-------------
plot(sim)

## ----label=show_effort---------------------------------------------------
head(sim@effort)

## ----summary_mizersim,eval=FALSE-----------------------------------------
#  summary(sim)

## ----label=simple_proj_tsave05-------------------------------------------
sim <- project(params_gears, effort = 1, t_max = 10, dt = 0.1, t_save = 0.5)
head(sim@effort)

## ----label=set_effort_vector---------------------------------------------
effort <- c(Industrial = 0, Pelagic = 1, Beam = 0.3, Otter = 0.7)

## ----label=project_effort_vector-----------------------------------------
sim <- project(params_gears, effort = effort, t_max = 10, dt = 1, t_save = 1)
head(sim@effort)

## ----label=plotFMort, eval=FALSE-----------------------------------------
#  plotFMort(sim)

## ----label=print_plotFMort, echo=FALSE, fig.height=4, fig.keep='last'----
plotFMort(sim)

## ----label=set_empty_effort_array----------------------------------------
gear_names <- c("Industrial","Pelagic","Beam","Otter")
times <- seq(from = 1, to = 10, by = 1)
effort_array <- array(NA, dim = c(length(times), length(gear_names)),
    dimnames = list(time = times, gear = gear_names))

## ----label=fill_effort_array---------------------------------------------
effort_array[,"Industrial"] <- 0.5
effort_array[,"Pelagic"] <- seq(from = 1, to = 2, length = length(times))
effort_array[,"Beam"] <- seq(from = 1, to = 0, length = length(times))
effort_array[,"Otter"] <- seq(from = 1, to = 0.5, length = length(times))

## ----label=show_effort_array---------------------------------------------
head(effort_array)

## ----label=project_effort_array------------------------------------------
sim <- project(params_gears,effort=effort_array, dt=0.1, t_save = 1)
head(sim@effort)

## ----label = exploration_simulation--------------------------------------
sim <- project(params_gears,effort=effort_array, dt=0.1, t_save = 1)

## ----label=show_dim_n----------------------------------------------------
dim(sim@n)

## ----results='hide'------------------------------------------------------
sim@n[,"Cod",]

## ----label = getSSB_demo-------------------------------------------------
ssb <- getSSB(sim)
dim(ssb)
head(ssb)

## ----label = getBiomass_demo---------------------------------------------
biomass <- getBiomass(sim, min_w = 10, max_w = 1000)
head(biomass)

## ----label=getCommunitySlope_demo----------------------------------------
slope <- getCommunitySlope(sim)
head(slope)

## ----label = getCommunitySlope_with_args---------------------------------
dem_species <- c("Dab","Whiting","Sole","Gurnard","Plaice","Haddock",
    "Cod","Saithe")
slope <- getCommunitySlope(sim, min_w = 10, max_w = 5000, 
    species = dem_species)
head(slope)

## ----label=plotBiomass, eval=FALSE---------------------------------------
#  plotBiomass(sim)

## ----label=print_plotBiomass, echo=FALSE, fig.height=4, fig.keep='last'----
plotBiomass(sim)

## ----label=plotSpectra_example,eval=FALSE--------------------------------
#  plotSpectra(sim, time_range = 5:10, biomass=TRUE)

## ----label=print_plotSpectra_example, echo=FALSE, fig.height=4, fig.keep='last'----
plotSpectra(sim, time_range = 5:10, biomass=TRUE)

## ----label=demo_summary_plot,eval=FALSE----------------------------------
#  plot(sim)

## ----label=plot_example, echo=FALSE, fig.height=9------------------------
plot(sim)

## ----label = show_load_ns_species_params, eval=FALSE---------------------
#  params_location <- system.file("doc/NS_species_params.csv",package="mizer")
#  params_data <- read.csv(params_location)
#  inter_location <- system.file("doc/inter.csv",package="mizer")
#  inter <- as(read.csv(inter_location, row.names=1),"matrix")

## ----label = load_ns_species_params, echo=FALSE--------------------------
params_data <- read.csv("NS_species_params.csv")
inter <- as(read.csv("inter.csv", row.names=1),"matrix")

## ----label=adding_sel_params---------------------------------------------
params_data$sel_func <- "sigmoid_length"
params_data$l25 <- c(7.6, 9.8, 8.7, 10.1, 11.5, 19.8, 16.4, 19.8, 11.5,
    19.1, 13.2, 35.3)
params_data$l50 <- c(8.1, 11.8, 12.2, 20.8, 17.0, 29.0, 25.8, 29.0, 17.0,
    24.3, 22.9, 43.6)
params_data$a <- c(0.007, 0.001, 0.009, 0.002, 0.010, 0.006, 0.008, 0.004,
0.007, 0.005, 0.005, 0.007)
params_data$b <- c(3.014, 3.320, 2.941, 3.429, 2.986, 3.080, 3.019, 3.198,
    3.101, 3.160, 3.173, 3.075)

## ----label=show_load_f_history, eval = FALSE-----------------------------
#  f_location <- system.file("doc/NS_f_history.csv",package="mizer")
#  f_history <- as(read.csv(f_location, row.names=1), "matrix")

## ----label=load_f_history, echo = FALSE----------------------------------
f_history <- as(read.csv("NS_f_history.csv", row.names=1), "matrix")

## ----label=head_f_history------------------------------------------------
head(f_history)

## ----label=set_catchability----------------------------------------------
params_data$catchability <- as.numeric(f_history["1990",])

## ----label=make_ns_params, results='hide'--------------------------------
params <- MizerParams(params_data, inter, kappa = 9.27e10)

## ----label=rescale_effort------------------------------------------------
relative_effort <- sweep(f_history,2,f_history["1990",],"/")
relative_effort[as.character(1988:1992),]

## ----label=add_transient_years-------------------------------------------
initial_effort <- matrix(relative_effort[1,],byrow=TRUE, nrow=100,
    ncol=ncol(relative_effort), dimnames = list(1867:1966))
relative_effort <- rbind(initial_effort,relative_effort)

## ----label=project_ns_model----------------------------------------------
sim <- project(params, effort=relative_effort, dt = 0.5, t_save = 1)

## ----label = plot_ns_biomass, eval=FALSE---------------------------------
#  plotBiomass(sim)

## ----label=print_plot_ns_biomass, echo=FALSE, fig.height=4, fig.keep='last'----
plotBiomass(sim)

## ----label=unexploited_na------------------------------------------------
sim0 <- project(params, effort=0, dt = 0.5, t_save = 1, t_max = 100)

## ----label=ns_comm_ref_point---------------------------------------------
demersal_species <- c("Dab","Whiting","Sole","Gurnard","Plaice","Haddock",
    "Cod","Saithe")
lfi0 <- getProportionOfLargeFish(sim0, species = demersal_species,
    min_w = 10, max_w = 100e3, threshold_l = 40)["100"]
mw0 <- getMeanWeight(sim0, species = demersal_species,
    min_w = 10,max_w = 100e3)["100"]
mmw0 <- getMeanMaxWeight(sim0, species = demersal_species,
    min_w = 10, max_w = 100e3)["100","mmw_biomass"]
slope0 <- getCommunitySlope(sim0, species = demersal_species,
    min_w = 10, max_w = 100e3)["100","slope"]

## ----label=ns_comm_indicators--------------------------------------------
years <- 1967:2010
lfi <- getProportionOfLargeFish(sim, species = demersal_species,
    min_w = 10, max_w = 100e3, threshold_l = 40)[as.character(years)]
mw <- getMeanWeight(sim, species = demersal_species,
    min_w = 10, max_w = 100e3)[as.character(years)]
mmw <- getMeanMaxWeight(sim, species = demersal_species,
    min_w = 10, max_w = 100e3)[as.character(years),"mmw_biomass"]
slope <- getCommunitySlope(sim, species = demersal_species,
    min_w = 10, max_w = 100e3)[as.character(years),"slope"]

## ----label=plot_ns_indicators, eval = FALSE------------------------------
#  library(ggplot2)
#  # Simulated data
#  community_plot_data <- rbind(
#      data.frame(year = years, measure = "LFI", data = lfi),
#      data.frame(year = years, measure = "Mean Weight", data = mw),
#      data.frame(year = years, measure = "Mean Max Weight", data = mmw),
#      data.frame(year = years, measure = "Slope", data = slope))
#  # Unexploited data
#  community_unfished_data <- rbind(
#      data.frame(year = years, measure = "LFI", data = lfi0[[1]]),
#      data.frame(year = years, measure = "Mean Weight", data = mw0[[1]]),
#      data.frame(year = years, measure = "Mean Max Weight", data = mmw0[[1]]),
#      data.frame(year = years, measure = "Slope", data = slope0[[1]]))
#  # Reference level
#  community_reference_level <-
#      data.frame(year=years, measure = "LFI", data = lfi0[[1]] * 0.8)
#  # Build up the plot
#  p <- ggplot(community_plot_data) + geom_line(aes(x=year, y = data)) +
#      facet_wrap(~measure, scales="free")
#  p <- p + geom_line(aes(x=year,y=data), linetype="dashed",
#      data = community_unfished_data)
#  p + geom_line(aes(x=year,y=data), linetype="dotted",
#      data = community_reference_level)

## ----label=print_plot_ns_indicators, echo=FALSE, fig.height=6------------
library(ggplot2)
# Simulated data
community_plot_data <- rbind(
    data.frame(year = years, measure = "LFI", data = lfi),
    data.frame(year = years, measure = "Mean Weight", data = mw),
    data.frame(year = years, measure = "Mean Max Weight", data = mmw),
    data.frame(year = years, measure = "Slope", data = slope))
# Unexploited data
community_unfished_data <- rbind(
    data.frame(year = years, measure = "LFI", data = lfi0[[1]]),
    data.frame(year = years, measure = "Mean Weight", data = mw0[[1]]),
    data.frame(year = years, measure = "Mean Max Weight", data = mmw0[[1]]),
    data.frame(year = years, measure = "Slope", data = slope0[[1]]))
# Reference level
community_reference_level <-
    data.frame(year=years, measure = "LFI", data = lfi0[[1]] * 0.8)
# Build up the plot
p <- ggplot(community_plot_data) + geom_line(aes(x=year, y = data)) +
    facet_wrap(~measure, scales="free")
p <- p + geom_line(aes(x=year,y=data), linetype="dashed",
    data = community_unfished_data)
p + geom_line(aes(x=year,y=data), linetype="dotted",
    data = community_reference_level)

## ----label = ns_scenario1_relative_effort--------------------------------
scenario1 <- t(array(relative_effort["2010",], dim=c(12,40),
    dimnames=list(NULL,year = 2011:2050)))
scenario1 <- rbind(relative_effort, scenario1)

## ----label = ns_scenario2_relative_effort--------------------------------
fmsy <- c(Sprat = 0.2, Sandeel = 0.2, N.pout = 0.2, Herring = 0.25, Dab = 0.2,
    Whiting = 0.2, Sole = 0.22, Gurnard = 0.2, Plaice = 0.25, Haddock = 0.3,
    Cod = 0.19, Saithe = 0.3)
scenario2 <- t(array(fmsy, dim=c(12,40), dimnames=list(NULL,year = 2011:2050)))
scenario2 <- rbind(relative_effort, scenario2)
for (sp in dimnames(scenario2)[[2]]){
    scenario2[as.character(2011:2015),sp] <- scenario2["2010",sp] +
        (((scenario2["2015",sp] - scenario2["2010",sp]) / 5) * 1:5)
}

## ----label = project_ns_future_scenarios---------------------------------
sim1 <- project(params, effort = scenario1, dt = 0.5, t_save = 1)
sim2 <- project(params, effort = scenario2, dt = 0.5, t_save = 1)

## ----label=ns_biodiv_ref_point-------------------------------------------
ssb0 <- getSSB(sim0)["100",]

## ----label=projected_ssb_ns, eval=FALSE----------------------------------
#  library(reshape2)
#  years <- 1967:2050
#  ssb1 <- getSSB(sim1)[as.character(years),]
#  ssb2 <- getSSB(sim2)[as.character(years),]
#  ssb1_df <- melt(ssb1)
#  ssb2_df <- melt(ssb2)
#  ssb_df <- rbind(
#      cbind(ssb1_df, scenario = "Scenario 1"),
#      cbind(ssb2_df, scenario = "Scenario 2"))
#  ssb_unexploited_df <- cbind(expand.grid(
#      sp = names(ssb0),
#      time = 1967:2050),
#      value = as.numeric(ssb0),
#      scenario = "Unexploited")
#  ssb_reference_df <- cbind(expand.grid(
#      sp = names(ssb0),
#      time = 1967:2050),
#      value = as.numeric(ssb0*0.1),
#      scenario = "Reference")
#  ssb_all_df <- rbind(
#      ssb_df,
#      ssb_unexploited_df,
#      ssb_reference_df)
#  p <- ggplot(ssb_all_df) +
#      geom_line(aes(x = time, y = value, colour = scenario)) +
#      facet_wrap(~sp, scales = "free", nrow = 4)
#  p + theme(legend.position = "none")

## ----label=print_projected_ssb_ns, echo=FALSE, fig.height=9--------------
library(reshape2)
years <- 1967:2050
ssb1 <- getSSB(sim1)[as.character(years),]
ssb2 <- getSSB(sim2)[as.character(years),]
ssb1_df <- melt(ssb1)
ssb2_df <- melt(ssb2)
ssb_df <- rbind(
    cbind(ssb1_df, scenario = "Scenario 1"),
    cbind(ssb2_df, scenario = "Scenario 2"))
ssb_unexploited_df <- cbind(expand.grid(
    sp = names(ssb0),
    time = 1967:2050),
    value = as.numeric(ssb0),
    scenario = "Unexploited")
ssb_reference_df <- cbind(expand.grid(
    sp = names(ssb0),
    time = 1967:2050),
    value = as.numeric(ssb0*0.1),
    scenario = "Reference")
ssb_all_df <- rbind(
    ssb_df,
    ssb_unexploited_df,
    ssb_reference_df)
p <- ggplot(ssb_all_df) +
    geom_line(aes(x = time, y = value, colour = scenario)) +
    facet_wrap(~sp, scales = "free", nrow = 4)
p + theme(legend.position = "none")

## ----plot_scale_sense2, eval=FALSE, echo=FALSE, warning=FALSE, message=FALSE----
#  params_trait <- set_trait_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
#                            knife_edge_size = 100)
#  sim_trait_initial <- project(params_trait, t_max=100, effort = 0)
#  sim_trait <- project(params_trait,
#                       initial_n = sim_trait_initial@n[dim(
#                           sim_trait_initial@n)[1],,],
#                       initial_n_pp = sim_trait_initial@
#                           n_pp[dim(sim_trait_initial@n_pp)[1],], t_max=15,
#                       effort = 1)
#  params <- set_scaling_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
#                              min_egg = 1e-4, min_w_mat = 10^(0.4), rfac = Inf,
#                              knife_edge_size = 100,kappa = 0.005)
#  sim <- project(params, t_max=15, effort = 1)
#  b_trait <- getBiomassFrame(sim_trait)
#  b <- getBiomassFrame(sim)
#  display_frames(b_trait, b, params)

## ----label=print_plot_scale_sense, echo=FALSE, warning=FALSE, message=FALSE, fig.height=4, fig.keep='last'----
params_trait <- set_trait_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
                          knife_edge_size = 100)
sim_trait_initial <- project(params_trait, t_max=100, effort = 0)
sim_trait <- project(params_trait,
                     initial_n = sim_trait_initial@n[dim(
                         sim_trait_initial@n)[1],,],
                     initial_n_pp = sim_trait_initial@
                         n_pp[dim(sim_trait_initial@n_pp)[1],], t_max=15,
                     effort = 1)
params <- set_scaling_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
                            min_egg = 1e-4, min_w_mat = 10^(0.4), rfac = Inf,
                            knife_edge_size = 100,kappa = 0.005)
sim <- project(params, t_max=15, effort = 1)
b_trait <- getBiomassFrame(sim_trait)
b <- getBiomassFrame(sim)
display_frames(b_trait, b, params)

## ----label=demo_trait_model_insensitive, eval=FALSE, warning=FALSE, message=FALSE----
#  params_trait <- set_trait_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
#                            knife_edge_size = 100)
#  sim_trait_initial <- project(params_trait, t_max=100, effort = 0)
#  sim_trait <- project(params_trait,
#                       initial_n = sim_trait_initial@n[dim(
#                           sim_trait_initial@n)[1],,],
#                       initial_n_pp = sim_trait_initial@
#                           n_pp[dim(sim_trait_initial@n_pp)[1],], t_max=15,
#                       effort = 1)
#  plotBiomass(sim_trait)

## ----label=demo_scale_model_sensitive, eval=FALSE, warning=FALSE, message=FALSE----
#  params <- set_scaling_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
#                              min_egg = 1e-4, min_w_mat = 10^(0.4), rfac = Inf,
#                              knife_edge_size = 100,kappa = 0.005)
#  sim <- project(params, t_max=15, effort = 1)
#  plotBiomass(sim)

## ----label=demo_scaling_model_params-------------------------------------
params <- set_scaling_model(no_sp = 10, min_w_inf = 10, max_w_inf = 1e3,
                            min_egg = 1e-4, min_w_mat = 10^(0.4), 
                            knife_edge_size = 100, kappa = 0.005)

## ----label = scale_run---------------------------------------------------
sim <- project(params, t_max=5, effort = 0)

## ----plot_scale_sim, eval=FALSE------------------------------------------
#  plotBiomass(sim)

## ----label=print_plot_scale_sim, echo=FALSE, fig.height=4, fig.keep='last'----
plotBiomass(sim)

## ----plot_scale_simBS, eval=FALSE----------------------------------------
#  plotSpectra(sim, total = TRUE)

## ----label=print_plot_scale_simBS, echo=FALSE, fig.height=4, fig.keep='last'----
plotSpectra(sim, total = TRUE)

## ----label=seed_scaling_model_params-------------------------------------
params_bg  <- setBackground(
  set_scaling_model(no_sp = 10, no_w = 400,
                    min_w_inf = 10, max_w_inf = 1e5,
                    min_egg = 1e-4, min_w_mat = 10^(0.4),
                    knife_edge_size = Inf, kappa = 10000,
                    lambda = 2.08, f0 = 0.6, h = 34)
)

## ----label=mullet_data---------------------------------------------------
species_params <- data.frame(
  species = "Mullet",
  w_min = 0.001, 
  w_inf = 173.2425, 
  w_mat = 15.14863, 
  beta = 283, 
  sigma = 1.8, 
  z0 = 0,
  alpha = 0.6, 
  erepro = 0.1, 
  sel_func = "sigmoid_length", 
  gear = "sigmoid_gear",
  l25 = 13.17291,
  l50 = 15.48,
  k = 0,
  k_vb = 0.6,
  a = 0.0085,
  b = 3.11,
  gamma = 0.0017,
  h = 50,
  linecolour = "red",
  linetype = "solid"
)

## ----label=mullet_add----------------------------------------------------
params_bg_m <- addSpecies(params_bg, species_params, SSB = 2800, effort=0.4, 
                rfac = 1.01)

## ----label = mullet_run--------------------------------------------------
sim <- project(params_bg_m, t_max = 25, effort = 0.4)

## ----plot_mullet_sim, eval=FALSE-----------------------------------------
#  plotBiomass(sim)

## ----label=print_plot_mullet_sim, echo=FALSE, fig.height=4, fig.keep='last'----
plotBiomass(sim)

## ----plot_mullet_sim2, eval=FALSE----------------------------------------
#  plotSpectra(sim)

## ----label=print_plot_mullet_sim2, echo=FALSE, fig.height=4, fig.keep='last'----
plotSpectra(sim)

## ----label=hake_data-----------------------------------------------------
species_params <- data.frame(
  species = "Hake",
  w_min = 0.001, 
  w_inf = 4174.194, 
  w_mat = 183.5169, 
  beta = 11.02318, 
  sigma = 1.1, 
  z0 = 0,
  alpha = 0.6, 
  erepro = 0.1, 
  sel_func = "sigmoid_length", 
  gear = "sigmoid_gear",
  l25 = 16.09244,
  l50 = 16.6,
  k = 0,
  k_vb = 0.1, 
  a = 0.0046,
  b = 3.12,
  gamma = 0.003,
  h = 20,
  linecolour = "blue",
  linetype = "solid"
)

## ----label=add_hake------------------------------------------------------
params_bg_m_h <- addSpecies(params_bg_m, species_params, SSB = 1200,
                            effort=0.4, rfac = 1.01)

## ----plot_mullet_hake_spectra, eval=FALSE--------------------------------
#  plotSpectra(params_bg_m_h)

## ----label=print_plot_mullet_hake_spectra, echo=FALSE, fig.height=4, fig.keep='last'----
plotSpectra(params_bg_m_h)

## ----plot_mullet_hake_biomass, eval=FALSE--------------------------------
#  sim <- project(params_bg_m_h, t_max = 50, t_save = 5, effort = 0.4)
#  plotBiomass(sim)

## ----label=print_plot_mullet_hake_biomass, echo=FALSE, fig.height=4, fig.keep='last'----
sim <- project(params_bg_m_h, t_max = 50, t_save = 5, effort = 0.4)
plotBiomass(sim)

## ----mullet_hake_steady--------------------------------------------------
params_bg_m_h2 <- steady(params_bg_m_h, effort = 0.4)

## ----plot_mullet_hake_biomass_steady, eval=FALSE-------------------------
#  sim2 <- project(params_bg_m_h2, t_max = 50, t_save = 5, effort = 0.4)
#  plotBiomass(sim2)

## ----label=print_plot_mullet_hake_biomass_steady, echo=FALSE, fig.height=4, fig.keep='last'----
sim2 <- project(params_bg_m_h2, t_max = 50, t_save = 5, effort = 0.4)
plotBiomass(sim2)

