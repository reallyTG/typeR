library(haploReconstruct)


### Name: ex_dat
### Title: Example data set
### Aliases: ex_dat

### ** Examples

# The following workflow provides a general example on 
# haplotype analysis on the provided example data set
#
# example data was previously formated from a sync file with an added header using:
# ex_dat=sync_to_frequencies(file="ex_dat.sync", 
#                  base.pops=rep(c(TRUE,rep(FALSE,3)),times=5), header=TRUE)
# The file contains samples for F0, F20, F40 and F60, each for five replicates simualations.

# filter replicated time series data for informative SNPs
dat_filtered=initialize_SNP_time_series(chr=ex_dat$chr, pos=ex_dat$pos, 
base.freq=ex_dat$basePops, lib.freqs=ex_dat[,7:ncol(ex_dat), with=FALSE], 
pop.ident=rep(1:5,each=4), pop.generation=rep(c(0:3)*20,times = 5), use.libs=rep(TRUE,20))

# reconstruct haplotype-blocks
dat_reconst=reconstruct_hb(dat_filtered, chrom="2R")

# various ways of inspecting the results
#
?plot.hbr
plot(dat_reconst, indicate_shared=TRUE, addPoints=TRUE)
#
#?summary.hbr
summary(dat_reconst)
#
?plot_hbr_freq
par(mfrow=c(2,1),mar=c(4,4,1,1),oma=c(0,0,0,0))
plot_hbr_freq(dat_reconst, hbr_id=2, replicate=1, timepoint=c(0,20,40,60), window=5)
plot_hbr_freq(dat_reconst, hbr_id=2, replicate=2, timepoint=c(0,20,40,60), window=5)
# Note: For the example parameter settings reconstructed haplotype-block hbr_id=2
# corresponds to the focal selected haplotype shown in Fig. 1A 
# (Franssen, Barton & Schloetterer 2016,
# Reconstruction of haplotype-blocks selected during experimental evolution, MBE).
#
?map
map(dat_reconst)
#
?rev_map
rev_map(dat_reconst)
#
?plot_cluster_trajectories
plot_cluster_trajectories(dat_reconst, window=38)
#
?plot_marker_trajectories
plot_marker_trajectories(dat_reconst, hbr_id=2)
#
?inspect_window
inspect_window(dat_reconst, window=38)
#
?inspect_window_PCA
inspect_window_PCA(dat_reconst, window=38)
#
?inspect_window_avLink
inspect_window_avLink(dat_reconst, window=38)
#
?inspect_window_dbScan
inspect_window_dbScan(dat_reconst, window=38, eps=1)
#
?markers
markers(dat_reconst, hbr_id=2)
#
?number_hbr
number_hbr(dat_reconst)



