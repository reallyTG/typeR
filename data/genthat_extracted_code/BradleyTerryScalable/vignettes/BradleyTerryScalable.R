## ----eval = FALSE--------------------------------------------------------
#  # installing from CRAN
#  install.packages("BradleyTerryScalable")
#  
#  # installing from GitHub
#  install.packages("devtools") # if required
#  devtools::install_github("EllaKaye/BradleyTerryScalable", build_vignettes = TRUE)

## ------------------------------------------------------------------------
library(BradleyTerryScalable)

## ------------------------------------------------------------------------
data(citations) 
citations
data(toy_data)
toy_data

## ------------------------------------------------------------------------
citations_btdata <- btdata(citations)
toy_data_4col <- codes_to_counts(toy_data, c("W1", "W2", "D"))
toy_btdata <- btdata(toy_data_4col, return_graph = TRUE) 

## ----message = FALSE, fig.align = "center"-------------------------------
library(igraph)
par(mar = c(0, 0, 0, 0) + 0.1)  
plot.igraph(toy_btdata$graph, vertex.size = 28, edge.arrow.size = 0.5) 

## ------------------------------------------------------------------------
summary(citations_btdata)
summary(toy_btdata)

## ------------------------------------------------------------------------
toy_btdata_subset <- select_components(toy_btdata, "3")
toy_btdata_subset <- select_components(toy_btdata, function(x) length(x) == 4)
toy_btdata_subset <- select_components(toy_btdata, function(x) "Cyd" %in% x)
summary(toy_btdata_subset)

## ------------------------------------------------------------------------
citations_fit <- btfit(citations_btdata, 1)
toy_fit_MLE <- btfit(toy_btdata, 1)
toy_fit_MAP <- btfit(toy_btdata, 1.1)

## ------------------------------------------------------------------------
summary(citations_fit)
summary(toy_fit_MLE, SE = TRUE)
coef(toy_fit_MAP)
vcov(citations_fit, ref = "JASA")

## ------------------------------------------------------------------------
btprob(citations_fit)
fitted(toy_fit_MLE, as_df = TRUE)

## ------------------------------------------------------------------------
citations_sim <- simulate(citations_fit, nsim = 100, seed = 1)
citations_sim[1:2]

## ---- warning=FALSE, message=FALSE, fig.width = 7, fig.height = 7, out.width = '97%'----
library(Matrix)
library(dplyr)
library(ggplot2)
set.seed(1989)
n_items <- 1000

## Generate at random a sparse, symmetric matrix of binomial totals: 
Nvalues <- rpois(n = n_items * (n_items - 1) / 2, lambda = 1)  
notzero <- Nvalues > 0
Nmatrix <- Matrix(nrow = n_items, ncol = n_items)
ij <- which(lower.tri(Nmatrix), arr.ind = TRUE)[notzero, ]
Nmatrix <- sparseMatrix(
             i = ij[, 1],
             j = ij[, 2],  
             x = Nvalues[notzero],
             symmetric = TRUE,   
             dims = c(n_items, n_items)) 

## Generate at random the (normalized to mean 1) 'player abilities':
pi_vec <- exp(rnorm(n_items) / 4)
pi_vec <- pi_vec / mean(pi_vec)

##  Now generate contest outcome counts from the Bradley-Terry model:
big_matrix <- simulate_BT(pi_vec, Nmatrix, nsim = 1)[[1]]
big_btdata <- btdata(big_matrix)

## Fit the Bradley-Terry model to the simulated data:
the_model <- btfit(big_btdata, a = 1)
pi_fitted <- the_model $ pi $ full_dataset

## Plot fitted vs true abilities:
plot_df <- tibble(x = log(pi_vec[as.numeric(names(pi_fitted))]),
                  y = log(pi_fitted))

ggplot(plot_df, aes(x, y)) +
  geom_point(alpha = 0.5) +
  geom_abline() + 
  xlab("true strength") +
  ylab("maximum likelihood estimate") +
  ggtitle("1000-player simulation from a Bradley-Terry model") +
  theme(plot.title = element_text(hjust = 0.5))

