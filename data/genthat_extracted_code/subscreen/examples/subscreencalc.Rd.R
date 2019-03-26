library(subscreen)


### Name: subscreencalc
### Title: (i) Calculation of the results for the subgroups
### Aliases: subscreencalc
### Keywords: analysis subgroup

### ** Examples

# get the pbc data from the survival package
require(survival)
data(pbc, package="survival")

# generate categorical versions of some of the baseline covariates
pbc$ageg[!is.na(pbc$age)]        <-
   ifelse(pbc$age[!is.na(pbc$age)]          <= median(pbc$age,     na.rm=TRUE), "Low", "High")
pbc$albuming[!is.na(pbc$albumin)]<-
   ifelse(pbc$albumin[!is.na(pbc$albumin)]  <= median(pbc$albumin, na.rm=TRUE), "Low", "High")
pbc$phosg[!is.na(pbc$alk.phos)]  <-
   ifelse(pbc$alk.phos[!is.na(pbc$alk.phos)]<= median(pbc$alk.phos,na.rm=TRUE), "Low", "High")
pbc$astg[!is.na(pbc$ast)]        <-
   ifelse(pbc$ast[!is.na(pbc$ast)]          <= median(pbc$ast,     na.rm=TRUE), "Low", "High")
pbc$bilig[!is.na(pbc$bili)]      <-
   ifelse(pbc$bili[!is.na(pbc$bili)]        <= median(pbc$bili,    na.rm=TRUE), "Low", "High")
pbc$cholg[!is.na(pbc$chol)]      <-
   ifelse(pbc$chol[!is.na(pbc$chol)]        <= median(pbc$chol,    na.rm=TRUE), "Low", "High")
pbc$copperg[!is.na(pbc$copper)]  <-
   ifelse(pbc$copper[!is.na(pbc$copper)]    <= median(pbc$copper,  na.rm=TRUE), "Low", "High")

pbc$ageg[is.na(pbc$age)]         <- "No Data"
pbc$albuming[is.na(pbc$albumin)] <- "No Data"
pbc$phosg[is.na(pbc$alk.phos)]   <- "No Data"
pbc$astg[is.na(pbc$ast)]         <- "No Data"
pbc$bilig[is.na(pbc$bili)]       <- "No Data"
pbc$cholg[is.na(pbc$chol)]       <- "No Data"
pbc$copperg[is.na(pbc$copper)]   <- "No Data"
# redefine censoring variable, consider transplant/death as event
pbc$event <- pbc$status
pbc$event[pbc$event==2] <- 1

pbcdat <- pbc[!is.na(pbc$trt), ]

# define function the eval_function()
# Attention: The eval_function ALWAYS needs to return a dataframe with one row.
#            Include exception handling, like if(N1>0 && N2>0) hr <- exp(coxph(...) )
#            to avoid program abort due to errors

hazardratio <- function(x) {
   N1 <- sum(x$trt==1)
   N2 <- sum(x$trt==2)

   hr <- tryCatch(exp(coxph(Surv(time, event) ~ trt, data=x)$coefficients[[1]]),
                 warning=function(w) {NA})

   data.frame(hr=hr, N1=N1, N2=N2)
 }

 # run subscreen

## Not run: 
##D results <- subscreencalc(data=pbcdat,
##D                      eval_function=hazardratio,
##D                      endpoints = c("time", "event"),
##D                      treat="trt",
##D                      subjectid = "id",
##D                      factors=c("ageg", "sex", "bilig", "cholg", "copperg", "astg",
##D                                "albuming", "phosg"))
##D 
##D # visualize the results of the subgroup screening with a Shiny app
##D subscreenshow(results)
## End(Not run)



