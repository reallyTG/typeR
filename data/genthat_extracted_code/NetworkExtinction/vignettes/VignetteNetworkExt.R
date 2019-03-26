## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
knitr::opts_chunk$set(fig.width=6, fig.height=4, message = FALSE) 

## ---- eval=FALSE---------------------------------------------------------
#  install.packages(NetworkExtinction)
#  library(NetworkExtinction)

## ------------------------------------------------------------------------
a<- matrix(c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0),nrow=10, ncol=10)

a

## ------------------------------------------------------------------------
library(network)
net <- as.network(a, loops = TRUE)
net

## ---- eval=FALSE---------------------------------------------------------
#  library(NetworkExtinction)
#  data("net")
#  Mostconnected(Network = net)

## ---- echo=FALSE, message=FALSE------------------------------------------
library(NetworkExtinction)
data("net")
knitr::kable(Mostconnected(Network = net), caption = "Table 1: The resulting dataframe of the Mostconnected function")

## ---- fig.cap="Figure 3. The graph shows the number of accumulated secondary extinctions that occur when removing species from the most to the least connected species"----
data("net")
history <- Mostconnected(Network = net)
ExtinctionPlot(History = history, Variable = "AccSecondaryExtinction")


## ---- eval=FALSE---------------------------------------------------------
#  data("net")
#  ExtinctionOrder(Network = net, Order = c(2,4,7))

## ---- echo=FALSE---------------------------------------------------------
data("net")
knitr::kable(ExtinctionOrder(Network = net, Order = c(2,4,7))$DF, caption = "Table 2: The resulting dataframe of the ExtinctionOrder function")

## ---- echo=FALSE, fig.cap= "Figure 4. The graph shows the number of accumulated secondary extinctions that occur when removing species in a custom order. In this example species 2 is removed followed by 4 and lastly species 7 is removed"----
data("net")
ExtinctionOrder(Network = net, Order = c(2,4,7))$Graph

## ---- eval = FALSE-------------------------------------------------------
#  data(net)
#  RandomExtinctions(Network= net, nsim= 50)

## ---- echo = FALSE-------------------------------------------------------
data(net)
set.seed(123)
Test <- RandomExtinctions(Network= net, nsim= 50)
knitr::kable(Test$sims, caption = "Table 3: The resulting dataframe of the RandomExtinctions function")

## ---- echo = FALSE, fig.cap= "Figure 5. The resulting graph of the RandomExtinctions function"----
data(net)
set.seed(123)
Test$graph

## ----message=FALSE, warning=FALSE----------------------------------------
data("net")
History <- ExtinctionOrder(Network = net, Order = c(1,2,3,4,5,6,7,8,9,10))

set.seed(2)
NullHyp <- RandomExtinctions(Network = net, nsim = 100)

Comparison <- CompareExtinctions(Nullmodel = NullHyp, Hypothesis = History)

## ---- echo=FALSE, fig.cap= "Figure 6. The resulting graph of the CompareExtinctions function, where the dashed line shows the observed extinction history, and a solid line shows the expected value of secondary extinctions originated at random"----
Comparison$graph

## ---- warning= FALSE-----------------------------------------------------
Comparison$Test

## ---- fig.cap= "Figure 7. Example of the use of the ExtinctionPlot function showing the accumulated secondary extinctions against number of extinctions"----
data(net)
history <- Mostconnected(Network = net)
ExtinctionPlot(History = history)

## ---- fig.cap= "Figure 8. Another example of the use of the ExtinctionPlot function showing the number of links per species against number of extinctions"----
ExtinctionPlot(History = history, Variable = "LinksPerSpecies")


## ---- eval=FALSE---------------------------------------------------------
#  data("chilean_intertidal")
#  degree_distribution(chilean_intertidal, name = "Test")

## ---- echo=FALSE---------------------------------------------------------
data("chilean_intertidal")
Dist <- degree_distribution(chilean_intertidal, name = "Test")

## ---- echo = FALSE, fig.cap= "Figure 9: Fitted vs observed values of the degree distribution. The black line and points show the observed values, the red, green and blue lines show the fitted values for the Exponential, power law and trucated distribution, respectively"----
Dist$graph

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(Dist$models, caption = "Table 4: Model selection analysis")

