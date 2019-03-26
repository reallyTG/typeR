library(bnviewer)


### Name: strength.viewer
### Title: Interactive Bayesian Network Strength Viewer.
### Aliases: strength.viewer

### ** Examples


library(bnlearn)
library(bnviewer)

bayesianNetwork.boot.strength = boot.strength(coronary, R = 20, algorithm = "hc")

avg.bayesianNetwork = averaged.network(bayesianNetwork.boot.strength, threshold = 0.2)

strength.viewer(
  avg.bayesianNetwork,
  bayesianNetwork.boot.strength,
  bayesianNetwork.background = "white",
  bayesianNetwork.arc.strength.threshold.expression = c("@threshold > 0 & @threshold < 0.5",
                                                        "@threshold >= 0.5 & @threshold < 0.6",
                                                        "@threshold >= 0.6 & @threshold <= 1"),

  bayesianNetwork.arc.strength.threshold.expression.color  = c("red", "yellow", "green"),
  bayesianNetwork.arc.strength.threshold.alternative.color =  "white",

  bayesianNetwork.arc.strength.label = TRUE,
  bayesianNetwork.arc.strength.label.prefix = "",
  bayesianNetwork.arc.strength.label.color = "black",

  bayesianNetwork.arc.strength.tooltip = TRUE,

  bayesianNetwork.edge.scale.min = 1,
  bayesianNetwork.edge.scale.max = 3,

  bayesianNetwork.edge.scale.label.min = 14,
  bayesianNetwork.edge.scale.label.max = 14,

  bayesianNetwork.width = "100%",
  bayesianNetwork.height = "800px",
  bayesianNetwork.layout = "layout_with_sugiyama",
  node.colors = list(background = "#97c2fc",
                     border = "#2b7ce9",
                     highlight = list(background = "#e91eba",
                                      border = "#2b7ce9")),

  node.font = list(color = "black", face="Arial"),
  edges.dashes = FALSE,

  bayesianNetwork.title="Bayesian Network Strength Analysis - Coronary",
  bayesianNetwork.subtitle = "Coronary heart disease data set",
  bayesianNetwork.footer = "Fig. 1 - Layout with Sugiyama"
)




