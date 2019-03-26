## ---- echo = FALSE--------------------------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = " # ",
  fig.width = 7
)
options(width =100)

## ----setup, warning=FALSE, message=FALSE----------------------------------------------------------
library("dplyr")
library("replyr")

## ----sumstat_intervals----------------------------------------------------------------------------
sumstat_intervals = function(dframe, colname, groupcolname = NULL) {
  mapping = list(COLNAME  =colname,
                 GROUPCOLNAME = groupcolname)
  let(alias = mapping,
      {
        if(!is.null(groupcolname)) {
          dframe <- group_by(dframe, GROUPCOLNAME)
        }
        summarize(dframe, 
                  sdlower = mean(COLNAME)-sd(COLNAME),
                  mean = mean(COLNAME),
                  sdupper = mean(COLNAME) + sd(COLNAME),
                  iqrlower = median(COLNAME)-0.5*IQR(COLNAME),
                  median = median(COLNAME),
                  iqrupper = median(COLNAME)+0.5*IQR(COLNAME))
      })
}

## ----iris1----------------------------------------------------------------------------------------
sumstat_intervals(iris, "Sepal.Length")

## ----iris2----------------------------------------------------------------------------------------
sumstat_intervals(iris, "Sepal.Length", "Species")

## ----iris3----------------------------------------------------------------------------------------
sumstat_intervals(iris, "Petal.Length", "Species")

## ----ggplotf--------------------------------------------------------------------------------------
plot_distributions = NULL

if  (requireNamespace("ggplot2")) {
  library("ggplot2")
  plot_distributions = function(dframe, colname, groupcol,
                                intervaltype="mean", title="") {
    if(!(intervaltype %in% c("mean", "median")))
      error("Intervaltype must be one of 'mean' or 'median'")
    
    sintervals = sumstat_intervals(dframe, colname, groupcol)
    
    # I could do the following with aes_string, but what the heck
    mapping = list(xval=groupcol, yval=colname, center=intervaltype)
    if(intervaltype=="mean") {
      mapping2 =list(lower="sdlower", upper="sdupper")
    } else {
      mapping2 =list(lower="iqrlower", upper="iqrupper")
    }
    mapping = c(mapping, mapping2)
    
    let(alias=mapping,
        expr = {
          ggplot(dframe, aes(x=xval,color=xval)) +
            geom_jitter(aes(y=yval), width=0.2, height=0, alpha=0.5) +
            geom_crossbar(data=sintervals, aes(y=center, ymin=lower, ymax=upper)) +
            ggtitle(title) + theme(plot.title=element_text(hjust=0.5)) +
            scale_color_brewer(palette="Dark2")
        })
  }
}

## ----ggplot1--------------------------------------------------------------------------------------
if(!("NULL") %in% class(plot_distributions)) {
  plot_distributions(iris, "Sepal.Length", "Species",
                     title="Iris sepal length with mean +/1 one standard deviation")
}

## ----ggplot2--------------------------------------------------------------------------------------
if(!("NULL") %in% class(plot_distributions)) {
  plot_distributions(iris, "Petal.Width", "Species",
                     intervaltype="median",
                     title="Iris petal width with median and centered IQR interval")
}

