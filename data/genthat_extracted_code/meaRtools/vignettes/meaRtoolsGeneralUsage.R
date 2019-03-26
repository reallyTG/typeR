## ----install-------------------------------------------------------------
#install.packages( "meaRtools",repos="http://cran.us.r-project.org")

## ----rsetup-knitr,eval=TRUE,include=FALSE--------------------------------
require(knitr)
opts_chunk$set(cache=FALSE)

## ----library-------------------------------------------------------------
library(meaRtools)
library(plyr)
library(ggplot2)
library(reshape2)

## ----readdata------------------------------------------------------------

# set path to "_spike_list.csv" files from the file path in 'filesPath'
spk_list_files<-c(
                system.file("extdata","exampleRecording_1012016_plate1_DIV3_spike_list.csv.gz",package = "meaRtools"),
                system.file("extdata","exampleRecording_1012016_plate1_DIV4_spike_list.csv.gz",package = "meaRtools"))

# set the recording layout file "_expLog.csv"
experimental_log_file <- system.file("extdata","exampleRecording_1012016_plate1_expLog.csv.gz",package = "meaRtools")

## ----set-dir-------------------------------------------------------------
# The next command will get the directory of the csv files
data_dir<-tempdir()

# creating output under the new temp directory
print(paste0("Creating output folders under ",data_dir))

# create the output directory as /Analysis under the data_dir
output_dir<-file.path( data_dir , "Analysis" ) 
dir.create(output_dir)

# create the output directory for single recording analysis 
output_perDIV_dir<-file.path( data_dir , "Analysis/outputPerDIV" ) 
dir.create(output_perDIV_dir)

# create the output directory for R objects of analyzed recordings 
r_object_dir<-file.path( data_dir , "Analysis/R_Objects" )
dir.create(r_object_dir)

# create the output directory for log files
log.dir<-file.path( output_dir , "LogFiles" ) 
dir.create(log.dir)

# For organization sake, set a list object to hold all output directories 
analysis<-list(spikeFiles = spk_list_files, output_dir = output_dir,
           r_output_dir = r_object_dir, output_perDIV_dir = output_perDIV_dir)


## ----spike-list----------------------------------------------------------
# A loop to go over all recording files
for (i in 1:length(spk_list_files)){
  #save title for output file name
  title<-strsplit(basename(spk_list_files[i]), ".csv")[[1]][1]
  #load plate design info for each file in the list
  plate_chem_info<-get_experimental_log_file(spk_list_files[i], experimental_log_file)
  
    # convert the spike list data to a 'spike.list' class Robject
  analysis$Robject[i]<-read_spikelist(key=title, spk_list_file=spk_list_files[i],          chem_info=plate_chem_info,r_object_dir=r_object_dir) 
}

## ----parameters----------------------------------------------------------
data("parameters")

## ----spike-features------------------------------------------------------

# Construct the 'spike.list' object and calculate spike features
s<-calculate_spike_features(analysis$Robject, parameters)

# As mutual information and entropy values are considered spike features, we will calculate them here
# based on the spike data of each electrode
for (i in 1:length(s)) {
  ent_mi_data <- calculate_entropy_and_mi(s[[i]], s[[i]]$treatment, mult_factor=1.5, bin_size=0.1)
  s[[i]]$mutual_inf <- ent_mi_data[["data_dists"]][["MI"]]
  s[[i]]$entropy <- ent_mi_data [["data_dists"]][["ENT"]]
}

# Select burst algorithm
parameters$burst_type="ps"

# Detect bursts and calculate their feature statistics
s<-calculate_burst_features(s)

# Iterate through all the recordings to calculate inter-spike intervals and well level mean firing rate and add that to the 'spike.list' object

for (i in 1:length(s)) {
  s[[i]] <- calculate_isis(s[[i]])
  s[[i]]$well_stats <- compute_mean_firingrate_by_well(s[[i]])
}


## ----B3_41---------------------------------------------------------------
s[[1]]$spikes$B3_41

## ----E7_42---------------------------------------------------------------
s[[1]]$allb$E7_42

## ----all-features--------------------------------------------------------

# Iterate through all the recordings
for (i in 1:length(s)) {

  #Calculate Network Spikes
  nspikes_old <- calculate_network_spikes(s[[i]],parameters$sur, parameters$ns_n, parameters$ns_t)
  
  # Extract network spike features that will be printed later
  nspikes <- summarize_network_spikes(s[[i]],nspikes_old,ns_e = 1, parameters$sur)
  
  # Add network spike data to the 'spike.list' object
  s[[i]]$ns_all<-nspikes$ns_all
}

## ----en_brief------------------------------------------------------------

s[[i]]$ns_all$B5$en_brief


## ----nb------------------------------------------------------------------

   nb.list <- calculate_network_bursts(s,parameters$Sigma,
                                       parameters$min_electrodes,
                                       parameters$local_region_min_nae)
    
    nb_features <- nb_matrix_to_feature_dfs( nb.list$nb_features_merged )

    # attach data to s object
    for (i in 1:length(s) ){
      s[[i]]$nb_all<-nb.list$nb_all[[i]]
      s[[i]]$data.frame$nb_features<-nb.list$nb_features[[i]]
    }
    

## ----sttc----------------------------------------------------------------
for (i in 1:length(s)) {
  s[[i]]$mean_sttc <- compute_mean_sttc_by_well(s[[i]])
}

## ----unlist--------------------------------------------------------------
unlist(s[[1]]$mean_sttc)

## ----plot-summary--------------------------------------------------------

# print spikes graphs (pdf format) for each recording
plot_plate_summary_for_spikes(s,analysis$output_perDIV_dir)

# write spike feature tables for each recording
suppressWarnings(write_plate_summary_for_spikes(s,analysis$output_perDIV_dir))

## ----pdfs----------------------------------------------------------------
# plot burst pdfs for each recording
suppressWarnings(plot_plate_summary_for_bursts(s,analysis$output_perDIV_dir,parameters))

# write burst feature tables for each recording
write_plate_summary_for_bursts(s,analysis$output_perDIV_dir)

## ----ns------------------------------------------------------------------
i=1 
# Get plate name
basename <- strsplit(basename(s[[i]]$file), "[.]")[[1]][1]

#Use the next commands for plotting all the ns graphs. Try opening a pdf file so that all will be printed to the same file (which is automatically done for burst features):

pdf(file=paste0(analysis$output_perDIV_dir,"/ns_plot.pdf"))
xyplot_network_spikes(nspikes)	
plot_active_wells_network_spikes(nspikes)
dev.off()

# write network spike data to output file
write_network_spikes_to_csv(s[[i]],nspikes,analysis$output_perDIV_dir)

# Check the graphs and csvs printed under the analysis$output_perDIV_dir path

## ----aggregate-----------------------------------------------------------
spike_features = aggregate_features(s, "spike",parameters)
ns_features = aggregate_features(s, "ns",parameters)
burst_features = aggregate_features(s, "burst",parameters)

# printing spike features nae
spike_features$nae

#Feel free to explore the spike/ns/burst and nb_features for the different features they offer

## ----filtering-----------------------------------------------------------

# All uncalculated aEs were set previously to NA, convert all those to 0 aE before the filter
nae <- spike_features$nae
nae[is.na(nae)] <- 0

# filter spike wells
spike_features = lapply(spike_features, function(x) filter_wells( x, nae, parameters$well_min_rate, parameters$well_max_div_inactive_ratio))

# filter network burst wells
nb_features <- lapply(nb_features, function(x) filter_wells(x, nae, parameters$well_min_rate, parameters$well_max_div_inactive_ratio ))
# re-order features by well name
nb_features <- lapply(nb_features, function(x) x[order(x[,'well']),])

# printing spike features nae after filter
spike_features$nae


## ----csvs----------------------------------------------------------------
#write csvs 
write_features_to_files(s, spike_features, analysis$output_dir, "spikes")
write_features_to_files(s, burst_features, analysis$output_dir, "bursts")
write_features_to_files(s, ns_features, analysis$output_dir, "ns")
write_features_to_files(s, nb_features, analysis$output_dir, "nb")

## ----permute-------------------------------------------------------------

suppressMessages(permute_features_and_plot(s, "treatX", parameters$perm_n, spike_features, "spikes", analysis$output_dir))
suppressMessages(permute_features_and_plot(s, "treatX", parameters$perm_n, burst_features, "bursts", analysis$output_dir))
suppressMessages(permute_features_and_plot(s, "treatX", parameters$perm_n, ns_features, "ns", analysis$output_dir))
suppressMessages(permute_features_and_plot(s, "treatX", parameters$perm_n, nb_features, "nb", analysis$output_dir))


## ----dist_perm-----------------------------------------------------------
result <- suppressWarnings(dist_perm(paste0(analysis$output_perDIV_dir,"/distributionFiles/exampleRecording_1012016_plate1_DATE_TIME_isi_distributions.csv"),1000,"treatX","treatY"))

plot(result$data_wt_original,col="blue",main=basename,type="l",lwd=3,xlab="ISI")
points(result$data_ko_original,col="green",type="l",lwd=3)
par(mfrow=c(1,1))  
mtext(side = 1, at = 0, line = 4,
          text = paste("P.value EMD after 1000 permutations: ",format((1-result$perm_EMD), digits = 2),sep=""),col = "black",cex= 0.9,adj=0)    

## ----dist_perm2----------------------------------------------------------
suppressWarnings(result <- dist_perm(paste0(analysis$output_perDIV_dir,"/distributionFiles/exampleRecording_1012016_plate1_DATE_TIME_isi_distributions.csv"),1000,"treatX","treatY"))

plot(result$data_wt,col="blue",main=basename,type="l",lwd=3,xlab="ISI")
points(result$data_ko,col="green",type="l",lwd=3)
par(mfrow=c(1,1))  
mtext(side = 1, at = 0, line = 4,
      text = paste("P.value Max distance after 1000 permutations: ",format((1-result$perm_p), digits = 3),sep=""),col = "black",cex= 0.9,adj=0)    

