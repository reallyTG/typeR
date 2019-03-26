## ------------------------------------------------------------------------
suppressPackageStartupMessages(library("dplyr"))          # for tidy data manipulations
suppressPackageStartupMessages(library("magrittr"))       # for friendly piping
suppressPackageStartupMessages(library("network"))        # for plotting
suppressPackageStartupMessages(library("sna"))            # for plotting
suppressPackageStartupMessages(library("statnet.common")) # for plotting
suppressPackageStartupMessages(library("networkD3"))      # for plotting
suppressPackageStartupMessages(library("igraph"))         # for graph computations
suppressPackageStartupMessages(library("pkggraph"))       # attach the package
suppressMessages(init(local = TRUE))                      # initiate the package

## ---- eval = TRUE--------------------------------------------------------
get_neighborhood("mlr") # a tibble, every row indicates a dependency
# observe only 'Imports' and reverse 'Imports'
neighborhood_graph("mlr", relation = "Imports") %>% 
  plot()
# observe the neighborhood of 'tidytext' package
get_neighborhood("tidytext") %>% 
  make_neighborhood_graph() %>% 
  plot()
# interact with the neighborhood of 'tm' package
# legend does not appear in the vignette, but it appears directly
neighborhood_graph("tm") %>% 
  plotd3(700, 700)
# which packages work as 'hubs' or 'authorities' in the above graph
neighborhood_graph("tidytext", type = "igraph") %>% 
  extract2(1) %>% 
  authority_score() %>% 
  extract2("vector") %>% 
  tibble(package = names(.), score = .) %>% 
  top_n(10, score) %>% 
  ggplot(aes(reorder(package, score), score)) + 
    geom_bar(stat = "identity") +
    xlab("package") +
    ylab("score") +
    coord_flip()

## ---- eval = TRUE--------------------------------------------------------
get_imports(c("dplyr", "tidyr"))

## ---- eval = FALSE-------------------------------------------------------
#  library("pkggraph")
#  init(local = FALSE)

## ---- eval = TRUE--------------------------------------------------------
get_imports("ggplot2")

## ---- eval = TRUE--------------------------------------------------------
get_reverse_suggests("knitr", level = 1)

## ------------------------------------------------------------------------
get_reverse_suggests("knitr", level = 2)

## ------------------------------------------------------------------------
get_all_dependencies("mlr", relation = c("Depends", "Imports"))
get_all_dependencies("mlr", relation = c("Depends", "Imports"), level = 2)

## ---- eval = TRUE--------------------------------------------------------
get_all_dependencies("mlr"
                     , relation = c("Depends", "Imports")
                     , level    = 2
                     , strict   = TRUE)

## ---- eval = TRUE--------------------------------------------------------
get_neighborhood("hash", level = 2)

get_neighborhood("hash", level = 2) %>% 
  make_neighborhood_graph %>% 
  plot()

## ---- eval = TRUE--------------------------------------------------------
get_neighborhood("hash"
                 , level = 2
                 , relation = c("Imports", "Depends")
                 , strict = TRUE) %>% 
  make_neighborhood_graph %>% 
  plot()

## ---- eval = TRUE--------------------------------------------------------
get_neighborhood("mlr", relation = "Imports") %>% 
  make_neighborhood_graph() %>% 
  plot()

## ---- eval = TRUE--------------------------------------------------------
get_neighborhood("mlr", relation = "Imports", interconnect = FALSE) %>% 
  make_neighborhood_graph() %>% 
  plot()

## ---- eval = TRUE--------------------------------------------------------
neighborhood_graph("caret", relation = "Imports") %>% 
  plot()

## ---- eval = TRUE--------------------------------------------------------
get_all_reverse_dependencies("rpart", relation = "Imports") %>% 
make_neighborhood_graph() %>% 
  plot()

## ---- eval = TRUE--------------------------------------------------------
"dplyr" %imports% "tibble"

## ---- eval = TRUE--------------------------------------------------------
relies("glmnet")[[1]]
# level 1 dependencies of "glmnet" are:
get_all_dependencies("glmnet", relation = c("Imports", "Depends", "LinkingTo"))[[3]]
"glmnet" %relies% "grid"
reverse_relies("tokenizers")[[1]]

## ---- eval = TRUE--------------------------------------------------------
pkggraph::neighborhood_graph("hash") %>%
  plot()

## ---- eval = TRUE--------------------------------------------------------
pkggraph::neighborhood_graph("hash") %>%
  plot(nodeImportance = "in", background = "white")

## ---- eval = TRUE--------------------------------------------------------
pkggraph::neighborhood_graph("hash") %>%
  plot(nodeImportance = "none", background = "white")

## ---- eval = TRUE--------------------------------------------------------
# legend does not appear in the vignette, but it appears directly
plotd3(neighborhood_graph("tibble"), height = 1000, width = 1000)

