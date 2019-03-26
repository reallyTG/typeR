## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.width=7, 
  fig.height=5, 
  fig.path="figs-overview/"
)

## ----generate_data-------------------------------------------------------
library(epitrix)

mu <- 15.3 # mean in days days
sigma <- 9.3 # standard deviation in days
cv <- mu/sigma # coefficient of variation
cv
param <- gamma_mucv2shapescale(mu, cv) # convertion to Gamma parameters
param


## ----si------------------------------------------------------------------

si <- distcrete::distcrete("gamma", interval = 1,
               shape = param$shape,
               scale = param$scale, w = 0)
si
set.seed(1)
x <- si$r(500)
head(x, 10)
hist(x, col = "grey", border = "white",
     xlab = "Days between primary and secondary onset",
     main = "Simulated serial intervals")


## ----fit-----------------------------------------------------------------

si_fit <- fit_disc_gamma(x)
si_fit


## ----fit_i---------------------------------------------------------------

library(outbreaks)
library(incidence)
i <- incidence(ebola_sim$linelist$date_of_onset)
i
f <- fit(i[1:150]) # fit on first 150 days
plot(i[1:200], fit = f, color = "#9fc2fc")

r2R0(f$info$r, si$d(1:100))
r2R0(f$info$r.conf, si$d(1:100))


## ----sample_R0-----------------------------------------------------------

R0_val <- lm2R0_sample(f$model, si$d(1:100), n = 100)
head(R0_val)
hist(R0_val, col = "grey", border = "white")


## ----clean_labels--------------------------------------------------------
x <- " Thîs- is A   wêïrD LäBeL .."
x
clean_labels(x)

variables <- c("Date.of.ONSET ",
               "/  date of hôspitalisation  /",
               "-DäTÈ--OF___DîSCHARGE-",
               "GEndèr/",
               "  Location. ")
variables
clean_labels(variables)


## ------------------------------------------------------------------------

first_name <- c("Jane", "Joe", "Raoul", "Raoul")
last_name <- c("Doe", "Smith", "Dupont", "Dupond")
age <- c(25, 69, 36, 36)

## detailed output by default
hash_names(first_name, last_name, age)

## short labels for practical use
hash_names(first_name, last_name, age,
           size = 8, full = FALSE)


