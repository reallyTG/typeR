## ----libraries, message=FALSE--------------------------------------------
library(fingertipsR)
library(ggplot2)

## ----select indicators, eval=FALSE---------------------------------------
#  inds <- select_indicators()

## ----inds, echo=FALSE----------------------------------------------------
inds <- c(90630, 10101, 10301, 
          92313, 10401, 11401, 
          10501, 92314, 11502, 
          10601, 20101, 20201, 
          20601, 20301, 20602, 
          90284, 90832, 90285, 
          22001, 22002, 90244)
inds

## ----fingertips redred---------------------------------------------------
df <- fingertips_redred(inds, Comparator = "England")

## ----ggplot, fig.height=16, fig.width=8----------------------------------
df$IndicatorName <- sapply(strwrap(df$IndicatorName, 60, 
                                   simplify = FALSE), 
                           paste, collapse= "\n")
p <- ggplot(df, aes(IndicatorName, AreaName)) + 
        geom_point(colour = "darkred") + 
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 45,
                                         hjust = 1,
                                         size = rel(0.85)),
              axis.text.y = element_text(size = rel(0.9))) +
        labs(y = "Upper Tier Local Authority",
             x = "Indicator")
print(p)

