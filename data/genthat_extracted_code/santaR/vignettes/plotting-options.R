## ---- eval = TRUE--------------------------------------------------------
library(santaR)

# Load a subset of the example data
tmp_data  <- acuteInflammation$data[,1:6]
tmp_meta  <- acuteInflammation$meta

# Analyse data, with confidence bands and p-value
res_acuteInf_df5 <- santaR_auto_fit(inputData=tmp_data, ind=tmp_meta$ind, time=tmp_meta$time, group=tmp_meta$group, df=5, ncores=0, CBand=TRUE, pval.dist=FALSE)

## ---- fig.width = 7, fig.height = 5, dpi = 96, eval = TRUE---------------
# Default plot
# individual points, individual trajectories, group mean curves and confidence bands

  # access by list position
santaR_plot(res_acuteInf_df5[[5]])

  # access by variable name
santaR_plot(res_acuteInf_df5$var_5)

## ---- fig.width = 7, fig.height = 5, dpi = 96, eval = TRUE---------------
  # only groupMeanCurve
santaR_plot(res_acuteInf_df5$var_5, showIndPoint=FALSE, showIndCurve=FALSE, showGroupMeanCurve=TRUE, showConfBand=TRUE)

  # only Individuals
santaR_plot(res_acuteInf_df5$var_5, showIndPoint=TRUE, showIndCurve=TRUE, showGroupMeanCurve=FALSE, showConfBand=FALSE)

  # add confidence bands (only available if  previously calculated)
santaR_plot(res_acuteInf_df5$var_5, showIndPoint=TRUE, showIndCurve=TRUE, showGroupMeanCurve=TRUE, showConfBand=TRUE)

  # add a totalMeanCurve (grey)
santaR_plot(res_acuteInf_df5$var_5, showTotalMeanCurve=TRUE )

## ---- fig.width = 7, fig.height = 5, dpi = 96, eval = TRUE---------------
  # add title
santaR_plot(res_acuteInf_df5$var_5, title='A figure title')

  # remove the legend
santaR_plot(res_acuteInf_df5$var_5, title='A variable, no legend', legend=FALSE)

  # force purple and green color
santaR_plot(res_acuteInf_df5$var_5,  title='A variable in different colors', colorVect = c('purple','green'))
# Default colors are in order: "blue", "red", "green", "orange", "purple", "seagreen", "darkturquoise", "violetred", "saddlebrown", "black"

  # add x and y labels
santaR_plot(res_acuteInf_df5$var_5, title='Different axis labels', xlab='Time', ylab='Variable value')

## ---- fig.width = 7, fig.height = 5, dpi = 96, eval = TRUE---------------
library(ggplot2)

  # add x and y labels by adding it outside the plotting function [not useful but shows that any ggplot command can be added to the plot]
santaR_plot(res_acuteInf_df5$var_5, title='A variable') + xlab('Time') + ylab('Variable value')

  # Constrain the x axis (will remove points and raise warnings)
santaR_plot(res_acuteInf_df5$var_5, showConfBand=FALSE, title='A variable', xlab='Time', ylab='Variable value') + xlim(0,48)

  # Looser y limits
santaR_plot(res_acuteInf_df5$var_5, title='A variable', xlab='Time', ylab='Variable value') + ylim(-2,5)

## ---- fig.width = 7, fig.height = 5, dpi = 96, eval = TRUE---------------
library(gridExtra)

  # store plot in a variable, plot multiple variables...
p1 <- santaR_plot(res_acuteInf_df5$var_3, title='First variable', xlab='Time', ylab='Variable value')
plot(p1)

p2 <- santaR_plot(res_acuteInf_df5$var_4, title='Second variable', xlab='Time', ylab='Variable value')

  # multiplot
grid.arrange(p1, p2)

  # force them side by side
grid.arrange(p1, p2, ncol=2)

  # Force both plots on the same y limits (remove legend from plots)
p1 <- santaR_plot(res_acuteInf_df5$var_3, title='First variable', xlab='Time', ylab='Variable value', legend=FALSE)
p2 <- santaR_plot(res_acuteInf_df5$var_4, title='Second variable', xlab='Time', ylab='Variable value', legend=FALSE)

p1 <- p1 + ylim(-1.2, 4.2)
p2 <- p2 + ylim(-1.2, 4.2)

grid.arrange(p1, p2, ncol=2 )

