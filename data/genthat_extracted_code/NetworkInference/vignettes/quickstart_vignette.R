## ---- eval=FALSE---------------------------------------------------------
#  install.packages("NetworkInference")

## ---- eval=FALSE---------------------------------------------------------
#  #install.packages(devtools)
#  devtools::install_github('desmarais-lab/NetworkInference')

## ---- results='hide', message=FALSE--------------------------------------
library(NetworkInference)

# Simulate random cascade data
df <- simulate_rnd_cascades(50, n_node = 20)

# Cast data into `cascades` object
## From long format
cascades <- as_cascade_long(df)

## From wide format
df_matrix <- as.matrix(cascades) ### Create example matrix
cascades <- as_cascade_wide(df_matrix)

## ------------------------------------------------------------------------
result <- netinf(cascades, quiet = TRUE, p_value_cutoff = 0.05)

## ---- eval=FALSE---------------------------------------------------------
#  head(result)

## ---- results="asis", echo=FALSE-----------------------------------------
pander::pandoc.table(head(result))

