## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  dev = "svg",
  out.height = "100%",
  out.width = "100%",
  fig.width = 7,
  fig.height = 7
  )
library(lavaan)
library(simstandard)
library(knitr)
library(ggplot2)
library(tibble)
library(tidyr)
library(dplyr)
library(kableExtra)

options(digits = 2)
set.seed(123456)



## ---- out.width=700, fig.align='center', echo = FALSE--------------------
knitr::include_graphics("ModelFigure.svg")

## ----generate------------------------------------------------------------
library(simstandard)
library(lavaan)
library(knitr)
library(kableExtra)
library(dplyr)
library(ggplot2)
library(tibble)
library(tidyr)

# lavaan syntax for model
m <- "
A =~ 0.7 * A1 + 0.8 * A2 + 0.9 * A3 + 0.3 * B1
B =~ 0.7 * B1 + 0.8 * B2 + 0.9 * B3
B ~ 0.6 * A
"

# Simulate data
d <- sim_standardized(m, n = 100000)

# Display First 6 rows
head(d) %>% 
  kable() %>% 
  kable_styling()

## ----corfunction---------------------------------------------------------
ggcor <- function(d) {
  require(ggplot2)
  as.data.frame(d) %>%
    tibble::rownames_to_column("rowname") %>%
    tidyr::gather(colname, r, -rowname) %>%
    dplyr::mutate(rowname = forcats::fct_rev(rowname)) %>% 
    dplyr::mutate(colname = factor(colname, levels = rev(levels(rowname)))) %>% 
    ggplot(aes(colname, rowname, fill = r)) +
    geom_tile(color = "gray90") +
    geom_text(aes(
      label = formatC(
      r, 
      digits = 2, 
      format = "f") %>% 
        stringr::str_replace_all("0\\.",".") %>% 
        stringr::str_replace_all("1.00","1")), 
    color = "white", 
    fontface = "bold",
    family = "serif") +
    scale_fill_gradient2(NULL,
      na.value = "gray20",
      limits = c(-1.01, 1.01),
      high = "#924552",
      low = "#293999"
    ) +
    coord_equal() +
    scale_x_discrete(NULL,position = "top") +
    scale_y_discrete(NULL) +
    theme_light(base_family = "serif", base_size = 14) 
}


## ----modelcov------------------------------------------------------------
cov(d) %>% 
  ggcor

## ----observed------------------------------------------------------------
d <- sim_standardized(m,
                      n = 100000,
                      latent = FALSE,
                      errors = FALSE)
# Display First 6 rows
head(d) %>% 
  kable() %>% 
  kable_styling()

## ----lavaan--------------------------------------------------------------
library(lavaan)
d_lavaan <- simulateData(
  model = m, 
  sample.nobs = 100000, 
  standardized = TRUE)
cov(d_lavaan) %>% 
  ggcor

## ----simmatrices---------------------------------------------------------
matrices <- sim_standardized_matrices(m)

## ----Amatrix-------------------------------------------------------------
matrices$RAM_matrices$A %>% 
  ggcor()

## ----Smatrix-------------------------------------------------------------
matrices$RAM_matrices$S %>% 
  ggcor()

## ---- out.width=700, fig.align='center', echo = FALSE--------------------
knitr::include_graphics("ModelFigureComplete.svg")

## ----estfactorscores-----------------------------------------------------
m <- "
A =~ 0.9 * A1 + 0.8 * A2 + 0.7 * A3
"
sim_standardized(
  m, 
  n = 100000, 
  factor_scores = TRUE
  ) %>% 
  head() %>% 
  kable() %>% 
  kable_styling()

## ------------------------------------------------------------------------
d <- tibble::tribble(
  ~A1,  ~A2,  ~A3,
   2L,  2.5,  1.3,
  -1L, -1.5, -2.1
  )

add_factor_scores(d, m ) %>% 
  kable() %>% 
  kable_styling()


## ----composites----------------------------------------------------------
m <- "
A =~ 0.9 * A1 + 0.8 * A2 + 0.7 * A3
"
sim_standardized(
  m, 
  n = 100000, 
  composites = TRUE
  ) %>% 
  head() %>% 
  kable() %>% 
  kable_styling()
  

## ----fix2free------------------------------------------------------------
# lavaan syntax for model
m <- "
A =~ 0.7 * A1 + 0.8 * A2 + 0.9 * A3 + 0.3 * B1
B =~ 0.7 * B1 + 0.8 * B2 + 0.9 * B3
B ~ 0.6 * A
"
# Make model m free
m_free <- fixed2free(m)
# Display model m_free
cat(m_free)

## ----lavaantest----------------------------------------------------------
# Set the random number generator for reproducible results
set.seed(12)
# Generate data based on model m
d <- sim_standardized(
  m,
  n = 100000,
  latent = FALSE,
  errors = FALSE)

# Evaluate the fit of model m_free on data d
library(lavaan)
lav_results <- sem(
  model = m_free, 
  data = d)

# Display summary of model
summary(
  lav_results, 
  standardized = TRUE, 
  fit.measures = TRUE)

# Extract RAM paths
RAM <- lav2ram(lav_results)

# Display asymmetric paths (i.e., single-headed arrows for 
# loadings and structure coefficients)
RAM$A %>% ggcor()

# Display symmetric paths (i.e., curved double-headed arrows
# exogenous variances, error variances, disturbance variances, 
# and any covariances among these)
RAM$S %>% ggcor()


## ----modelcomplete-------------------------------------------------------
# Specify model
m <- "
A =~ 0.7 * A1 + 0.8 * A2 + 0.9 * A3 + 0.3 * B1
B =~ 0.7 * B1 + 0.8 * B2 + 0.9 * B3
B ~ 0.6 * A
"
m_complete <- model_complete(m)
# Display complete model
cat(m_complete)

## ------------------------------------------------------------------------
m_meas <- matrix(c(
	0.8,0,0,  # VC1
	0.9,0,0,  # VC2
	0.7,0,0,  # VC3
	0,0.6,0,  # WM1
	0,0.7,0,  # WM2
	0,0.8,0,  # WM3
	0,0,0.9,  # RD1
	0,0,0.7,  # RD2
	0,0,0.8), # RD3
	nrow = 9, 
	byrow = TRUE,
	dimnames = list(
	  c("VC1", "VC2", "VC3", 
	    "WM1", "WM2", "WM3", 
	    "RD1", "RD2", "RD3"),
	  c("Vocabulary", "WorkingMemory", "Reading")))


## ------------------------------------------------------------------------
m_struct <- matrix(
  c(0.4,0.3), 
	ncol = 2,
	dimnames = list(
	  "Reading",
	  c("Vocabulary", "WorkingMemory"))) 


## ------------------------------------------------------------------------
m_struct <- matrix(c(
	0,   0,   0,  # Vocabulary
	0,   0,   0,  # WorkingMemory
	0.4, 0.3, 0), # Reading
	nrow = 3, 
	byrow = TRUE) 
rownames(m_struct) <- c("Vocabulary", "WorkingMemory", "Reading")
colnames(m_struct) <- c("Vocabulary", "WorkingMemory", "Reading")

## ------------------------------------------------------------------------
m_cov <- matrix(c(
	1,   0.5, 
	0.5, 1), 
	nrow = 2,
	dimnames = list(
	  c("Vocabulary", "WorkingMemory"),
	  c("Vocabulary", "WorkingMemory"))) 


## ------------------------------------------------------------------------
model <- matrix2lavaan(measurement_model = m_meas, 
                       structural_model = m_struct, 
                       covariances = m_cov)
cat(model)

## ------------------------------------------------------------------------
# A tibble with indicator variables listed in the first column
m_meas <- tibble::tribble(
     ~Test, ~Vocabulary, ~WorkingMemory, ~Reading,
     "VC1",         0.8,              0,        0,
     "VC2",         0.9,              0,        0,
     "VC3",         0.7,              0,        0,
     "WM1",           0,            0.6,        0,
     "WM2",           0,            0.7,        0,
     "WM3",           0,            0.8,        0,
     "RD1",           0,              0,      0.9,
     "RD2",           0,              0,      0.7,
     "RD3",           0,              0,      0.8)

# A data.frame with criterion variable specified as a row name
m_struct <- data.frame(Vocabulary = 0.4, 
                       WorkingMemory = 0.3, 
                       row.names = "Reading")

# A data.frame with variable names specified as row names
m_cov <- data.frame(Vocabulary =    c(1, 0.5),
                    WorkingMemory = c(0.5, 1))
rownames(m_cov) <- c("Vocabulary", "WorkingMemory")


model <- matrix2lavaan(measurement_model = m_meas, 
                       structural_model = m_struct, 
                       covariances = m_cov)

