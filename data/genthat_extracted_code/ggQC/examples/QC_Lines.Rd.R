library(ggQC)


### Name: QC_Lines
### Title: Calculate QC Limits
### Aliases: QC_Lines

### ** Examples

#############################################
#  Example 1: Charts other than "p" or "u"  #
#############################################

# Load Libraries ----------------------------------------------------------
 require(ggQC)
 require(plyr)
 require(ggplot2)

# Setup Data --------------------------------------------------------------
 set.seed(5555)
 Process1 <- data.frame(processID = as.factor(rep(1,100)),
                        metric_value = rnorm(100,0,1),
                        subgroup_sample=rep(1:20, each=5),
                        Process_run_id = 1:100)
 set.seed(5555)
 Process2 <- data.frame(processID = as.factor(rep(2,100)),
                        metric_value = rnorm(100,5, 1),
                        subgroup_sample=rep(1:10, each=10),
                        Process_run_id = 101:200)

 Both_Processes <- rbind(Process1, Process2)

# QC Values For Individuals -----------------------------------------------
 # All Together
   QC_Lines(data = Both_Processes$metric_value, method = "XmR")


 # For Each Process
   ddply(Both_Processes, .variables = "processID",
     .fun =function(df){
       QC_Lines(data = df$metric_value, method = "XmR")
     }
   )

# QC Values For Studentized Runs-------------------------------------------
 # All Together
   QC_Lines(data = Both_Processes,
        formula = metric_value ~ subgroup_sample)


 # For Each Process
   ddply(Both_Processes, .variables = "processID",
     .fun =function(df){
       QC_Lines(data = df, formula = metric_value ~ subgroup_sample)
     }
   )


########################
#  Example 2 "p" data  #
########################

# Setup p Data ------------------------------------------------------------
 set.seed(5555)
 bin_data <- data.frame(
   trial = 1:30,
   Num_Incomplete_Items = rpois(n = 30, lambda = 30),
   Num_Items_in_Set = runif(n = 30, min = 50, max = 100))

 bin_data$Proportion_Incomplete <- bin_data$Num_Incomplete_Items/bin_data$Num_Items_in_Set

# QC_Lines for "p" data ---------------------------------------------------
 QC_Lines(data = bin_data$Proportion_Incomplete,
        n = bin_data$Num_Items_in_Set, method="p")


########################
#  Example 3 "u" data  #
########################

# Setup u Data ------------------------------------------------------------
 set.seed(5555)
 bin_data <- data.frame(
   trial=1:30,
   Num_of_Blemishes = rpois(n = 30, lambda = 30),
   Num_Items_Inspected = runif(n = 30, min = 50, max = 100))

 bin_data$Blemish_Rate <- bin_data$Num_of_Blemishes/bin_data$Num_Items_Inspected


# QC Lines for "u" data ---------------------------------------------------
 QC_Lines(data = bin_data$Blemish_Rate,
        n = bin_data$Num_Items_Inspected, method="u")



