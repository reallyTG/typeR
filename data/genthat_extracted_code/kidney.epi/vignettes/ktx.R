## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(kidney.epi)
head(ktx)

## ------------------------------------------------------------------------
# call ktx.kdpi.optn function, and directly set paramenters values
ktx.kdpi.optn (age = 60, height_cm = 168, weight_kg = 93, ethnicity = "White", hypertension = "yes", diabetes = "no", causeofdeath = "roadinjury", creatinine = 1.4, hcv = "negative", dcdstatus = "no", creatinineunits = "mg/dl", return_output_type = "KDRI_Rao")

## ------------------------------------------------------------------------
# copy internal dataframe ktx from R package to your dataframe
mydata <- ktx

# calculate Kidney Donor Profile Index (KDPI) using the latest available OPTN mapping values
mydata$kdpi <- ktx.kdpi.optn ( age = mydata$don.age,
  height_cm = mydata$don.height, weight_kg = mydata$don.weight,
  ethnicity = mydata$don.ethnicity, hypertension = mydata$don.hypertension,
  diabetes = mydata$don.diabetes, causeofdeath = mydata$don.causeofdeath,
  creatinine = mydata$don.creatinine, hcv = mydata$don.hcv,
  dcdstatus = mydata$don.dcd, creatinineunits = "mg/dl",
  # which param to return
  return_output_type = "KDPI",
  # customize all labels used in the dataframe
  # label for Afroamerican ethnicity 
  label_afroamerican = c ("Afroamerican"),
  # label for a positive history of hypertension
  label_hypertension_positive = c ("Yes", "YES"),
  # label for an unknown history of hypertension
  label_hypertension_unknown = "N/A", # if missing values defined unknown history then use "NA" (with quotes!)
  # label for a positive history of diabetes
  label_diabetes_positive = c ("Yes", "YES"),
  # label for an unknown history of diabetes
  label_diabetes_unknown = "N/A", # if missing values defined unknown history then use "NA" (with quotes!)
  # label for a cause of death due to cerebrovascular/stroke
  label_causeofdeath = c ("cerebrovascular"),
  # label for a positive hcv status
  label_hcv_positive = c ("positive"),
  # label for an unknown, not done, indeterminate, or pending hcv status
  label_hcv_unknown = "NA", # if missing values defined unknown history then use "NA" (with quotes!)
  # label for a donation after circulatory death status
  label_dcdstatus = c ("Yes")
) 

# show descriptive stat for the calculated values
summary(mydata$kdpi)

## ------------------------------------------------------------------------
ktx.kdpi.optn.show.years()

