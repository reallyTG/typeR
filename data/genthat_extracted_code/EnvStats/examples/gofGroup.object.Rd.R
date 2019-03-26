library(EnvStats)


### Name: gofGroup.object
### Title: S3 Class "gofGroup"
### Aliases: gofGroup.object gofGroup
### Keywords: classes

### ** Examples

  # Create an object of class "gofGroup", then print it out. 

  # Example 10-4 of USEPA (2009, page 10-20) gives an example of 
  # simultaneously testing the assumption of normality for nickel 
  # concentrations (ppb) in groundwater collected at 4 monitoring 
  # wells over 5 months.  The data for this example are stored in 
  # EPA.09.Ex.10.1.nickel.df.

  gofGroup.obj <- gofGroupTest(Nickel.ppb ~ Well, 
    data = EPA.09.Ex.10.1.nickel.df)

  mode(gofGroup.obj) 
  #[1] "list" 

  class(gofGroup.obj) 
  #[1] "gofGroup" 

  names(gofGroup.obj) 
  # [1] "distribution"      "dist.abb"          "statistic"        
  # [4] "sample.size"       "parameters"        "p.value"          
  # [7] "alternative"       "method"            "data.name"        
  #[10] "grouping.variable" "parent.of.data"    "bad.obs"          
  #[13] "n.groups"          "group.names"       "group.scores"

  gofGroup.obj 
  #Results of Group Goodness-of-Fit Test
  #-------------------------------------
  #
  #Test Method:                     Wilk-Shapiro GOF (Normal Scores)
  #
  #Hypothesized Distribution:       Normal
  #
  #Data:                            Nickel.ppb
  #
  #Grouping Variable:               Well
  #
  #Data Source:                     EPA.09.Ex.10.1.nickel.df
  #
  #Number of Groups:                4
  #
  #Sample Sizes:                    Well.1 = 5
  #                                 Well.2 = 5
  #                                 Well.3 = 5
  #                                 Well.4 = 5
  #
  #Test Statistic:                  z (G) = -3.658696
  #
  #P-values for
  #Individual Tests:                Well.1 = 0.03510747
  #                                 Well.2 = 0.02385344
  #                                 Well.3 = 0.01120775
  #                                 Well.4 = 0.10681461
  #
  #P-value for
  #Group Test:                      0.0001267509
  #
  #Alternative Hypothesis:          At least one group
  #                                 does not come from a
  #                                 Normal Distribution.  

  #==========

  # Extract the p-values
  #---------------------

  gofGroup.obj$p.value
  #      Well.1       Well.2       Well.3       Well.4        z (G) 
  #0.0351074733 0.0238534406 0.0112077511 0.1068146088 0.0001267509 

  #==========

  # Plot the results of the test
  #-----------------------------

  dev.new()
  plot(gofGroup.obj)

  #==========

  # Clean up
  #---------
  rm(gofGroup.obj)
  graphics.off()



