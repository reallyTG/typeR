library(ggQC)


### Name: stat_QC_labels
### Title: Write QC Line Labels to ggplot QC Charts.
### Aliases: stat_QC_labels

### ** Examples

#########################
#  Example 1: mR Chart  #
#########################

# Load Libraries ----------------------------------------------------------
 require(ggQC)
 require(ggplot2)

# Setup Data --------------------------------------------------------------
 set.seed(5555)
 Process1 <- data.frame(processID = as.factor(rep(1,100)),
                        metric_value = rnorm(100,0,1),
                        subgroup_sample=rep(1:20, each=5),
                        Process_run_id = 1:100)
 set.seed(5556)
 Process2 <- data.frame(processID = as.factor(rep(2,100)),
                        metric_value = rnorm(100,5, 1),
                        subgroup_sample=rep(1:10, each=10),
                        Process_run_id = 101:200)

 Both_Processes <- rbind(Process1, Process2)

# Facet Plot - Both Processes ---------------------------------------------
EX1.1 <- ggplot(Both_Processes, aes(x=Process_run_id, y = metric_value)) +
 geom_point() + geom_line() + stat_QC(method="XmR") +
 stat_QC_labels(method="XmR", digits = 2) +
 facet_grid(.~processID, scales = "free_x")
#EX1.1

EX1.2 <- ggplot(Both_Processes, aes(x=Process_run_id, y = metric_value)) +
 stat_mR() + ylab("Moving Range") +
 stat_QC_labels(method="mR", digits = 2) +
 facet_grid(.~processID, scales = "free_x")
#EX1.2

#############################
#  Example 2:  XbarR Chart  #
#############################
# Facet Plot - Studentized Process ----------------------------------------

EX2.1 <- ggplot(Both_Processes, aes(x=subgroup_sample,
                          y = metric_value,
                          group = processID)) +
 geom_point(alpha=.2) +
 stat_summary(fun.y = "mean", color="blue", geom=c("point")) +
 stat_summary(fun.y = "mean", color="blue", geom=c("line")) +
 stat_QC() + facet_grid(.~processID, scales = "free_x") +
 stat_QC_labels(text.size =3, label.size=.1)
#EX2.1

EX2.2 <- ggplot(Both_Processes, aes(x=subgroup_sample,
                          y = metric_value,
                          group = processID)) +
 stat_summary(fun.y = "QCrange", color="blue", geom = "point") +
 stat_summary(fun.y = "QCrange", color="blue", geom = "line") +
 stat_QC(method="rBar") +
 stat_QC_labels(digits=2, method="rBar") +
 ylab("Range") +
 facet_grid(.~processID, scales = "free_x")
 #EX2.2



