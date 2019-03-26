## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('NetworkInference')

## ---- eval=FALSE---------------------------------------------------------
#  install.packages(c('dplyr', 'igraph'))

## ---- message=FALSE------------------------------------------------------
library(NetworkInference)
# Load the `policies` dataset (?policies for details).
data('policies')

## ---- eval=FALSE---------------------------------------------------------
#  head(policies)

## ---- results="asis", echo=FALSE-----------------------------------------
pander::pandoc.table(head(policies))

## ------------------------------------------------------------------------
length(unique(policies$policy))

## ------------------------------------------------------------------------
nrow(policies)

## ------------------------------------------------------------------------
unique(policies$policy)[1:5]

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr)
#  filter(policies_metadata, policy %in% unique(policy)[100:104]) %>%
#      select(-source)

## ---- results="asis", echo=FALSE, message=FALSE--------------------------
library(dplyr)
pander::pandoc.table(filter(policies_metadata, policy %in% unique(policy)[100:104]) %>%
                         select(-source))

## ------------------------------------------------------------------------
policy_cascades <- as_cascade_long(policies, cascade_node_name = 'statenam',
                                   event_time = 'adopt_year', 
                                   cascade_id = 'policy')

## ------------------------------------------------------------------------
class(policy_cascades)
length(policy_cascades)
names(policy_cascades)

## ------------------------------------------------------------------------
policy_cascades$cascade_nodes[2:3]

## ------------------------------------------------------------------------
policy_cascades$cascade_times[2:3]

## ------------------------------------------------------------------------
selected_policies <- subset_cascade(cascade = policy_cascades, 
                                    selection = c('clinic_access', 'cogrowman'))
selected_policies[1:2]

## ------------------------------------------------------------------------
time_constrained <- subset_cascade_time(cascade = selected_policies, 
                                        start_time = 1990, end_time = 2000)
time_constrained[1:2]

## ------------------------------------------------------------------------
less_nodes <- drop_nodes(cascades = time_constrained, 
                         nodes = c('Maryland', 'Washington'))
less_nodes[1:2]

## ------------------------------------------------------------------------
summary(policy_cascades)

## ---- fig.align='center', fig.width=7, fig.height=4----------------------
selection <- c('guncontrol_assaultweapon_ba', 'guncontrol_licenses_dealer')
plot(policy_cascades, label_nodes = TRUE, selection = selection)

## ---- fig.align='center', fig.width=7, fig.height=4----------------------
selection <- c('waiting', 'threestrikes', 'unionlimits', 'smokeban', 
               'paperterror', 'miglab', 'methpre', 'lott', 'lemon', 'idtheft',
               'harass', 'hatecrime', 'equalpay')
plot(policy_cascades, label_nodes = FALSE, selection = selection)

## ------------------------------------------------------------------------
results <- netinf(policy_cascades, trans_mod = "exponential", n_edges = 100, 
                  params = 0.5, quiet = TRUE)

## ------------------------------------------------------------------------
npe <- count_possible_edges(policy_cascades)
npe

## ------------------------------------------------------------------------
results <- netinf(policy_cascades, trans_mod = "exponential", 
                  p_value_cutoff = 0.1, params = 0.5, quiet = TRUE)
nrow(results)

## ------------------------------------------------------------------------
results <- netinf(policy_cascades, trans_mod = "exponential", 
                  p_value_cutoff = 0.1, quiet = TRUE)
nrow(results)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  head(results)

## ---- results = "asis", echo=FALSE---------------------------------------
pander::pandoc.table(head(results))

## ---- fig.align='center', fig.width=7, fig.height=4----------------------
plot(results, type = "improvement")

## ---- fig.align='center', fig.width=7, fig.height=4----------------------
plot(results, type = 'p-value')

## ---- fig.width=7, fig.height=5.5----------------------------------------
#install.packages('igraph')
# For this functionality the igraph package has to be installed
# This code is only executed if the package is found:
if(requireNamespace("igraph", quietly = TRUE)) {
    plot(results, type = "network")
}

## ---- message=FALSE, eval=FALSE------------------------------------------
#  if(requireNamespace("igraph", quietly = TRUE)) {
#      library(igraph)
#      g <- graph_from_data_frame(d = results[, 1:2])
#      plot(g, edge.arrow.size=.3, vertex.color = "grey70")
#  }

