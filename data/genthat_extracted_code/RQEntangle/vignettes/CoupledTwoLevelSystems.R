## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----loading library, include=FALSE--------------------------------------
library(RQEntangle)

## ----singlet-------------------------------------------------------------
singlet<- matrix(c(0, sqrt(0.7), sqrt(0.3), 0), byrow = TRUE, nrow = 2)

## ----run_decompose, echo=FALSE-------------------------------------------
modes<- schmidt.decompose(singlet)

## ----display_modes-------------------------------------------------------
modes

## ----entropy-------------------------------------------------------------
entanglement.entropy(modes)

