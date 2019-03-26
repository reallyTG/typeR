## ---- echo = FALSE, include = FALSE--------------------------------------
library(knitr)
library(dplyr)
library(stringr)
opts_chunk$set(comment = NA, fig.width = 4, fig.height = 3)
knitr::opts_knit$set(unnamed.chunk.label = "btcore_data_")
options(digits = 3)

## ------------------------------------------------------------------------
library(breathtestcore)
head(btcore_file())
btcore_file("Standard.TXT")

## ------------------------------------------------------------------------
files = c(
  btcore_file("IrisCSV.TXT"), # Wagner/IRIS format
  btcore_file("350_20043_0_GER.txt") # BreathID
 )
 bt = read_any_breathtest(files)
 # Returns a list of elements of class breathtest_data
 str(bt, 1)
 bt_df = cleanup_data(bt)
 str(bt_df)

## ---- nf, fig.height = 2, fig.width =4-----------------------------------
 nf = null_fit(bt_df)
 str(nf)
 
 plot(nf) # dispatches to plot.breathtestfit

## ---- three, fig.height = 2.5, fig.width = 8-----------------------------
files1 = c(
  group_a = btcore_file("IrisCSV.TXT"), # Use only single file with grouping
  group_a = btcore_file("Standard.TXT"),
  group_b = btcore_file("350_20043_0_GER.txt")
 )

# Alternative syntax using magrittr operator
suppressPackageStartupMessages(library(dplyr))
read_any_breathtest(files1) %>% 
  cleanup_data() %>% 
  null_fit() %>% 
  plot()

## ---- simulated,  fig.height = 5, fig.width = 6, fig.cap = "Example of a cross-over design with missing data, outliers and missing record in the red curve."----
set.seed(212)
data = list(meal_a = simulate_breathtest_data(n_records = 3, noise = 2,
                          student_t_df = 3, missing = 0.3), 
            meal_b = simulate_breathtest_data(n_records = 4))
data %>% 
  cleanup_data() %>% 
  nlme_fit() %>% 
  plot()


## ---- fig.cap= "Function simulate_breathtest_data returns the values of the parameters used to generate the data. These can be used to check the results of the model prediction."----
data$meal_a$record

## ------------------------------------------------------------------------
data("usz_13c")
cat("usz_13c has data from", length(unique(usz_13c$patient_id)), "patients with" , 
    length(unique(usz_13c$group)), "different meals")

## ---- fig.height = 3, include = FALSE------------------------------------
knitr::include_graphics("breathtestshiny.png")

## ---- echo = FALSE, include = FALSE--------------------------------------
options(tibble.print_min= 4)
options(digits = 2)

## ------------------------------------------------------------------------
(bt = read_breathtest_excel(btcore_file("ExcelSamples.xlsx"), "2col"))

## ------------------------------------------------------------------------
(cbt = cleanup_data(bt))

## ---- nlsfit, height = 3, width = 4--------------------------------------
cbt %>% nls_fit() %>% plot()

## ------------------------------------------------------------------------
(bt = read_breathtest_excel(btcore_file("ExcelSamples.xlsx"), "3col"))

## ------------------------------------------------------------------------
(cbt = cleanup_data(bt))

## ---- four_col "---------------------------------------------------------
bt = read_breathtest_excel(btcore_file("ExcelSamples.xlsx"), "4col_2group") %>% 
  cleanup_data()
kable(sample_frac(bt, 0.08) %>% arrange(patient_id, group), caption = "A sample from a four-column format. See worksheet 4col_2group.")


## ---- nlme_fit, fig.width = 7--------------------------------------------
bt %>% nlme_fit() %>% plot()

## ---- iriswagner, fig.cap = "IRIS/Wagner composite file. These data cannot be fitted successfully with the single-curve fit method, therefore only data are shown."----
read_iris(btcore_file("IrisMulti.TXT")) %>% 
  cleanup_data() %>% 
  null_fit() %>% 
  plot()

## ---- iris_csv, fig.cap = "IRIS/Wagner CSV file"-------------------------
read_iris_csv(btcore_file("Standard.TXT")) %>% 
  cleanup_data() %>% 
  nls_fit() %>% 
  plot()

## ---- breathidc, fig.cap = "BreathID composite file"---------------------
read_breathid(btcore_file("350_20043_0_GER.txt")) %>% 
  cleanup_data() %>% 
  nls_fit() %>% 
  plot()

## ---- breathid_xml, fig.cap = "BreathID XML format"----------------------
read_breathid_xml(btcore_file("NewBreathID_multiple.xml")) %>% 
  cleanup_data() %>% 
  nls_fit() %>% 
  plot()

## ---- breathid_man, fig.cap = "BreathID XML format with manual grouping."----
# Could also use read_any_breathtest()
read_breathid_xml(btcore_file("NewBreathID_multiple.xml")) %>% 
  cleanup_data() %>% 
  mutate(
    group = "New"
  ) %>% 
  nls_fit() %>% 
  plot()

