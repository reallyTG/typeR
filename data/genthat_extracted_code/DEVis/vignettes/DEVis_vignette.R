## ----loadData, echo = F, eval = TRUE-------------------------------------
#load("../data/exampleData.Rda")
knitr::opts_knit$set(root.dir = '../vignettes/')
knitr::opts_chunk$set(fig.path='figure/graphics-', 
                 cache.path='cache/graphics-', 
                 fig.align='center',
                 external=TRUE,
                 echo=TRUE,
                 warning=FALSE,
                 fig.pos='H'
                )
  a4width<- 8.3
  a4height<- 11.7
suppressWarnings({
library(kableExtra)
})
library(rmarkdown)
library(knitr)
options(knitr.table.format = "html") 
options(kableExtra.latex.load_packages = FALSE)

## ----initProjHide, echo = FALSE, eval = TRUE, results='hide', message=FALSE, warning=FALSE----
#This section hidden because it's correcting for relative paths and I want to show
#actual use, eval=F version provided below at initProjShow chunk. Also handling some other
#misc tasks in here for the purpose of the document.

#Just preparing a data summary table up here to show in the example data section.
three4 <- c(3,3,4,3)
threes <- c(3,3,3,3)
sampType <- c("Case", "Case", "Control", "Control")
treat <- c("Reston Virus (RESTV)", "Ebola Virus (EBOV)", "Uninfected (Mock)", "Lipopolysaccharide (LPS)")
sampSummary <- data.frame(sampType,treat,threes,three4,threes)
colnames(sampSummary) <- c("Sample Type", "Treatment", "6 Hours", "1 Day", "2 Days")

library(DEVis)

#Define the base directory for this analysis.  
base_dir <- normalizePath("../vignettes/")

#Generate the directory structure for results.
create_dir_struct(base_dir)

#Specify input directories.
cnt_dir        <- normalizePath("counts/")
tgt_dir        <- normalizePath("targets/")
init_data_paths(cnt_dir, tgt_dir)

#Specify count and target file names.
count_matrix  <- "count_matrix.txt"   
target_matrix <- "target_matrix.csv"   

#Set significance cutoffs for p-values and log fold-change.
init_cutoffs(p_signif=0.05, lfc_cut=1.5)

#Read count and target data 
count_data  <- prep_counts(count_matrix)
target_data <- prep_targets(target_matrix, delim="c")

#Initialize output mode.  
set_output_mode("screen")

## ----install, echo = TRUE, eval = FALSE----------------------------------
#  #Install DESeq2 dependency from bioconductor.
#  source("https://bioconductor.org/biocLite.R")
#  biocLite("DESeq2")
#  
#  #Install devtools to allow installation from GitHub
#  if (!require("devtools")) install.packages("devtools")
#  
#  #Install DEvis from GitHub repository.
#  devtools::install_github("price0416/DEvis/DEvis")
#  
#  #Load the package.
#  library(DEVis)

## ----dataTable, echo= FALSE, eval= TRUE----------------------------------

kable(sampSummary, format = "html", caption = "Summary of Data", booktabs = TRUE) %>%
kable_styling(bootstrap_options = c("striped", "hold_position"))

## ----countFormat, echo = FALSE, eval = TRUE------------------------------
#Sample format for count data.
kable(head(count_data[,1:4]), format = "html", booktabs = TRUE) %>%
kable_styling(bootstrap_options = c("striped", "scale_down"))


## ----targetFormat, echo = FALSE, eval = TRUE-----------------------------
#Sample format for target data.
kable(head(target_data[1:4,]), format = "html", booktabs = TRUE) %>%
kable_styling(bootstrap_options = c("striped", "scale_down"))

## ----initProjShow, echo = TRUE, eval = FALSE, results='hide', message=FALSE, warning=FALSE----
#  library(DEVis)
#  
#  #Define the base directory for this analysis.
#  base_dir <- "/path/to/base/"
#  
#  #Generate the directory structure for results.
#  create_dir_struct(base_dir)
#  
#  #Specify input directories.
#  cnt_dir        <- "/path/to/base/counts/"
#  tgt_dir        <- "/path/to/base/targets/"
#  init_data_paths(cnt_dir, tgt_dir)
#  
#  #Specify count and target file names.
#  count_matrix  <- "count_matrix.txt"
#  target_matrix <- "target_matrix.csv"
#  
#  #Set significance cutoffs for p-values and log fold-change.
#  init_cutoffs(p_signif=0.05, lfc_cut=1.5)
#  
#  #Read count and target data
#  count_data  <- prep_counts(count_matrix)
#  target_data <- prep_targets(target_matrix, delim="c")
#  
#  #Initialize output mode.
#  set_output_mode("both")
#  
#  

## ----dirStruct, eval= FALSE----------------------------------------------
#  #' ~/DEVis/
#  #'   /results/
#  #'     /DE/
#  #'       /boxplot/
#  #'       /counts/
#  #'       /data/
#  #'       /density_plots/
#  #'       /divergence/
#  #'       /heatmaps/
#  #'       /profile_plots/
#  #'       /series_plots/
#  #'       /volcano/
#  #'    /dendrograms/
#  #'    /geneplots/
#  #'    /group_stats/
#  #'    /MDS/
#  #'      /standard/
#  #'      /hulls/
#  #'    /sample_distance/
#  #'      /euclidian/
#  #'      /poisson/

## ----startTgt, echo = FALSE, eval = TRUE---------------------------------
kable(head(target_data), format = "html", booktabs = TRUE) %>%
kable_styling(bootstrap_options = c("striped", "scale_down"))

## ----prepComposite, echo = TRUE, eval = TRUE, results='show', message=FALSE, warning=FALSE----
#Create a composite field for treatment and time.
target_data <- make_composite_field(c("time","treatment"))

#Let's also create a composite field for treatment, time, and donor ID.
target_data <- make_composite_field(c("time","treatment", "donor"))


## ----endTgt, echo = FALSE, eval = TRUE-----------------------------------
kable(head(target_data), format = "html", booktabs = TRUE) %>%
kable_styling(bootstrap_options = c("striped", "scale_down"))

## ----filterData, echo = TRUE, eval = TRUE, results='show', message=FALSE, warning=FALSE----

#Keep timepoints 1d, 2d, and 6h, but throw away "restim" samples.
subset  <- keep_data_subset(counts=count_data,
                                targets=target_data,
                                target_count_id_map="targetID",
                                target_keep_col="time",
                                target_keep_val=c("1d","2d","6h"))

#Update count and target data to the filtered set.
count_data  <- subset[[1]]
target_data <- subset[[2]]

## ----doDDS, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE----

#Prepare our DESeq2 Object based on our data and experimental design.
dds <- prep_dds_from_data(count_input=count_data, 
                          target_input=target_data, 
                          experiment_design= ~ time_treatment,
                          stabilization="vst")


## ----doEuclid, echo = TRUE, eval = TRUE, results='show', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
plot_euclid_dist(row_labels="time_treatment_donor", filename="euclidian_distance.pdf", 
                 theme=2, returnData=FALSE)


## ----doMDS, echo = TRUE, eval = TRUE, results='show', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
#Create a MDS plot showing effects of treatment and time.
plot_mds(filename="MDS.pdf", 
         color_var="treatment", 
         shape_var="time", 
         theme=1)

## ----doMDSHull, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
#Create a MDS Hull plot showing effects of treatment and time.
plot_mds_hulls(filename="MDS_Hull.pdf", 
               color_var="treatment", 
               shape_var="none", 
               deOnly=FALSE, 
               showLabel=TRUE, 
               hullType="solid", 
               theme=1)

## ----filterData2, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE----

#Remove the outlying sample from our data.
subset  <- exclude_data_subset(counts=count_data,
                                targets=target_data,
                                target_count_id_map="targetID",
                                target_exclude_col="targetID",
                                target_exclude_val="Donor10_MOCK_1D_S19")

#Update count and target data to the filtered set.
count_data  <- subset[[1]]
target_data <- subset[[2]]

#Update our DESeq2 Object based on the filtered data.
dds <- prep_dds_from_data(count_input=count_data, 
                          target_input=target_data, 
                          experiment_design= ~ time_treatment,
                          stabilization="vst")


## ----doMDSHull2, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
#Create a MDS Hull plot showing effects of treatment and time.
plot_mds_hulls(filename="MDS_Hull_filtered.pdf", 
               color_var="treatment", shape_var="time", 
               deOnly=FALSE, showLabel=FALSE, 
               hullType="solid", theme=1)

## ----doMDSHull3, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 5, fig.width = 5, fig.align = "center"----
plot_mds_hulls(filename="MDS_Hull_byTime.pdf", 
               color_var="time", 
               shape_var="treatment", 
               deOnly=FALSE, 
               showLabel=FALSE, 
               hullType="solid", 
               theme=1,
               exclude_data=TRUE, 
               idCol="targetID", 
               excludeCol="treatment", 
               excludeName="mock")

## ----doMDSHull4, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
plot_mds_hulls(filename="MDS_Hull_byDonor.pdf", 
               color_var="donor", 
               shape_var="time_treatment", 
               deOnly=FALSE, 
               showLabel=FALSE, 
               hullType="solid", 
               theme=1)

## ----doGroupStats, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 7, fig.width = 7, fig.align = "center"----
plot_group_stats(filename="Normalized_Counts.pdf",
                 id_field="targetID",
                 groupBy="time_treatment", 
                 normalized=TRUE, 
                 theme=1)

## ----runDE, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE----
#Run DESeq on our previously prepared DESeq2 object.
dds <- DESeq(dds)

## ----getContrasts, echo = TRUE, eval = TRUE, results='show', message=FALSE, warning=FALSE----
#Time matched ebola vs mock contrasts.
res.ebov.6h.vs.mock <- results(dds, contrast=c("time_treatment", "6h_ebov", "6h_mock")) 
res.ebov.d1.vs.mock <- results(dds, contrast=c("time_treatment", "1d_ebov", "1d_mock")) 
res.ebov.d2.vs.mock <- results(dds, contrast=c("time_treatment", "2d_ebov", "2d_mock")) 

#Time matched reston vs mock contrasts.
res.restv.6h.vs.mock <- results(dds, contrast=c("time_treatment", "6h_restv", "6h_mock")) 
res.restv.d1.vs.mock <- results(dds, contrast=c("time_treatment", "1d_restv", "1d_mock")) 
res.restv.d2.vs.mock <- results(dds, contrast=c("time_treatment", "2d_restv", "2d_mock")) 

#Make a list of all of our contrasts.
result_list <- list(res.ebov.6h.vs.mock, res.ebov.d1.vs.mock, res.ebov.d2.vs.mock,
                    res.restv.6h.vs.mock, res.restv.d1.vs.mock, res.restv.d2.vs.mock)

#Aggregate differentially expressed genes across all contrast results.
master_dataframe <- create_master_res(result_list, filename="master_DE_list.txt", method="union", lfc_filter=TRUE)


## ----doCounts, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 5, fig.width = 5, fig.align = "center"----
de_counts(result_list, 
          filename="DE_counts.pdf", 
          theme=1)

## ----doDensity, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
de_density_plot(result_list, 
                filename="aggregate_density.pdf", 
                type="pval", 
                method="union")

## ----doDiverge, echo = TRUE, eval = FALSE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
#  de_diverge_plot(result_list, filename="DE_diverge.pdf", theme=1)

## ----doDEBox, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
de_boxplot(result_list, filename="DE_boxplot.pdf", theme=4)

## ----doDEVolcano, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
de_volcano(result_list, filename="DE_volcano.pdf", theme=1, strict_scale=TRUE)

## ----doHeat1, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 6, fig.width = 6, fig.align = "center"----
de_heat(result_list, anno_columns=c("time", "treatment"), 
        filename="upReg_heatmap.pdf", sort_choice="max", 
        numGenes=25, theme=2)

## ----doProfile, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 5, fig.width = 5, fig.align = "center"----
de_profile_plot(result_list,filename="DE_profile_upReg_10.pdf", 
                sort_choice="max", numGenes=25, theme=1)

## ----doHeat2, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 7, fig.width = 7, fig.align = "center"----
#de_heat(result_list, anno_columns=c("time", "treatment"), 
 #       filename="upReg_heatmap.pdf", sort_choice="max", 
 #       specific_genes=c("CCL4L2", "IL29", "IRG1", "IL12A"),
  #      cluster_contrasts=FALSE,
   #     theme=2)

## ----doGenePlot, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 7, fig.width = 7, fig.align = "center"----
plot_gene(filename="IL29.pdf", gene_name="IL29", 
          groupBy="time_treatment", theme=4)

## ----doSeries, echo = TRUE, eval = TRUE, results='hide', message=FALSE, warning=FALSE, fig.height = 7, fig.width = 7, fig.align = "center"----
de_series(result_list, filename="series_pattern.pdf", 
          designVar="time_treatment", groupBy="time_treatment", 
          method="mean", numGroups=4, writeData=TRUE, returnData=FALSE, 
          theme=1)

## ----cleanFolders, echo = FALSE, eval = TRUE, results='hide', message=FALSE, warning=FALSE----

unlink("../vignettesresults/", recursive = TRUE)


