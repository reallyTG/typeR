library(ggQC)


### Name: stat_QC_Capability
### Title: Auto QC Capability Stat Function
### Aliases: stat_QC_Capability

### ** Examples

# Load Libraries ----------------------------------------------------------
require(ggQC)
require(ggplot2)
# Setup Data --------------------------------------------------------------
set.seed(5555)
Process1 <- data.frame(ProcessID = as.factor(rep(1,100)),
                      Value = rnorm(100,10,1),
                      Subgroup = rep(1:20, each=5),
                      Process_run_id = 1:100)
set.seed(5556)
Process2 <- data.frame(ProcessID = as.factor(rep(2,100)),
                      Value = rnorm(100,20, 1),
                      Subgroup = rep(1:10, each=10),
                      Process_run_id = 101:200)
df <- rbind(Process1, Process2)

######################
##  Example 1 XmR   ##
######################

##You may need to use the r-studio Zoom for these plots or make the size of the
##stat_QC_cap_summary smaller with size = some number"

# Normal Histogram XmR --------------------------------------------------------
EX1.1 <-  ggplot(df[df$ProcessID == 1,], aes(x=Value, QC.Subgroup=Subgroup)) +
geom_histogram(binwidth = 1, color="purple") +
 geom_hline(yintercept=0, color="grey") +
 stat_QC_Capability(LSL=5, USL=15, show.cap.summary = "all", method="XmR") +
 scale_x_continuous(expand =  expand_scale(mult = c(0.15,.8))) +
 ylim(0,45)
#Ex1.1

# Facet Histogram XmR -----------------------------------------------------
EX1.2 <- ggplot(df[order(df$Process_run_id),],
aes(x=Value, QC.Subgroup=Subgroup, color=ProcessID)) +
geom_histogram(binwidth = 1) +
 geom_hline(yintercept=0, color="grey") +
 stat_QC_Capability(LSL=5, USL=15, show.cap.summary = "all", method="XmR") +
 scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8))) +
 facet_grid(.~ProcessID, scales = "free_x") + ylim(0,45)
#EX1.2

# Normal Density XmR --------------------------------------------------------
EX1.3 <- ggplot(df[df$ProcessID == 1,], aes(x=Value, QC.Subgroup=Subgroup)) +
geom_density(bw = .4, fill="purple", trim=TRUE) +
 geom_hline(yintercept=0, color="grey") +
 stat_QC_Capability(LSL=5, USL=15, show.cap.summary = "all", method="XmR") +
 scale_x_continuous(expand =  expand_scale(mult = c(0.15,.8)))  + ylim(0,.5)
#EX1.3

########################################
##  Example 2: xBar.rBar or xBar.sBar ##
########################################
# Single Histogram xBar.rBar ----------------------------------------------
EX2.1 <- ggplot(df[df$ProcessID==1,], aes(x=Value, QC.Subgroup=Subgroup)) +
 geom_histogram(binwidth = 1) +
 stat_QC_Capability(LSL=5, USL=15, method="xBar.rBar") +
 scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8))) #+
#EX2.1



