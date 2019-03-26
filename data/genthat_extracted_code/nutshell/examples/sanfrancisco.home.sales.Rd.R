library(nutshell)


### Name: sanfrancisco.home.sales
### Title: San Franciscio Home Sales Data
### Aliases: sanfrancisco.home.sales
###   sanfrancisco.home.sales.testing.indices
###   sanfrancisco.home.sales.training.indices
###   sanfranscisco.home.sales.testing.indices
### Keywords: datasets

### ** Examples

data(sanfrancisco.home.sales)
library(lattice)
trellis.par.set(fontsize=list(text=7))
dollars.per.squarefoot <- mean(
  sanfrancisco.home.sales$price / sanfrancisco.home.sales$squarefeet,
  na.rm=TRUE);
xyplot(price~squarefeet|neighborhood,
        data=sanfrancisco.home.sales,
        pch=19, 
        cex=.2,
        subset=(zip!=94100 & zip!=94104 & zip!=94108 & 
                zip!=94111 & zip!=94133 & zip!=94158 &
                price<4000000 &
                ifelse(is.na(squarefeet),FALSE,squarefeet<6000)),
        strip=strip.custom(strip.levels=TRUE, 
           horizontal=TRUE,
           par.strip.text=list(cex=.8)),
        panel=function(...) {
           panel.abline(a=0,b=dollars.per.squarefoot);
           panel.xyplot(...);
        }
)



