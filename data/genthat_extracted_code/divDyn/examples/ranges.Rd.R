library(divDyn)


### Name: ranges
### Title: Plotting ranges and occurrence distributions through time
### Aliases: ranges

### ** Examples

 # import
 data(stages)
 data(corals)
 
 # all ranges - using the age uncertainties of the occurrences
 tsplot(stages, boxes="sys", xlim=c(250,0))
 ranges(corals, bin=c("max_ma", "min_ma"), tax="genus", occs=FALSE)

 # or use single estimates: assign age esimates to the occurrences
 corals$est<-stages$mid[corals$stg]
 
 # all ranges (including the recent!!)
 tsplot(stages, boxes="sys", xlim=c(250,0))
 ranges(corals, bin="est", tax="genus", occs=FALSE)
 
 # closing on the Cretaceous, with occurrences
 tsplot(stages, boxes="series", xlim=c(145,65), shading="short")
 ranges(corals, bin="est", tax="genus", occs=TRUE, ranges.args=list(lwd=0.1))
 
 # z and az separately
 tsplot(stages, boxes="series", xlim=c(145,65), shading="short")
 ranges(corals, bin="est", tax="genus", occs=FALSE, group="ecology", 
   ranges.args=list(lwd=0.1))
 	
 # same, show only taxa that originate within the interval
 tsplot(stages, boxes="series", xlim=c(105,60), shading="short")
 ranges(corals, bin="est", tax="genus", occs=TRUE, group="ecology", filt="orig" ,
   labs=TRUE, labels.args=list(cex=0.5))
 
# same using the age uncertainties of the occurrence age estimates
tsplot(stages, boxes="series", xlim=c(105,60), shading="short")
ranges(corals, bin=c("max_ma", "min_ma"), tax="genus", occs=TRUE, group="ecology", filt="orig" , 
   labs=TRUE, labels.args=list(cex=0.5))
   
# fully customized/ annotated
tsplot(stages, boxes="series", xlim=c(105,60), shading="short")
ranges(
  corals, # dataset
  bin="est", # bin column
  tax="genus", # taxon column
  occs=TRUE, # occurrence points will be plotted
  group="growth", # separate ranges based on growth types
  filt="orig" , # show only taxa that originate in the interval
  ranges.args=list(
    lwd=1, # set range width to 1
	   col=c("darkgreen", "darkred") # set color of the ranges (by groups)
  ), 
  total.args=list(
    cex=2, # set the size of the group identifier lablels
    col=c("darkgreen", "darkred") # set the color of the group identifier labels
  ),
  occs.args=list(
   col=c("darkgreen", "darkred"),
   pch=3
 ),
  labs=TRUE, # taxon labels will be plotted
  labels.args=list(
    cex=0.4, # the sizes of the taxon labels
	col=c("darkgreen", "darkred") # set the color of the taxon labels by group
  )
) 
   




