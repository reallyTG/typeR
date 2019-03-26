## ---- fig.width = 9, fig.height = 7--------------------------------------
library(scifigure)
exps <- init_experiments(2)
hide_stages = NULL
sci_figure(exps)	

## ---- fig.width = 9, fig.height = 7--------------------------------------
exps <- init_experiments(2, c("Brady et. al.", "Thomas et. al."))
exps["analysis_plan", 1] <- "unobserved"
exps[c("experimenter", "analyst", "estimate"), 2] <- "different"
sci_figure(exps, hide_stages <- c("population", "hypothesis"))

## ---- fig.width = 9, fig.height = 7--------------------------------------
reproduce_figure()

## ---- fig.width = 9, fig.height = 7--------------------------------------
replicate_figure()

## ---- fig.width = 14, fig.height = 7-------------------------------------
exps <- init_experiments(9, c("Original", "Reproducible", "Orignal", "Replicable", "Begley", "Payne et. al.", "Vianello (OSF)", "Potti", "Baggerly & Coombs"))
exps["analyst", 2] <- "different" # Reproducible
exps[c("experimenter", "data", "analyst", "code", "estimate", "claim"), 4] <- "different" # Replicable
exps[c("population", "hypothesis", "experimental_design", "experimenter", "data", "analysis_plan", "analyst", "code", "estimate"), 5] <- "unobserved" # Begley
exps[c("population", "experimenter", "data", "analyst", "code", "estimate", "claim"), 7] <- "different" # Vianello (OSF)
exps[c("data", "code"), 8] <- "incorrect" # Potti
exps[c("data", "code"), 9] <- "different" # Baggerly & Coombes

sci_figure(exps)

