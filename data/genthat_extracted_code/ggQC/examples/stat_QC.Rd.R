library(ggQC)


### Name: stat_QC
### Title: Produce QC Charts with ggplot Framework.
### Aliases: stat_QC

### ** Examples

# Load Libraries ----------------------------------------------------------
 require(ggQC)
 require(ggplot2)

# Setup Data --------------------------------------------------------------
 set.seed(5555)
 Process1 <- data.frame(processID = as.factor(rep(1,100)),
                        metric_value = rnorm(100,0,1),
                        subgroup_sample = rep(1:20, each=5),
                        Process_run_id = 1:100)
 set.seed(5556)
 Process2 <- data.frame(processID = as.factor(rep(2,100)),
                        metric_value = rnorm(100,5, 1),
                        subgroup_sample = rep(1:10, each=10),
                        Process_run_id = 101:200)

 Both_Processes <- rbind(Process1, Process2)

#############################
#  Example 1:  XmR Chart    #
#############################


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

EX2.1 <- ggplot(Both_Processes, aes(x = subgroup_sample,
                          y = metric_value,
                          group = processID)) +
 stat_summary(fun.y = "mean", color = "blue", geom = c("point")) +
 stat_summary(fun.y = "mean", color = "blue", geom = c("line")) +
 stat_QC(method = "xBar.rBar") + facet_grid(.~processID, scales = "free_x")
#EX2.1

EX2.2 <- ggplot(Both_Processes, aes(x = subgroup_sample,
                          y = metric_value,
                          group = processID)) +
 stat_summary(fun.y = "QCrange", color = "blue", geom = "point") +
 stat_summary(fun.y = "QCrange", color = "blue", geom = "line") +
 stat_QC(method = "rBar") +
 ylab("Range") +
 facet_grid(.~processID, scales = "free_x")
 #EX2.2

#############################
#  Example 3:  p Chart      #
#############################
# p chart Setup -----------------------------------------------------------
 set.seed(5556)
 bin_data <- data.frame(
   trial=1:30,
   Num_Incomplete_Items = rpois(30, lambda = 30),
   Num_Items_in_Set = runif(n = 30, min = 50, max = 100))
   bin_data$Proportion_Incomplete <- bin_data$Num_Incomplete_Items/bin_data$Num_Items_in_Set

# Plot p chart ------------------------------------------------------------
EX3.1 <- ggplot(data = bin_data, aes(x=trial,
                           y=Proportion_Incomplete,
                           n=Num_Items_in_Set)) +
 geom_point() + geom_line() +
 stat_QC(method = "p")
 #EX3.1

#############################
#  Example 4:  u Chart      #
#############################
# u chart Setup -----------------------------------------------------------
 set.seed(5555)
 bin_data <- data.frame(
   trial=1:30,
   Num_of_Blemishes = rpois(30, lambda = 30),
   Num_Items_Inspected = runif(n = 30, min = 50, max = 100)
   )
   bin_data$Blemish_Rate <- bin_data$Num_of_Blemishes/bin_data$Num_Items_Inspected

# Plot u chart ------------------------------------------------------------
EX4.1 <- ggplot(data = bin_data, aes(x=trial,
                           y=Blemish_Rate,
                           n=Num_Items_Inspected)) +
 geom_point() + geom_line() +
 stat_QC(method = "u")
#EX4.1

#############################
#  Example 5:  np Chart     #
#############################
# np chart Setup -----------------------------------------------------------
 set.seed(5555)
 bin_data <- data.frame(
   trial=1:30,
   NumNonConforming = rbinom(30, 30, prob = .50))
 Units_Tested_Per_Batch <- 60

# Plot np chart ------------------------------------------------------------
 EX5.1 <- ggplot(data = bin_data, aes(trial, NumNonConforming)) +
  geom_point() +
  stat_QC(method = "np", n = Units_Tested_Per_Batch)
#EX5.1

#############################
#  Example 6:  c Chart     #
#############################
# c chart Setup -----------------------------------------------------------
 set.seed(5555)
 Process1 <- data.frame(Process_run_id = 1:30,
                        Counts=rpois(n = 30, lambda = 25),
                        Group = "A")
 Process2 <- data.frame(Process_run_id = 1:30,
                        Counts = rpois(n = 30, lambda = 5),
                        Group = "B")

 all_processes <- rbind(Process1, Process2)
# Plot C Chart ------------------------------------------------------------

 EX6.1 <- ggplot(all_processes, aes(x=Process_run_id, y = Counts)) +
   geom_point() + geom_line() +
   stat_QC(method = "c", auto.label = TRUE, label.digits = 2) +
   scale_x_continuous(expand =  expand_scale(mult = .25)) +
   facet_grid(.~Group)
# EX6.1



