library(EnvStats)


### Name: errorBar
### Title: Plot Pointwise Error Bars
### Aliases: errorBar
### Keywords: distribution hplot

### ** Examples

  # The guidance document USEPA (1994b, pp. 6.22--6.25) 
  # contains measures of 1,2,3,4-Tetrachlorobenzene (TcCB) 
  # concentrations (in parts per billion) from soil samples 
  # at a Reference area and a Cleanup area.  These data are strored 
  # in the data frame EPA.94b.tccb.df.  
  #
  # Using the log-transformed data, create 
  #
  # 1. A dynamite plot (bar plot showing mean plus 1 SE)
  #
  # 2. A confidence interval plot.

  TcCB.mat <- summaryStats(TcCB ~ Area, data = EPA.94b.tccb.df, 
      se = TRUE, ci = TRUE)
  Means <- TcCB.mat[, "Mean"]
  SEs   <- TcCB.mat[, "SE"]
  LCLs  <- TcCB.mat[, "95%.LCL"]
  UCLs  <- TcCB.mat[, "95%.UCL"]

  # Dynamite Plot
  #--------------
  dev.new()
  group.centers <- barplot(Means, col = c("red", "blue"), 
    ylim = range(0, Means, Means + SEs), ylab = "TcCB (ppb)", 
    main = "Dynamite Plot for TcCB Data")
  errorBar(x = as.vector(group.centers), y = Means, 
    lower = SEs, draw.lower = FALSE, gap = FALSE, 
    col = c("red", "blue"), add = TRUE)


  # Confidence Interval Plot
  #-------------------------
  xlim <- par("usr")[1:2]
  dev.new()
  errorBar(x = as.vector(group.centers), y = Means, 
    lower = LCLs, upper = UCLs, incr = FALSE, gap = FALSE, 
    col = c("red", "blue"), xlim = xlim, xaxt = "n", 
    xlab = "", ylab = "TcCB (ppb)", 
    main = "Confidence Interval Plot for TcCB Data")
  axis(1, at = group.centers, labels = dimnames(TcCB.mat)[[1]])


  # Clean up
  #---------
  rm(TcCB.mat, Means, SEs, LCLs, UCLs, group.centers, xlim)
  graphics.off()



