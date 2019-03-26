library(ggQC)


### Name: QC_Violations
### Title: Calculate QC Violations
### Aliases: QC_Violations

### ** Examples

#####################################
#  Example 1: XmR Check Violations  #
#####################################
# Load Libraries ----------------------------------------------------------
 require(ggQC)

# Setup Data --------------------------------------------------------------

    set.seed(5555)
    QC_XmR <- data.frame(
    data = c(c(-1, 2.3, 2.4, 2.5),                        #Outlier Data
          sample(c(rnorm(60),5,-5), 62, replace = FALSE), #Normal Data
          c(1,-.3, -2.4,-2.6,-2.5,-2.7, .3)),             #Outlier Data
    Run_Order = 1:73                                      #Run Order
    )

   QC_Vs <- QC_Violations(data  = QC_XmR$data, method = "XmR")

#######################################
#  Example 2: Xbar Check Violations   #
#######################################

# Setup Some Data ------------------------------------------------------------
     QC_xBar.rBar <- do.call(rbind, lapply(1:3, function(X){
       set.seed(5555+X)                                   #Loop over 3 seeds
       data.frame(
         sub_group = rep(1:42),                           #Define Subgroups
         sub_class = letters[X],
         c(
          c(runif(n = 5, min = 2.0,3.2)),                 #Outlier Data
          sample(c(rnorm(30),5,-4), 32, replace = FALSE), #Normal Data
          c(runif(n = 5, min = -3.2, max = -2.0))         #Outlier Data
         )
      )
     }
   )
)

colnames(QC_xBar.rBar) <- c("sub_group","sub_class", "value")
QC_Vs <- QC_Violations(data  = QC_xBar.rBar,
                       formula = value~sub_group,
                       method = "xBar.rBar")



