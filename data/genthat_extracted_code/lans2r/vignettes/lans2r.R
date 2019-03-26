## ---- message=FALSE, warning=FALSE---------------------------------------
library(lans2r)
library(dplyr)
library(knitr)
folder <- system.file("extdata", "nanosims_data", package = "lans2r") # data base directory

## ------------------------------------------------------------------------
data <- 
  load_LANS_summary (
    analysis = c("analysis1", "analysis2", "analysis3"), # the analysis folders
    base_dir = folder, # the data base director
    load_zstacks = T, # whether to load z-stacks as well (have to be exported from LANS!)
    info = c("turtle", "jetpack", "pizza"), # any additional information about the analyses
    quiet = F # output information about the files
  ) 

## ------------------------------------------------------------------------
data <- data %>% 
  calculate_sums(c(`13C`, `12C`), c(`15N12C`, `14N12C`)) %>% 
  calculate_ratios(c(`13C`, `12C`), c(`15N12C`, `14N12C`), c(`13C+12C`, `15N12C+14N12C`)) %>% 
  calculate_abundances(c(`13C`, `12C`), c(`15N12C`, `14N12C`)) 

## ------------------------------------------------------------------------
data <- data %>% 
  mutate(F13C_natural = 1.11/100, F15N_natural = 0.366/100) %>% 
  calculate(
    data_type = "APE",
    c(`13C F`, `F13C_natural`, `13C F sigma`), 
    c(`15N12C F`, `F15N_natural`, `15N12C F sigma`),
    # calculate the APE value as the fractional abundance enrichment above natural
    value_fun = function(val, nat, sigma) 100*(val - nat),
    # assume the error in natural abundance is negligible so only F error propagates
    error_fun = function(val, nat, sigma) 100*sigma,
    # replace the F in the existing columnes with APE to make the new variable
    name_fun = function(val, ...) sub("F", "APE [%]", deparse(substitute(val)))
  )

## ---- warning=FALSE------------------------------------------------------
data %>% head(n=10) %>% knitr::kable()

## ------------------------------------------------------------------------
data %>% spread_data() %>% head(n=10) %>% kable()

## ------------------------------------------------------------------------
data %>% filter(data_type %in% c("abundance", "APE"), plane == "1", ROI < 4) %>% 
  spread_data(errors = FALSE) %>% kable()

## ---- fig.width = 12, fig.height = 8-------------------------------------
library(ggplot2)
data %>% 
  ggplot() +
  aes(size, value, color = paste(analysis, info), shape = plane) + 
  geom_errorbar(aes(ymin = value - 2*sigma, ymax = value + 2*sigma), colour="black", width = 0) +
  geom_point(size=3) + 
    labs(x = expression("ROI size ["*mu*"m"^2*"]"), y="", 
         title = expression("ROI summary (2"*sigma*" error bars, may be smaller than symbols)"),
         color = "Analysis") + 
  facet_wrap(~variable, scales="free", nrow = 2) + 
  theme_bw()

## ---- fig.width = 6, fig.height = 6--------------------------------------
last_plot() %+% (data %>% filter(plane == "all", data_type == "ratio"))

## ------------------------------------------------------------------------
maps <- 
  load_LANS_maps (
    analysis = c("analysis1", "analysis2", "analysis3"),
    base_dir = folder
  ) 

## ------------------------------------------------------------------------
maps %>% head(n=10) %>% kable()

## ---- fig.width = 12, fig.height = 14------------------------------------
plot_maps(maps)

## ---- fig.width = 10, fig.height = 8-------------------------------------
plot_maps(maps %>% filter(variable == "14N12C", analysis %in% c("analysis1", "analysis2")), 
          normalize = FALSE, draw_ROIs = FALSE) + 
  theme(legend.position = "right") + labs(fill = "ion count")

