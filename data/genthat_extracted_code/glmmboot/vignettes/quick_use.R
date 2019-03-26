## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
knitr::opts_chunk$set(cache=TRUE)
knitr::opts_knit$set(cache.extra = 234) # seed

## ---- cache=TRUE---------------------------------------------------------
library(glmmboot)
data(test_data)

head(test_data)

## ---- cache=TRUE---------------------------------------------------------
library(glmmTMB)
model_formula <- as.formula(y ~ x_var1 + x_var2 + x_var2 + (1 | subj))

base_run <- glmmTMB(formula = model_formula,
                    data = test_data,
                    family = binomial)

## ---- cache=TRUE---------------------------------------------------------
bootstrap_over_subj <- BootGlmm(base_model = base_run,
                                resamples = 99, 
                                base_data = test_data,
                                num_cores = 4)

## ---- cache=TRUE---------------------------------------------------------
print(bootstrap_over_subj)

## ---- cache=TRUE---------------------------------------------------------
b_list1 <- BootGlmm(base_model = base_run,
                    resamples = 29, 
                    base_data = test_data,
                    num_cores = 1,
                    return_coefs_instead = TRUE)
b_list2 <- BootGlmm(base_model = base_run,
                    resamples = 30, 
                    base_data = test_data,
                    num_cores = 1,
                    return_coefs_instead = TRUE)
b_list3 <- BootGlmm(base_model = base_run,
                    resamples = 30, 
                    base_data = test_data,
                    num_cores = 1,
                    return_coefs_instead = TRUE)

## ---- cache=TRUE---------------------------------------------------------
CombineResampledLists(b_list1, b_list2, b_list3)

## ---- cache=TRUE---------------------------------------------------------
list_of_lists_output <- list(b_list1, b_list2, b_list3)

## ---- cache=TRUE---------------------------------------------------------
CombineResampledLists(list_of_lists_output)

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))

