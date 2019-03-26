## ---- echo=FALSE, results='asis', message=FALSE--------------------------
library(gWQS)
library(Rsolnp)
library(ztable)
library(ggplot2)
library(tableHTML)
library(pander)
knitr::kable(head(wqs_data[, c(37, 36, 35, 1:34)], 10))

## ---- results='asis', fig.show='hold', fig.height=5, fig.width=5, cache=TRUE----

# we save the names of the mixture variables in the variable "mix_name"
toxic_chems = c("log_LBX074LA", "log_LBX099LA", "log_LBX105LA", "log_LBX118LA", 
                "log_LBX138LA", "log_LBX153LA", "log_LBX156LA", "log_LBX157LA", 
                "log_LBX167LA", "log_LBX170LA", "log_LBX180LA", "log_LBX187LA", 
                "log_LBX189LA", "log_LBX194LA", "log_LBX196LA", "log_LBX199LA", 
                "log_LBXD01LA", "log_LBXD02LA", "log_LBXD03LA", "log_LBXD04LA", 
                "log_LBXD05LA", "log_LBXD07LA", "log_LBXF01LA", "log_LBXF02LA", 
                "log_LBXF03LA", "log_LBXF04LA", "log_LBXF05LA", "log_LBXF06LA", 
                "log_LBXF07LA", "log_LBXF08LA", "log_LBXF09LA", "log_LBXPCBLA", 
                "log_LBXTCDLA", "log_LBXHXCLA")

# we run the model and save the results in the variable "results"
results = gwqs(y ~ NULL, mix_name = toxic_chems, data = wqs_data, q = 4, validation = 0.6,
               valid_var = NULL, b = 2, b1_pos = T, b1_constr = F, family = "gaussian", 
               seed = 2016, wqs2 = T, plots = T, tables = T)


## ---- echo=FALSE, results='asis', message=FALSE--------------------------
knitr::kable(results$final_weights, digits = 3, row.names = F)

## ---- results='asis', message=FALSE, eval=F------------------------------
#  summary(results$fit)

## ---- echo=F, results='asis', message=FALSE------------------------------
library(pander)
pander(results$fit)

## ---- results='asis', message=FALSE, eval=F------------------------------
#  summary(results$fit_2)

## ---- echo=F, results='asis', message=FALSE------------------------------
pander(results$fit_2)

## ---- results='asis', message=FALSE, eval=FALSE--------------------------
#  results$aov

## ---- echo=F, results='asis', message=FALSE------------------------------
pander(results$aov)

## ---- results='asis', fig.show='hold', fig.height=5, fig.width=5, cache=TRUE----
# we create the variable "group" in the dataset to identify the training and validation dataset:
# we choose 300 observations for the validation dataset and the remaining 200 for the training dataset
set.seed(2016)
wqs_data$group = 0
wqs_data$group[rownames(wqs_data) %in% sample(rownames(wqs_data), 300)] = 1

# we run the logistic model and save the results in the variable "results2"
results2 = gwqs(disease_state ~ sex, mix_name = toxic_chems, data = wqs_data, q = NULL, 
                validation = 0, valid_var = "group", b = 2, b1_pos = F, b1_constr = F,
                family = "binomial", seed = 1959, wqs2 = F, plots = T, tables = T)

## ---- results='asis', message=FALSE, eval=F------------------------------
#  summary(results2$fit)

## ---- echo=F, results='asis', message=FALSE------------------------------
pander(results2$fit)

