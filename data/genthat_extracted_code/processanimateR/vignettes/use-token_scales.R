## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo = TRUE, message = FALSE----------------------------------------
library(processanimateR)
library(eventdataR)
library(RColorBrewer)
animate_process(patients, 
                legend = "color", 
                mapping = token_aes(color = token_scale("employee", 
                                                        scale = "ordinal", 
                                                        range = RColorBrewer::brewer.pal(8, "Paired"))))

## ----echo = TRUE, message = FALSE----------------------------------------
library(processanimateR)
library(dplyr)
library(bupaR)
animate_process(sample_n(traffic_fines, 1000) %>% filter_trace_frequency(percentage = 0.95),
                mode = "relative",
                legend = "color", 
                mapping = token_aes(color = token_scale("amount", 
                                                        scale = "linear", 
                                                        range = c("yellow","red"))))

## ----echo = TRUE, message = FALSE----------------------------------------
library(processanimateR)
library(eventdataR)
animate_process(patients, 
                mapping = token_aes(color = token_scale("time", 
                                                        scale = "time", 
                                                        range = c("blue","red"))))

