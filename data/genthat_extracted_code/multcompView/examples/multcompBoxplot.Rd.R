library(multcompView)


### Name: multcompBoxplot
### Title: boxplot with multcomp graphics
### Aliases: multcompBoxplot
### Keywords: aplot

### ** Examples

# Example from help("TukeyHSD")
multcompBoxplot(breaks~tension, data=warpbreaks)
# 'sortFn' can be either a function or a function name
# default order is 'decreasing=TRUE'
multcompBoxplot(breaks~tension, data=warpbreaks,
       sortFn=median, decreasing=FALSE)

##################
library(multcomp)
data(recovery)
# Horizontal boxplots with both
# multcomp Ts and Letters on the right
# Using recovery{multcomp} data set
multcompBoxplot(minutes~blanket, recovery)

# Plotting boxes rather than letters and Ts

multcompBoxplot(minutes~blanket, recovery,
                plotList=list(
                    boxplot=list(fig=c(0, 0.75, 0, 1), las=1,
                        cex.axis=1.5),
                    multcompTs=list(fig=c(0.7, 0.85, 0, 1),
                        type='boxes'),
                    multcompLetters=list(
                        fig=c(0.87, 0.97, 0.03, 0.98),
                        type='boxes') ) )

####################

# Vertical boxplots with both
# multcomp Ts and Letters on the top
multcompBoxplot(minutes~blanket, recovery,
                        horizontal=FALSE)

# Horizontal boxplots with 2 different
# displays of the "Ts" on the left
multcompBoxplot(minutes~blanket, recovery,
  plotList=list(
      boxplot=list(fig=c(0.3, 1, 0, 1)),
      multcompTs=list(fig=c(0, 0.15, 0, 1),
        orientation="reverse"),
      multcompTs=list(fig=c(0.15, 0.3, 0, 1),
        type="boxes", orientation="reverse",
        mar=c(5,2, 4, 0)+.1) ) )

library(MASS)
anorx <-
multcompBoxplot(Postwt~Treat, data=anorexia)

## Not run: 
##D # Confirm than sortFn=NULL or NA
##D # leaves the order unchanged
##D library(multcomp)
##D data(cholesterol)
##D cholesterol$trt3 <- with(cholesterol, factor(
##D   as.character(trt), levels=levels(trt)[c(5:4,1:3)]))
##D multcompBoxplot(response ~ trt3, cholesterol,
##D            sortFn=NULL)
##D multcompBoxplot(response ~ trt3, cholesterol,
##D            sortFn=NA)
## End(Not run)



