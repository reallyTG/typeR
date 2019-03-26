library(ggm)


### Name: InducedGraphs
### Title: Graphs induced by marginalization or conditioning
### Aliases: inducedCovGraph inducedConGraph inducedRegGraph
###   inducedChainGraph inducedDAG InducedGraphs
### Keywords: graphs models multivariate

### ** Examples

## Define a DAG
dag <- DAG(a ~ x, c ~ b+d, d~ x)
dag
## Induced covariance graph of a, b, d given the empty set.
inducedCovGraph(dag, sel=c("a", "b", "d"), cond=NULL)

## Induced concentration graph of a, b, c given x
inducedConGraph(dag, sel=c("a", "b", "c"), cond="x")

## Overall covariance graph
inducedCovGraph(dag)

## Overall concentration graph
inducedConGraph(dag)

## Induced covariance graph of x, b, d given c, x.
inducedCovGraph(dag, sel=c("a", "b", "d"), cond=c("c", "x"))

## Induced concentration graph of a, x, c given d, b.
inducedConGraph(dag, sel=c("a", "x", "c"), cond=c("d", "b"))

## The DAG on p. 198 of Cox & Wermuth (1996)
dag <- DAG(y1~ y2 + y3, y3 ~ y5, y4 ~ y5)

## Cf. figure 8.7 p. 203 in Cox & Wermuth (1996)
inducedCovGraph(dag, sel=c("y2", "y3", "y4", "y5"), cond="y1")
inducedCovGraph(dag, sel=c("y1", "y2", "y4", "y5"), cond="y3")
inducedCovGraph(dag, sel=c("y1", "y2", "y3", "y4"), cond="y5")

## Cf. figure 8.8 p. 203 in Cox & Wermuth (1996)
inducedConGraph(dag, sel=c("y2", "y3", "y4", "y5"), cond="y1")
inducedConGraph(dag, sel=c("y1", "y2", "y4", "y5"), cond="y3")
inducedConGraph(dag, sel=c("y1", "y2", "y3", "y4"), cond="y5")

## Cf. figure 8.9 p. 204 in Cox & Wermuth (1996)
inducedCovGraph(dag, sel=c("y2", "y3", "y4", "y5"), cond=NULL)
inducedCovGraph(dag, sel=c("y1", "y2", "y4", "y5"), cond=NULL)
inducedCovGraph(dag, sel=c("y1", "y2", "y3", "y4"), cond=NULL)

## Cf. figure 8.10 p. 204 in Cox & Wermuth (1996)
inducedConGraph(dag, sel=c("y2", "y3", "y4", "y5"), cond=NULL)
inducedConGraph(dag, sel=c("y1", "y2", "y4", "y5"), cond=NULL)
inducedConGraph(dag, sel=c("y1", "y2", "y3", "y4"), cond=NULL)

## An induced regression graph
dag2 = DAG(Y ~ X+U, W ~ Z+U)
inducedRegGraph(dag2, sel="W",  cond=c("Y", "X", "Z"))

## An induced DAG
inducedDAG(dag2, order=c("X","Y","Z","W"))

## An induced multivariate regression graph
inducedRegGraph(dag2, sel=c("Y", "W"), cond=c("X", "Z"))

## An induced chain graph with LWF interpretation
dag3 = DAG(X~W, W~Y, U~Y+Z)
cc = list(c("W", "U"), c("X", "Y", "Z"))
inducedChainGraph(dag3, cc=cc, type="LWF")

## ... with AMP interpretation
inducedChainGraph(dag3, cc=cc, type="AMP")

## ... with multivariate regression interpretation
cc= list(c("U"), c("Z", "Y"), c("X", "W"))
inducedChainGraph(dag3, cc=cc, type="MRG")



