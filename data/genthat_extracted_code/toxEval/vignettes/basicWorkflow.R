## ----setup1, include=FALSE--------------------------------
library(knitr)
library(rmarkdown)
options(continue=" ")
options(width=60)
#Set this to TRUE when creating pkgdown site:
runTables <- FALSE
knitr::opts_chunk$set(echo = TRUE,
                      warning = FALSE,
                      message = FALSE)

## ----startup, message=FALSE-------------------------------
library(toxEval)
path_to_tox <-  system.file("extdata", package="toxEval")
file_name <- "OWC_data_fromSup.xlsx"
full_path <- file.path(path_to_tox, file_name)

tox_list <- create_toxEval(full_path)


## ----chemical_summary-------------------------------------
ACC <- get_ACC(tox_list$chem_info$CAS)
ACC <- remove_flags(ACC)

cleaned_ep <- clean_endPoint_info(end_point_info)
filtered_ep <- filter_groups(cleaned_ep)

chemical_summary <- get_chemical_summary(tox_list, ACC, filtered_ep)

## ----eval=FALSE-------------------------------------------
#  names(end_point_info)

## ---------------------------------------------------------
cleaned_ep <- clean_endPoint_info(end_point_info)

filtered_ep <- filter_groups(cleaned_ep,
              groupCol = "intended_target_family",
              assays = c("ATG","NVS", "OT", "TOX21", 
                         "CEETOX", "APR", "CLD", "TANGUAY",
                         "NHEERL_PADILLA","NCCT_SIMMONS", "ACEA"),
              remove_groups = c("Background Measurement",
                                "Undefined"))

## ---------------------------------------------------------
unique(cleaned_ep$intended_target_family)

## ----eval=FALSE-------------------------------------------
#  unique(end_point_info$intended_target_family_sub)

## ----boxplots1, warning=FALSE, message=FALSE--------------
plot_tox_boxplots(chemical_summary, "Biological")

# Other options:
# plot_tox_boxplots(chemical_summary, "Chemical Class")
# plot_tox_boxplots(chemical_summary, "Chemical") 

## ----plot_box_thres, warning=FALSE, message=FALSE---------
plot_tox_boxplots(chemical_summary, 
                  category = "Biological",
                  hit_threshold = 0.001)


## ----filtersiteBox, message=FALSE, warning=FALSE----------
library(dplyr)

maumee <- filter(chemical_summary, shortName == "Maumee")
maumee_site <- filter(tox_list$chem_site, `Short Name` == "Maumee")

## ----maumeePlot, message=FALSE, warning=FALSE-------------
plot_tox_boxplots(maumee, "Biological",title = maumee_site$Fullname[1])


## ----stackplots1, warning=FALSE, fig.width=10-------------
plot_tox_stacks(chemical_summary, 
                chem_site = tox_list$chem_site, 
                category =  "Biological")

# More options:
# plot_tox_stacks(chemical_summary, 
#                 chem_site = tox_list$chem_site, 
#                 category = "Chemical Class")
# plot_tox_stacks(chemical_summary, 
#                 chem_site = tox_list$chem_site, 
#                 category = "Chemical", include_legend = FALSE)

## ----siteStacks, message=FALSE, warning=FALSE, fig.width=10----
plot_tox_stacks(maumee, maumee_site,"Biological", title = maumee_site$Fullname[1])


## ----heat, warning=FALSE, fig.width=10--------------------
plot_tox_heatmap(chemical_summary, 
                 chem_site = tox_list$chem_site, 
                 category = "Biological")
# More options:
# plot_tox_heatmap(chemical_summary, 
#                  chem_site = tox_list$chem_site, 
#                  category = "Chemical Class")
# plot_tox_heatmap(chemical_summary, 
#                  chem_site = tox_list$chem_site, 
#                  category = "Chemical")

## ----endpoints, warning=FALSE-----------------------------
plot_tox_endpoints(chemical_summary, 
                    category = "Biological", 
                    filterBy = "Cell Cycle")

# More options:
# plot_tox_endpoints(chemical_summary,   
#                    category = "Chemical Class", 
#                    filterBy = "PAHs")
# plot_tox_endpoints(chemical_summary, 
#                    category = "Chemical", 
#                    filterBy = "Atrazine")

## ----boxDetails, echo=FALSE-------------------------------
library(ggplot2)
ggplot_box_legend <- function(family = "serif"){
  
  # Create data to use in the boxplot legend:
  set.seed(100)

  sample_df <- data.frame(parameter = "test",
                        values = sample(500))

  # Extend the top whisker a bit:
  sample_df$values[1:100] <- 701:800
  # Make sure there's only 1 lower outlier:
  sample_df$values[1] <- -350
  
  # Function to calculate important values:
  ggplot2_boxplot <- function(x){
  
    quartiles <- as.numeric(quantile(x, 
                                     probs = c(0.25, 0.5, 0.75)))
    
    names(quartiles) <- c("25th percentile", 
                          "50th percentile\n(median)",
                          "75th percentile")
    
    IQR <- diff(quartiles[c(1,3)])
  
    upper_whisker <- max(x[x < (quartiles[3] + 1.5 * IQR)])
    lower_whisker <- min(x[x > (quartiles[1] - 1.5 * IQR)])
      
    upper_dots <- x[x > (quartiles[3] + 1.5*IQR)]
    lower_dots <- x[x < (quartiles[1] - 1.5*IQR)]
  
    return(list("quartiles" = quartiles,
                "25th percentile" = as.numeric(quartiles[1]),
                "50th percentile\n(median)" = as.numeric(quartiles[2]),
                "75th percentile" = as.numeric(quartiles[3]),
                "IQR" = IQR,
                "upper_whisker" = upper_whisker,
                "lower_whisker" = lower_whisker,
                "upper_dots" = upper_dots,
                "lower_dots" = lower_dots))
  }
  
  # Get those values:
  ggplot_output <- ggplot2_boxplot(sample_df$values)
  
  # Lots of text in the legend, make it smaller and consistent font:
  update_geom_defaults("text", 
                     list(size = 3, 
                          hjust = 0,
                          family = family))
  # Labels don't inherit text:
  update_geom_defaults("label", 
                     list(size = 3, 
                          hjust = 0,
                          family = family))
  
  # Create the legend:
  # The main elements of the plot (the boxplot, error bars, and count)
  # are the easy part.
  # The text describing each of those takes a lot of fiddling to
  # get the location and style just right:
  explain_plot <- ggplot() +
    stat_boxplot(data = sample_df,
                 aes(x = parameter, y=values),
                 geom ='errorbar', width = 0.3) +
    geom_boxplot(data = sample_df,
                 aes(x = parameter, y=values), 
                 width = 0.3, fill = "lightgrey") +
    geom_text(aes(x = 1, y = 950, label = "500"), hjust = 0.5) +
    geom_text(aes(x = 1.17, y = 950,
                  label = "Number of values"),
              fontface = "bold", vjust = 0.4) +
    theme_minimal(base_size = 5, base_family = family) +
    geom_segment(aes(x = 2.3, xend = 2.3, 
                     y = ggplot_output[["25th percentile"]], 
                     yend = ggplot_output[["75th percentile"]])) +
    geom_segment(aes(x = 1.2, xend = 2.3, 
                     y = ggplot_output[["25th percentile"]], 
                     yend = ggplot_output[["25th percentile"]])) +
    geom_segment(aes(x = 1.2, xend = 2.3, 
                     y = ggplot_output[["75th percentile"]], 
                     yend = ggplot_output[["75th percentile"]])) +
    geom_text(aes(x = 2.4, y = ggplot_output[["50th percentile\n(median)"]]), 
              label = "Interquartile\nrange", fontface = "bold",
              vjust = 0.4) +
    geom_text(aes(x = c(1.17,1.17), 
                  y = c(ggplot_output[["upper_whisker"]],
                        ggplot_output[["lower_whisker"]]), 
                  label = c("Largest value within 1.5 times\ninterquartile range above\n75th percentile",
                            "Smallest value within 1.5 times\ninterquartile range below\n25th percentile")),
                  fontface = "bold", vjust = 0.9) +
    geom_text(aes(x = c(1.17), 
                  y =  ggplot_output[["lower_dots"]], 
                  label = "Outside value"), 
              vjust = 0.5, fontface = "bold") +
    geom_text(aes(x = c(1.9), 
                  y =  ggplot_output[["lower_dots"]], 
                  label = "-Value is >1.5 times and"), 
              vjust = 0.5) +
    geom_text(aes(x = 1.17, 
                  y = ggplot_output[["lower_dots"]], 
                  label = "<3 times the interquartile range\nbeyond either end of the box"), 
              vjust = 1.5) +
    geom_label(aes(x = 1.17, y = ggplot_output[["quartiles"]], 
                  label = names(ggplot_output[["quartiles"]])),
              vjust = c(0.4,0.85,0.4), 
              fill = "white", label.size = 0) +
    ylab("") + xlab("") +
    theme(axis.text = element_blank(),
          axis.ticks = element_blank(),
          panel.grid = element_blank(),
          aspect.ratio = 4/3,
          plot.title = element_text(hjust = 0.5, size = 10)) +
    coord_cartesian(xlim = c(1.4,3.1), ylim = c(-600, 900)) +
    labs(title = "EXPLANATION")

  return(explain_plot) 
  
}

ggplot_box_legend()


## ----ggsave1, eval=FALSE----------------------------------
#  
#  ep_plot <- plot_tox_endpoints(chemical_summary,
#                                category = "Biological",
#                                filterBy = "Cell Cycle")
#  
#  # To save a png:
#  ggsave(ep_plot, file = "ep_plot.png")
#  
#  # To save a pdf:
#  ggsave(ep_plot, file = "ep_plot.pdf")

## ----rank_sites_DT, warning=FALSE, eval=runTables---------
#  library(DT)
#  options(DT.options = list(pageLength = 5))
#  
#  rank_df <- rank_sites(chemical_summary,
#                        category = "Biological",
#                        hit_threshold = 0.1)
#  # To create an interactive table:
#  rank_sites_DT(chemical_summary,
#                category = "Biological",
#                hit_threshold = 0.1)

## ----rank_sites_DT_site, warning=FALSE, eval=runTables----
#  rank_sites_DT(maumee, category = "Biological")

## ----hits_summary_DT, warning=FALSE, eval=runTables-------
#  
#  hit_df <- hits_summary(chemical_summary,
#                         category = "Biological",
#                         hit_threshold = 0.1 )
#  
#  hits_summary_DT(chemical_summary,
#                  category = "Biological",
#                  hit_threshold = 0.1)

## ----hits_summary_DT_site, warning=FALSE, eval=runTables----
#  hits_summary_DT(maumee, category = "Biological")

## ----endpoint_hits_DT, warning=FALSE, eval=runTables------
#  
#  ep_hits <- endpoint_hits(chemical_summary,
#                           category = "Biological",
#                           hit_threshold = 0.1)
#  
#  endpoint_hits_DT(chemical_summary,
#                   category = "Biological",
#                   hit_threshold = 0.1)
#  

## ----endpoint_hits_DT_site, warning=FALSE, eval=runTables----
#  endpoint_hits_DT(maumee, category = "Biological")

## ----hits_by_groupings_DT, warning=FALSE, eval=runTables----
#  site_df <- hits_by_groupings(chemical_summary,
#                               category = "Chemical Class",
#                               hit_threshold = 0.1)
#  
#  hits_by_groupings_DT(chemical_summary,
#                       category = "Chemical Class",
#                       hit_threshold = 0.1)

## ----hits_by_groupings_DT_site, warning=FALSE, eval=runTables----
#  hits_by_groupings_DT(maumee, category = "Chemical Class")

## ----makeMap, warning=FALSE, message=FALSE, eval=runTables----
#  make_tox_map(chemical_summary,
#               chem_site = tox_list$chem_site,
#               category = "Biological")
#  # More options:
#  # make_tox_map(chemical_summary,
#  #              chem_site = tox_list$chem_site,
#  #              category = "Chemical Class")
#  # make_tox_map(chemical_summary,
#  #              chem_site = tox_list$chem_site,
#  #              category = "Chemical")
#  

## ----clean------------------------------------------------
#Trim some names:
levels(chemical_summary$Class)[levels(chemical_summary$Class) == "Antimicrobial Disinfectants"] <- "Antimicrobial"
levels(chemical_summary$Class)[levels(chemical_summary$Class) == "Detergent Metabolites"] <- "Detergent"
levels(chemical_summary$Class)[levels(chemical_summary$Class) == "Flavors and Fragrances"] <- "Flavor/Fragrance"

## ----sites------------------------------------------------
#Ordering the sites to flow "downstream" of the Great Lakes:
sitesOrdered <- c("StLouis","Nemadji","WhiteWI","Bad","Montreal",
  "PresqueIsle","Ontonagon","Sturgeon","Tahquamenon","Burns",
  "IndianaHC","StJoseph","PawPaw","Kalamazoo","GrandMI",
  "Milwaukee","Muskegon","WhiteMI","PereMarquette","Manitowoc",
  "Manistee","Fox","Oconto","Peshtigo","Menominee",
  "Indian","Cheboygan","Ford","Escanaba","Manistique",
  "ThunderBay","AuSable","Rifle","Saginaw","BlackMI",
  "Clinton","Rouge","HuronMI","Raisin","Maumee",
  "Portage","Sandusky","HuronOH","Vermilion","BlackOH",
  "Rocky","Cuyahoga","GrandOH","Cattaraugus","Tonawanda",
  "Genesee","Oswego","BlackNY","Oswegatchie","Grass",
  "Raquette","StRegis")

 tox_list$chem_site$`Short Name` <- factor(tox_list$chem_site$`Short Name`,
               levels = sitesOrdered)

lakes_ordered <- c("Lake Superior",
                  "Lake Michigan",
                  "Lake Huron",
                  "Lake Erie",
                  "Lake Ontario")

tox_list$chem_site$site_grouping <- factor(tox_list$chem_site$site_grouping,
               levels=lakes_ordered)


## ----fig.width=10-----------------------------------------
summary_with_levels <- get_chemical_summary(tox_list,
                                            ACC,
                                            filtered_ep)

plot_tox_stacks(summary_with_levels, tox_list$chem_site, "Biological")
plot_tox_heatmap(summary_with_levels, tox_list$chem_site, "Biological")

