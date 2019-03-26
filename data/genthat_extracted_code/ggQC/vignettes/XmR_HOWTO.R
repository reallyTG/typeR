## ------------------------------------------------------------------------
set.seed(5555)
Golden_Egg_df <- data.frame(month=1:12,
                 egg_diameter = rnorm(n = 12, mean = 1.5, sd = 0.2)
                 )

## ------------------------------------------------------------------------
Golden_Egg_df$egg_diameter[3] <- 2.5

## ----fig.width=5---------------------------------------------------------
library(ggplot2)
library(ggQC)

XmR_Plot <- ggplot(Golden_Egg_df, aes(x = month, y = egg_diameter)) +
               geom_point() + geom_line() + 
               stat_QC(method = "XmR")

XmR_Plot

## ----fig.width=5---------------------------------------------------------
XmR_Plot + stat_QC_labels(method="XmR")

## ----fig.width=5, message=FALSE, warning=FALSE---------------------------
mR_Plot <- ggplot(Golden_Egg_df, aes(x = month, y = egg_diameter)) +
               stat_mR() + 
               stat_QC_labels(method="mR")

mR_Plot

## ------------------------------------------------------------------------
set.seed(123456)

last_year <- seq(from = as.POSIXct("2000-01-01", tz = "GMT"), length.out = 12, by = "month")

OurGoose <- data.frame(month=last_year, egg_diameter = rnorm(n = length(last_year), mean = 1.5, sd = 0.2),
                       group = "OurGoose"
)
TrentTown <- data.frame(month=last_year, egg_diameter = rnorm(n = length(last_year), mean = 2.5, sd = 0.6),
                        group = "TrentTown"
)
Maxhall <- data.frame(month=last_year, egg_diameter = rnorm(n = length(last_year), mean = .5, sd = 0.1),
                      group = "Maxhall"
)

GooseData <- rbind(OurGoose, TrentTown, Maxhall)

## ----fig.width=7.5, fig.height=5.5, message=FALSE, warning=FALSE---------
library(gridExtra)

XmR_Town <- ggplot(GooseData, aes(x = month, y = egg_diameter)) +
               geom_point() + geom_line() + 
               stat_QC(method = "XmR") + 
               stat_QC_labels(method="XmR") +
               facet_grid(.~group) 
mR_Town <- ggplot(GooseData, aes(x = month, y = egg_diameter)) +
               stat_mR(method = "mR") + 
               stat_QC_labels(method="mR") +
               facet_grid(.~group) + ylab("mR")


grid.arrange(XmR_Town,  mR_Town, nrow = 2)

## ------------------------------------------------------------------------
library(plyr)

ddply(GooseData, .variables = "group", 
      .fun = function(df)
        {QC_Lines(data = df$egg_diameter, method = "XmR")}
      )

