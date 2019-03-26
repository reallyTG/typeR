## ---- eval=FALSE---------------------------------------------------------
#  install.packages("netCoin")

## ---- echo=TRUE, message=FALSE, warning=FALSE----------------------------
library(netCoin)

## ----echo=TRUE-----------------------------------------------------------
data(dice)
head(dice)

## ----echo=TRUE-----------------------------------------------------------
head(dice[,-1])

## ----echo=TRUE-----------------------------------------------------------
C <- coin(dice[,-1]) # coincidence matrix
C

## ----eval=FALSE----------------------------------------------------------
#  N <- asNodes(C) # node data frame
#  E <- edgeList(C) # edge data frame
#  Net <- netCoin(N,E) # network object

## ----eval=FALSE----------------------------------------------------------
#  Net <- netCoin(N,E,dir="dice")

## ----echo=FALSE, out.width='100%'----------------------------------------
knitr::include_graphics("Dice.png")

## ------------------------------------------------------------------------
data("families")
data("links")

## ---- message=FALSE, warning=FALSE, include=FALSE------------------------

library(igraph)

## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  G <- allNet(incidence=links[links$link=="Marriage",-17],
#       nodes=families, layout="md", percentages= FALSE,
#       criteria="f",minL=1, size="f.Marriages",color="seat",
#       main="Marriage Links beetween Italian families",
#       note="Data source: Padgett & Ansell (1983)")
#  H <- allNet(incidence=links[links$link=="Business",-17],
#       nodes=families, layout="md", percentages= FALSE,
#       criteria="f",minL=1, size="f.Business",color="seat",
#       main="Marriage Links beetween Italian families",
#       note="Data source: Padgett & Ansell (1983)")
#  

## ---- echo=TRUE, message=FALSE, warning=FALSE, eval=FALSE----------------
#  multigraphCreate(Marriage=G,Business=H,dir="italian")

## ----echo=FALSE, out.width='100%'----------------------------------------
knitr::include_graphics("Padgett.png")

## ---- echo=TRUE, message=FALSE, warning=FALSE, eval=FALSE----------------
#  data("Galapagos")
#  data("finches")
#  finches$species<-paste(system.file("doc/sanderson",package="netCoin"),
#          "/images/",finches$species,sep="") # copy path to the species field
#  Net<-allNet(Galapagos,nodes=finches, criteria="hyp", maxL=.05,
#          lwidth ="Haberman",lweight="Haberman",
#          size="frequency", image="species", layout="mds",
#          main="Species coincidences in Galapagos Islands",
#          note="Data source: Sanderson (2000)")
#  plot(Net)

## ----echo=FALSE, out.width='100%'----------------------------------------
knitr::include_graphics("Finches.png")

