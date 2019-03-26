library(ggQC)


### Name: stat_mR
### Title: Generate mR chart in ggplot
### Aliases: stat_mR

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

# One Plot Both Processes -------------------------------------------------
 ggplot(Both_Processes, aes(x=Process_run_id, y = metric_value)) +
   stat_mR() + ylab("Moving Range")

# Facet Plot - Both Processes ---------------------------------------------
 ggplot(Both_Processes, aes(x=Process_run_id, y = metric_value)) +
   stat_mR() + ylab("Moving Range") +
   facet_grid(.~processID, scales = "free_x")



