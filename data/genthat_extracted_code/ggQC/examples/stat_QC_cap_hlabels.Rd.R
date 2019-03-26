library(ggQC)


### Name: stat_QC_cap_hlabels
### Title: horizontal Label Capability Stat
### Aliases: stat_QC_cap_hlabels

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
## Example 1 XmR    ##
######################
##You may need to use the r-studio Zoom for these plots or make the size of the
##stat_QC_cap_summary smaller with size = some number"

method <- "XmR"

# Normal Histogram XmR --------------------------------------------------------

EX1.1 <-  ggplot(df[df$ProcessID == 1,], aes(x=Value, QC.Subgroup=Subgroup)) +
  geom_histogram(binwidth = 1, color="purple") +
  geom_hline(yintercept=0, color="grey") +
  stat_QC_cap_vlines(LSL = 5, USL = 15, show=c("X", "LSL", "USL"), method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, show=c("X", "LSL", "USL"), method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=2, size=4) +
  scale_x_continuous(expand =  expand_scale(mult = c(0.15,.8))) +
  ylim(0,45)
#Ex1.1

# Facet Histogram XmR -----------------------------------------------------

EX1.2 <- ggplot(df[order(df$Process_run_id),],
                aes(x=Value, QC.Subgroup=Subgroup, color=ProcessID)) +
  geom_histogram(binwidth = 1) +
  geom_hline(yintercept=0, color="grey") +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),#show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8))) +
  facet_grid(.~ProcessID) + ylim(0,45)
#EX1.2

# Facet Density Plot XmR -------------------------------------------------

EX1.3 <- ggplot(df[df$ProcessID == 1,], aes(x=Value, QC.Subgroup=Subgroup)) +
  geom_density(bw = .4, fill="purple", trim=TRUE) +
  geom_hline(yintercept=0, color="grey") +
  stat_QC_cap_vlines(LSL = 5, USL = 15, show=c("X", "LSL", "USL"), method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, show=c("X", "LSL", "USL"), method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=2, size=4) +

  scale_x_continuous(expand =  expand_scale(mult = c(0.15,.8)))  + ylim(0,.5)
#EX1.3

# Facet Density Plot XmR --------------------------------------------------

EX1.4 <- ggplot(df[order(df$Process_run_id),],
                aes(x=Value, QC.Subgroup=Subgroup, color=ProcessID)) +
  geom_density(bw = .4, fill="grey", trim=TRUE ) +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method, #py=.3,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8))) +
  # geom_hline(yintercept=0, color="black") +
  facet_grid(.~ProcessID) + ylim(0,.5)
#EX1.4


########################################
##  Example 2: xBar.rBar or xBar.sBar ##
########################################

method <- "xBar.rBar" #Alternativly Use "xBar.sBar" if desired


# Single Histogram xBar.rBar ----------------------------------------------

EX2.1 <- ggplot(df[df$ProcessID==1,], aes(x=Value, QC.Subgroup=Subgroup)) +
  geom_histogram(binwidth = 1) +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method, #py=.3,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8))) #+
#EX2.1


# Faceted Histogram xBar.rBar ---------------------------------------------

EX2.2 <- ggplot(df, aes(x=Value, QC.Subgroup=Subgroup)) +
  geom_histogram(binwidth = 1) +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method, #py=.3,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8)))+
  facet_grid(.~ProcessID, scales="free_x")
#EX2.2

# Single Density xBar.rBar ----------------------------------------------

EX2.3 <- ggplot(df[df$ProcessID==1,], aes(x=Value, QC.Subgroup=Subgroup)) +
  geom_density(bw = .4, fill="grey", alpha=.4) +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method, #py=.3,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8))) #+
#EX2.3

# Faceted Density xBar.rBar ---------------------------------------------

EX2.4 <-  ggplot(df, aes(x=Value, QC.Subgroup=Subgroup)) +
  geom_density(bw = .4, fill="grey", alpha=.4) +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method, #py=.3,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8)))+
  facet_grid(.~ProcessID, scales="free_x")
#EX2.4


###############################
##  Example 3: xBar.rMedian  ##
###############################

## Plots involving medians should give warning: "median based QC methods represent
## at best *potential* process capability"

##These plot work the same as in examples 2.X; below is an example.

method <- "xBar.rMedian"
EX3.1 <- ggplot(df[order(df$Process_run_id),], aes(x=Value, QC.Subgroup=Run)) +
  geom_histogram(binwidth = 1) +
  stat_QC_cap_vlines(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_vlabels(LSL = 5, USL = 15, method=method) +
  stat_QC_cap_summary(LSL = 5, USL = 15, method=method, #py=.3,
                      #show="ALL",
                      #show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk",
                      #       "LCL", "X", "UCL", "Sig"),
                      #show=c("Sig","TOL", "DNS"),
                      show=c("TOL","DNS", "Cp", "Cpk", "Pp", "Ppk"),
                      color="black", digits=4, size=4) +
  scale_x_continuous(expand =  ggplot2::expand_scale(mult = c(0.15,.8)))
#EX3.1



