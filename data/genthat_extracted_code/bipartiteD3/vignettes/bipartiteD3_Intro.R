## ----setup, message=FALSE, warning=FALSE---------------------------------
library(r2d3)
library(bipartite)
library(purrr) 
library(dplyr) 
library(tidyr) 
library(stringr)
library(tibble)
library(RColorBrewer)

library(bipartiteD3)

## ------------------------------------------------------------------------

testdata <- data.frame(higher = c("bee1","bee1","bee1","bee2","bee1","bee3"), 
lower = c("plant1","plant2","plant1","plant2","plant3","plant4"), 
webID = c("meadow","meadow","meadow","meadow","meadow","meadow"), freq=c(5,9,1,2,3,7))
bipartite::frame2webs(testdata)-> SmallTestWeb

SmallTestWeb

bipartite::plotweb(SmallTestWeb$meadow)

# If nothing appears then either update RStudio to version 1.2 or open in a modern web browser
bipartite_D3(SmallTestWeb)

## ------------------------------------------------------------------------
Doubletestdata <- data.frame(higher = c("bee1","bee1","bee1","bee2","bee1","bee3", "bee1","bee1","bee1","bee2","bee1","bee3"), 
lower = c("plant1","plant2","plant1","plant2","plant3","plant4","plant2","plant1","plant2","plant3","plant4", 'plant5'), 
webID = c("meadow","meadow","meadow","meadow","meadow","meadow","bog","bog","bog","bog","bog","bog"), freq=c(5,9,1,2,3,7, 2,3,4,7,4,2))
frame2webs(Doubletestdata)-> DoubleTestWeb

bipartite_D3(data =DoubleTestWeb, colouroption = 'brewer', filename = 'demo1')


## ------------------------------------------------------------------------
List2DF(DoubleTestWeb)

## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb, colouroption = 'brewer', ColourBy = 1, filename = 'demo2')
bipartite_D3(SmallTestWeb, colouroption = 'brewer', ColourBy = 2, filename = 'demo3')


## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb, monoChromeCol = 'BLUE',HighlightLab = 'plant2',
            HighlightCol = 'PINK', ColourBy = 1 , filename = 'demo4')

## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb,colouroption = 'brewer',BrewerPalette ='Dark2', filename = 'demo5')

## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb,colouroption = 'brewer',BrewerPalette ='Dark2', filename = 'demo6')

## ------------------------------------------------------------------------

ManualColours<- c(bee1='green', bee2='red', bee3='yellow')

bipartite_D3(SmallTestWeb, colouroption = 'manual',
            NamedColourVector = ManualColours, ColourBy = 2,
            filename = 'demo7')

## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb,colouroption = 'brewer',
            Orientation = 'horizontal', filename = 'demo8')

## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb, PrimaryLab = 'Flowers',
            SecondaryLab = 'Pollinators',
            SiteNames = 'Nice Meadow', filename = 'demo9')

## ------------------------------------------------------------------------
bipartite_D3(SmallTestWeb,EdgeMode = 'straight', filename = 'demo10')

## ------------------------------------------------------------------------

df<-List2DF(SmallTestWeb)


# To sort primary by total size:
df %>%
  group_by(Primary) %>%
  summarise(Total=sum(meadow))%>%
  arrange(Total)-> SortDf

# To sort secondary manually

SortSec <- c('bee2', 'bee3', 'bee1')

bipartite_D3(df, SortPrimary = SortDf$Primary, SortSecondary = SortSec,
            filename = 'demo11')

## ------------------------------------------------------------------------
# With larger datasets the default can look a bit awkward, with overlaps and inversions

data(Safariland, vazquenc, package = 'bipartite')
data2<-bipartite::webs2array(Safariland, vazquenc)

bipartite_D3(data = data2, filename = 'demo12')

#Adjusting Sizes to fit a complex figure:

bipartite_D3(data = data2,
            mp=c(2,1),
            MainFigSize = c(800, 1500), 
            IndivFigSize = c(200, 600),
            BoxLabPos = c(20, 20),
            PercPos = c(200,200),
            BarSize = 20,
            MinWidth = 5,
            Pad=5,
            filename = 'demo13')


