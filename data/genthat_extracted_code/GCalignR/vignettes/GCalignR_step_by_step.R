## ---- echo = FALSE-------------------------------------------------------
library(knitr)
knitr::opts_chunk$set(cache = FALSE, fig.width = 8, fig.height = 8,highlight = TRUE,comment = "#>",strip.white = TRUE,collapse = TRUE, fig.align = "center", cache = F, warning = F, message = F)

## ---- out.width = 650, fig.retina = NULL, echo = FALSE, fig.cap="Extended Workflow using GCalignR in the analysis of chemical similarity patterns."----
knitr::include_graphics("workflow.png") 

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("mottensmann/GCalignR", build_vignettes = TRUE)

## ------------------------------------------------------------------------
library("GCalignR") 

## ---- eval = FALSE-------------------------------------------------------
#  ?GCalignR # documentation

## ---- out.width = 650, fig.retina = NULL, echo = FALSE,fig.align='center', fig.cap="Example of a input datafile. Only the head of the file is shown."----
knitr::include_graphics("example.jpg") 

## ---- out.width = 650, fig.retina = NULL, echo = FALSE, fig.cap="Tail of the input file"----
knitr::include_graphics("example2.jpg") 

## ------------------------------------------------------------------------
data("peak_data")
length(peak_data) # number of individuals, i.e. number of list elements
names(peak_data) # names of individuals, i.e. names of list elements 
head(peak_data[[1]]) # column names and data, i.e. one data.frame of list element 

## ------------------------------------------------------------------------
# if plot = T, a histogram of peaks is plotted
check_input(data = peak_data,plot = F)  

## ---- fig.width=7, fig.height = 5, fig.cap="Figure 4: Histogram of Peak interspaces"----
peak_interspace(data = peak_data, rt_col_name = "time",
                quantile_range = c(0, 0.8), quantiles = 0.05)

## ---- eval = FALSE-------------------------------------------------------
#  peak_data <- peak_data[1:4] # subset for speed reasons
#  peak_data_aligned <- align_chromatograms(data = peak_data, # input data
#      rt_col_name = "time", # retention time variable name
#      rt_cutoff_low = 15, # remove peaks below 15 Minutes
#      rt_cutoff_high = 45, # remove peaks exceeding 45 Minutes
#      reference = NULL, # choose automatically
#      max_linear_shift = 0.05, # max. shift for linear corrections
#      max_diff_peak2mean = 0.03, # max. distance of a peak to the mean across samples
#      min_diff_peak2peak = 0.03, # min. expected distance between peaks
#      blanks = "C2", # negative control
#      delete_single_peak = TRUE, # delete peaks that are present in just one sample
#      write_output = NULL) # add variable names to write aligned data to text files

## ---- eval = FALSE-------------------------------------------------------
#  peak_data_aligned$aligned$time # to access the aligned retention times
#  peak_data_aligned$aligned$area # to access the aligned area data

## ------------------------------------------------------------------------
data("aligned_peak_data") 

## ----message=FALSE,fig.width=8,fig.height=8, fig.cap="Heatmap showing the distribution of peaks and the variability within substances"----
gc_heatmap(aligned_peak_data,threshold = 0.03) 

## ----message=FALSE,fig.width=8,fig.height=8, fig.cap="Diagnostic plot of the aligned dataset"----
plot(aligned_peak_data,which_plot = "all") # Plots, can be invoked separetely

## ---- eval=TRUE----------------------------------------------------------
print(aligned_peak_data) 

## ------------------------------------------------------------------------
## normalise area and return a data frame
scent <- norm_peaks(aligned_peak_data, conc_col_name = "area",rt_col_name = "time",out = "data.frame") 
## common transformation for abundance data to reduce the extent of mean-variance trends
scent <- log(scent + 1) 

## ---- results = 'hide'---------------------------------------------------
## GCalignR contains factors for the chemical dataset
data("peak_factors") 
## keep order of rows consistent
scent <- scent[match(row.names(peak_factors),row.names(scent)),] 
## NMDS using Bray-Curtis dissimilarities
scent_nmds <- vegan::metaMDS(comm = scent, distance = "bray")
## get x and y coordinates
scent_nmds <- as.data.frame(scent_nmds[["points"]])  
## add the colony as a factor to each sample
scent_nmds <- cbind(scent_nmds,colony = peak_factors[["colony"]])

## ----fig.align="center", fig.cap="NMDS plot"-----------------------------
## ordiplot with ggplot2
library(ggplot2)
ggplot(data = scent_nmds,aes(MDS1,MDS2,color = colony)) +
    geom_point() + 
    theme_void() + 
    scale_color_manual(values = c("blue","red")) +
    theme(panel.background = element_rect(colour = "black", size = 1.25,
            fill = NA), aspect.ratio = 1, legend.position = "none")

## ------------------------------------------------------------------------
## colony effect
vegan::adonis(scent ~ peak_factors$colony,permutations = 999) 
## no dispersion effect
anova(vegan::betadisper(vegan::vegdist(scent),peak_factors$colony))

