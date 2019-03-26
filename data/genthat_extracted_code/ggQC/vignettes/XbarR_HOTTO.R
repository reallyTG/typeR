## ------------------------------------------------------------------------
set.seed(5555)
candle_df1t3 <- data.frame(
                Cycle = as.factor(rep(1:24, each=3)),
                candle_width = rnorm(n = 3*24, mean = 10, sd = 1),
                mold_cell = as.ordered(rep(1:3))
             ) 

candle_df4 <- data.frame(
                Cycle = as.factor(rep(1:24, each=1)),
                candle_width = rnorm(n = 1*24, mean = 11, sd = 2),
                mold_cell = as.ordered(rep(4, each=24))
             )

candle_df <- rbind(candle_df1t3, candle_df4)
library(ggplot2)
library(ggQC)

## ---- fig.width=7--------------------------------------------------------


XbarR <- ggplot(candle_df, aes(x = Cycle, y = candle_width, group = 1)) +
         stat_summary(fun.y = mean, geom = "point") +
         stat_summary(fun.y = mean, geom = "line") +
         stat_QC() 

XbarR

## ----fig.width=7---------------------------------------------------------
XbarR + stat_QC_labels()

## ----fig.width=7---------------------------------------------------------
R_Bar <- ggplot(candle_df, aes(x = Cycle, y = candle_width, group = 1)) +
         stat_summary(fun.y = QCrange, geom = "point") +
         stat_summary(fun.y = QCrange, geom = "line") +
         stat_QC(method="rBar") +
         stat_QC_labels(method="rBar") + ylab("R-Bar")

R_Bar

## ---- fig.width=7--------------------------------------------------------
XbarR <- ggplot(candle_df, aes(x = Cycle, y = candle_width, group = 1)) + 
         stat_summary(fun.y = mean, geom = "point") +
         stat_summary(fun.y = mean, geom = "line") +
         stat_QC() + stat_QC_labels() +
         # Show Individuals  
         geom_point(alpha= 1/5) +
         stat_QC(n=1, color.qc_limits = "orange") + 
         stat_QC_labels(n=1, color.qc_limits = "orange")   


XbarR

## ----fig.width=7---------------------------------------------------------
XbarR <- ggplot(candle_df, aes(x = Cycle, y = candle_width, group = 1, color=mold_cell)) + 
         stat_summary(fun.y = mean, geom = "point") +
         stat_summary(fun.y = mean, geom = "line") +
         stat_QC() + stat_QC_labels() +
         # Show Individuals  
         geom_point(alpha= 1/2) +
         stat_QC(n=1, color.qc_limits = "orange") + 
         stat_QC_labels(n=1, color.qc_limits = "orange")   


XbarR


## ----fig.width=7---------------------------------------------------------
XmR <- ggplot(candle_df, 
      aes(x = Cycle, y = candle_width, group = 1, color = mold_cell)) +         
         geom_point() + geom_line() +
         stat_QC(method="XmR") + stat_QC_labels(method="XmR") +
         facet_grid(.~mold_cell)


XmR


