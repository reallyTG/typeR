## ----setup, include = FALSE----------------------------------------------
library(knitr)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----loadPackages-1------------------------------------------------------
library(mgcv)
library(lattice)
library(dtplyr)
library(dplyr)
library(ggplot2)
library(scales)
library(magrittr)
library(ggrepel)
library(viridis)
library(knitr)
library(hutils)
library(magrittr)
library(data.table)

## ----loadPackages-2------------------------------------------------------
templib <- tempfile()
hutils::provide.dir(templib)

## ----loadPackages-3------------------------------------------------------
if (requireNamespace("taxstats1516", quietly = TRUE) &&
    requireNamespace("taxstats", quietly = TRUE)) {
  library(taxstats)
  library(taxstats1516)
} else {
  install.packages("https://raw.githubusercontent.com/hughparsonage/tax-drat/master/src/contrib/taxstats_0.0.5.1415.tar.gz",
                   dependencies = FALSE,
                   quiet = TRUE,
                   lib = templib,
                   verbose = FALSE,
                   repos = NULL)
  
  library("taxstats",
          lib.loc = templib,
          verbose = TRUE,
          character.only = TRUE)
}

## ----sample_files_all----------------------------------------------------
sample_files_all <-
    rbindlist(lapply(list(`2003-04` = sample_file_0304, 
                          `2004-05` = sample_file_0405,
                          `2005-06` = sample_file_0506, 
                          `2006-07` = sample_file_0607,
                          `2007-08` = sample_file_0708, 
                          `2008-09` = sample_file_0809,
                          `2009-10` = sample_file_0910, 
                          `2010-11` = sample_file_1011,
                          `2011-12` = sample_file_1112, 
                          `2012-13` = sample_file_1213,
                          `2013-14` = sample_file_1314), 
                     data.table::as.data.table),
              use.names = TRUE,
              fill = TRUE, 
              idcol = "fy.year")
sample_files_all[, WEIGHT := hutils::if_else(fy.year > '2010-11', 50L, 100L)]
age_range_decoder <- as.data.table(age_range_decoder)

## ----load-grattan--------------------------------------------------------
library(grattan)

## ----sample_file_1617----------------------------------------------------
sample_file_1617 <-
  project(sample_file_1213,
          h = 4L,
          fy.year.of.sample.file = "2012-13")

## ----sample_file_2021----------------------------------------------------
sample_file_2021 <-
  project(sample_file_1213,
          h = 8L,
          fy.year.of.sample.file = "2012-13")

## ----add-tax-paid-avg-tax------------------------------------------------
sample_file_1617[, tax_paid := income_tax(Taxable_Income,
                                          .dots.ATO = copy(sample_file_1617),
                                          fy.year = "2016-17")]
sample_file_1617[, avg_tax := tax_paid / Taxable_Income]
sample_file_2021[, tax_paid := income_tax(Taxable_Income,
                                          .dots.ATO = copy(sample_file_2021),
                                          fy.year = "2019-20")]
sample_file_2021[, avg_tax := tax_paid / Taxable_Income]

## ----avg_tax_by_decile---------------------------------------------------
avg_tax_by_decile_1617 <- 
  sample_file_1617 %>%
  .[, .(avg_tax = mean(avg_tax)),
    keyby = .(decile = weighted_ntile(Taxable_Income, n = 10))]

avg_tax_by_decile_2021 <- 
  sample_file_2021 %>%
  .[, .(avg_tax = mean(avg_tax)),
    keyby = .(decile = weighted_ntile(Taxable_Income, n = 10))]

## ----tax-changes-grattan-forecast----------------------------------------
avg_tax_by_decile_1617[avg_tax_by_decile_2021] %>%
  .[decile > 1] %>%
  .[, ppt_increase := 100*(i.avg_tax - avg_tax)] %>%
  .[, decile := factor(decile)] %>%
  ggplot(aes(x = decile, y = ppt_increase)) + 
  geom_col()

## ----Budget_wage_series--------------------------------------------------
Budget_wage_series <-
  data.table(fy_year = c("2017-18", "2018-19", "2019-20", "2020-21"),
             r = c(0.025, 0.03, 0.035, 0.0375))

kable(Budget_wage_series)

## ----project-with-respect-to-budget--------------------------------------
sample_file_1617 <- project(sample_file_1213,
                            h = 4L,
                            fy.year.of.sample.file = "2012-13")

sample_file_2021 <- project(sample_file_1213,
                            fy.year.of.sample.file = "2012-13",
                            h = 8L,
                            wage.series = Budget_wage_series)

sample_file_1617[, tax_paid := income_tax(Taxable_Income,
                                          .dots.ATO = copy(sample_file_1617),
                                          fy.year = "2016-17")]
sample_file_1617[, avg_tax := tax_paid / Taxable_Income]
sample_file_2021[, tax_paid := income_tax(Taxable_Income,
                                          .dots.ATO = copy(sample_file_2021),
                                          fy.year = "2019-20")]
sample_file_2021[, avg_tax := tax_paid / Taxable_Income]

avg_tax_by_decile_1617 <- 
  sample_file_1617 %>%
  .[, .(avg_tax = mean(avg_tax)),
    keyby = .(decile = weighted_ntile(Taxable_Income, n = 10))]

avg_tax_by_decile_2021 <- 
  sample_file_2021 %>%
  .[, .(avg_tax = mean(avg_tax)),
    keyby = .(decile = weighted_ntile(Taxable_Income, n = 10))]

difference_2021_Budget <-
  avg_tax_by_decile_1617[avg_tax_by_decile_2021] %>%
  .[decile > 1] %>%
  .[, ppt_increase := 100*(i.avg_tax - avg_tax)]

difference_2021_Budget %>%
  copy %>%
  .[, decile := factor(decile)] %>%
  ggplot(aes(x = decile, y = ppt_increase)) + 
  geom_col()

## ----middle_income_avg_inc-----------------------------------------------
middle_income_avg_inc <-
  difference_2021_Budget %>%
  .[decile %between% c(3, 7)] %$%
  range(round(ppt_increase, 1))

## ----percentile_50000----------------------------------------------------
sample_file_1617[, percentile := weighted_ntile(Taxable_Income, n = 100)]
stopifnot(56 %in% sample_file_1617[Taxable_Income %between% c(49500, 50500)][["percentile"]])

avg_tax_rate_2017_50k <- 
  sample_file_1617[percentile == 56] %$% 
  mean(avg_tax) %>%
  round(3)

avg_tax_rate_2021_50k <- 
  sample_file_2021 %>%
  .[, percentile := weighted_ntile(Taxable_Income, n = 100)] %>%
  .[percentile == 56] %$% 
  mean(avg_tax) %>%
  round(3)

## ----Change_1ppt_2021----------------------------------------------------
tax_delta <- function(bracket_number, rate_increase = -0.01) {
  current_tax <-
    sample_file_2021[, .(tax = sum(tax_paid), 
                         WEIGHT = WEIGHT[1])] %$% 
    sum(tax * WEIGHT)
  
  orig_rates <- c(0, 0.19, 0.325, 0.37, 0.45)
  new_rates <- orig_rates
  new_rates[bracket_number] <- new_rates[bracket_number] + rate_increase
    
  # rebate_income is an internal function
  .ri <- grattan:::rebate_income
  
  new_tax <- 
    sample_file_2021 %>%
    copy %>%
    .[, base_tax. := IncomeTax(Taxable_Income,
                              thresholds = c(0, 18200, 37000, 87000, 180e3),
                              rates = new_rates)] %>%
    .[, medicare_levy. := medicare_levy(income = Taxable_Income, fy.year = "2019-20",
                                       Spouse_income = Spouse_adjusted_taxable_inc,
                                       sapto.eligible = (age_range <= 1),
                                       family_status = if_else(Spouse_adjusted_taxable_inc > 0, "family", "individual"))] %>%
    .[, lito. := lito(Taxable_Income, max_lito = 445, lito_taper = 0.015, min_bracket = 37000)] %>%
    .[, rebate_income := .ri(Taxable_Income,
                             Rptbl_Empr_spr_cont_amt = Rptbl_Empr_spr_cont_amt,
                             Net_fincl_invstmt_lss_amt = Net_fincl_invstmt_lss_amt,
                             Net_rent_amt = Net_rent_amt,
                             Rep_frng_ben_amt = Rep_frng_ben_amt)] %>%
    .[, sapto. := sapto(rebate_income, fy.year = "2019-20", sapto.eligible = (age_range <= 1))] %>%
    .[, tax_payable := pmaxC(base_tax. - lito. - sapto., 0) + medicare_levy.] %>%
    .[, .(tax = sum(tax_payable), 
          WEIGHT = WEIGHT[1])] %$% 
    sum(tax * WEIGHT)
  
  current_tax - new_tax
}

## ----table_1pt-----------------------------------------------------------
data.table(tax_bracket = c("<18,200",
                           "18,200-37,000",
                           "37,000-87,000",
                           "87,000-180,000",
                           "180,000+"),
           budget_impact = c(NA, round(vapply(2:5, tax_delta, FUN.VALUE = double(1)) / 1e9, 2))) %>%
  kable

## ----knitrOpts-sample-file-----------------------------------------------
options("scipen" = 99)
opts_chunk$set(fig.width = 9,
               fig.height = 6.5,
               warn = FALSE)

## ----FY.YEAR-------------------------------------------------------------
FY.YEAR <- "2013-14"

## ----wsum----------------------------------------------------------------
wsum <- function(x, w = 1){
  sum((x) * w)
}

## ----grattan_dollar------------------------------------------------------
grattan_dollar <- function (x, digits = 0) {
  #
  nsmall <- digits
  commaz <- format(abs(x), nsmall = nsmall, trim = TRUE, big.mark = ",", 
                   scientific = FALSE, digits = 1L)
  
  if_else(x < 0, 
          paste0("\U2212","$", commaz),
          paste0("$", commaz))
}

## ----load-sample-file----------------------------------------------------
sample_file <- sample_files_all[fy.year == FY.YEAR]
sample_file <- merge(sample_file, age_range_decoder, by = "age_range")
PREV.FY.YEAR <- yr2fy(fy2yr(FY.YEAR) - 1)
sample_file_prev <- sample_files_all[fy.year == PREV.FY.YEAR]
sample_file_prev <- merge(sample_file_prev, age_range_decoder, by = "age_range")

## ----impute-ages---------------------------------------------------------
set.seed(48031)
sample_file %<>%
  group_by(age_range_description) %>%
  mutate(min_age = if_else(grepl("to", age_range_description), 
                           as.numeric(gsub("^([0-9]{2}).*$", "\\1", age_range_description)), 
                           if_else(grepl("70", age_range_description),
                                   70, 
                                   15)),
         max_age = min_age + 5, 
         age_imp = runif(n(), min_age, max_age)) %>%
  select(-min_age, -max_age)

## ----tax-bracket---------------------------------------------------------
sample_file %<>%
  mutate(Tax_Bracket = cut(Taxable_Income, 
                           breaks = c(-Inf, 18200, 37e3, 80e3, 180e3, Inf),
                           include.lowest = TRUE, 
                           labels = c("$0-$18,200", 
                                      "$18,201-$37,000", 
                                      "37,001-$80,000", 
                                      "$80,001-$180,000", 
                                      "$180,000+")))

## ----texNum--------------------------------------------------------------
texNum <- function(number, sig.figs = 3L, dollar = FALSE, pre.phrase = NULL, .suffix = NULL){
  orig.number <- number
  stopifnot(is.numeric(number), length(number) == 1L)
  is.negative <- number < 0
  number <- abs(number)
  if (number == 0){
    warning("Returning 0")
    return(0)
  } else {
    if (is.null(.suffix)){
    n.digits <- ceiling(log10(number))
    
    suffix <- NULL
    suffix_val <- 1
    
    if (n.digits < sig.figs){
      prefix <- signif(x = number, digits = sig.figs)
    } else {
      
      if (n.digits <= 6) {
        prefix_val <- round(number, sig.figs - n.digits - 1)
        prefix <- prettyNum(prefix_val, big.mark = ",", scientific = FALSE)
      } else {
        # Want to show only the number / 10^(multiple of 3) then the suffix multiplier
        suffix_val <- 10 ^ (3 * ((n.digits %/% 3)))
        prefix_val <- signif(number/suffix_val, digits = sig.figs)
        prefix <- prefix_val
        
        if (suffix_val <= 10^12){
          switch(log10(suffix_val) / 3 - 1,
                 suffix <- "~million", 
                 suffix <- "~billion", 
                 suffix <- "~trillion")
        } else {
          prefix <- signif(number / 10^12, digits = sig.figs)
          suffix <- "~trillion"
        }
      }
    }
    } else {
      stopifnot(.suffix %in% c("million", "billion", "trillion"))
      switch(.suffix, 
             "million" = {
              prefix <- signif(number / 10^6, digits = sig.figs)
              suffix <- "~million"
              suffix_val <- 10^6
             }, 
             "billion" = {
               prefix <- signif(number / 10^9, digits = sig.figs)
               suffix <- "~billion"
               suffix_val <- 10^9
             }, 
             "trillion" = {
               prefix <- signif(number / 10^12, digits = sig.figs)
               suffix <- "~trillion"
               suffix_val <- 10^12
             })
      prefix_val <- prefix
    }
    
    if (dollar){
      out <- paste0("\\$", prefix, suffix)
    } else {
      out <- paste0(prefix, suffix)
    }
    
    if (is.negative){
      # General LaTeX
      out <- paste0("\\(-\\)", out)
    }
    # is the displayed number larger than the original?
    if (!is.null(pre.phrase)){
      out_larger <- prefix_val * suffix_val > orig.number
      
        if (out_larger) {
          out <- paste(pre.phrase[1], out, sep = if(grepl("~$", pre.phrase[1])) "" else " ")
        } else {
          if (!isTRUE(all.equal(prefix_val * suffix_val, 
                                orig.number, 
                                tolerance = .Machine$double.eps)))
            out <- paste(pre.phrase[2], out, sep = if(grepl("~$", pre.phrase[2])) "" else " ")
        }
      
    }
    return(out)
  }
}

## ----taxable-income-quantiles--------------------------------------------
tx_inc_q <- function(q){
  quantile(sample_file$Taxable_Income, probs = q)
}

my_labs <- grattan_dollar(tx_inc_q((0:10)/10))
my_labs[seq(2, 10, 2)] <- paste0("\n", my_labs[seq(2, 10, 2)])

dens <- density(sample_file[Taxable_Income < tx_inc_q(0.95)]$Taxable_Income)
DF <- with(dens, data.frame(x, y))

sample_file %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  filter(between(Taxable_Income, 0, tx_inc_q(0.95))) %>%
  ggplot(aes(x = Taxable_Income)) + 
  geom_density() + 
  scale_fill_viridis(discrete = TRUE) + 
  scale_x_continuous("Taxable Income deciles", 
                     labels = c(my_labs, grattan_dollar(tx_inc_q(0.95))),
                     # limits = c(0, tx_inc_q(0.95)),
                     breaks = c(tx_inc_q((0:10)/10), tx_inc_q(0.95))) + 
  scale_y_continuous(expand = c(0,0)) +
  theme(legend.position = "none", 
        axis.line.y = element_blank(), 
        axis.text.y = element_blank(), 
        axis.title.y = element_blank())

## ----taxable-income-quantiles-filled-------------------------------------
DF %>% 
  mutate(Taxable_Income_decile = cut(x, 
                                     breaks = quantile(sample_file$Taxable_Income,
                                                       probs = c(0:10)/10), 
                                     right = TRUE,
                                     include.lowest = TRUE)) %>%
  filter(between(x, -1, tx_inc_q(0.95) * 1.05)) %>%
  {
    ggplot(., aes(x = x, y = y)) + 
      geom_area(color = "black", size = 1.45) +
      geom_area(aes(x = x, y = y, 
                    group = Taxable_Income_decile, 
                    fill = factor(Taxable_Income_decile),
                    color = factor(Taxable_Income_decile))) + 
      scale_color_viridis(discrete = TRUE) + 
      scale_fill_viridis(discrete = TRUE) + 
      scale_x_continuous("Taxable Income deciles", 
                         labels = c(my_labs, grattan_dollar(tx_inc_q(0.95))),
                         expand = c(0,0),
                         # limits = c(-1, tx_inc_q(0.95)*1.05),
                         breaks = c(tx_inc_q((0:10)/10), tx_inc_q(0.95))) + 
      scale_y_continuous(expand = c(0,0), limits = c(0, max(.$y) * 1.05)) +
  theme(legend.position = "none", 
        axis.line.y = element_blank(), 
        axis.text.y = element_blank(), 
        axis.title.y = element_blank())+ 
      
      annotate("text",
               x = tx_inc_q(0.925), 
               y = 2 * max(.$y[.$x > tx_inc_q(0.925)]),
               size = 10/(14/5),
               label = paste0("5% of taxpayers\nhad incomes\ngreater than\n", grattan_dollar(tx_inc_q(0.95))),
               hjust = 0,
               vjust = 0) + 
      annotate("segment", 
               arrow = arrow(type = "closed", length = unit(11, "pt"), angle = 20),
               x = tx_inc_q(0.925), 
               y = 1.9 * max(.$y[.$x > tx_inc_q(0.925)]),
               size = 1,
               xend = tx_inc_q(0.95),
               yend = 1.9 * max(.$y[.$x > tx_inc_q(0.925)])) 
  }

## ----CGT-description-stats-----------------------------------------------
n_CGs <- 
  sample_file %>%
  filter(Tot_CY_CG_amt > 0) %$%
  sum(WEIGHT)

n_CGs_prev <- 
  sample_file_prev %>%
  filter(Tot_CY_CG_amt > 0) %$%
  sum(WEIGHT)

tot_CG_amt <- 
  sample_file %$%
  sum(as.numeric(Tot_CY_CG_amt * WEIGHT))

tot_Net_CG_amt <- 
  sample_file %$%
  sum(as.numeric(Net_CG_amt * WEIGHT))

tax_on_CG <- 
  sample_file %>%
  filter(Net_CG_amt > 0) %>%
  mutate(tax = income_tax(Taxable_Income, fy.year = FY.YEAR), 
         tax_wo_CG = income_tax(pmaxC(Taxable_Income - Net_CG_amt, 0), fy.year = FY.YEAR)) %>%
  summarise(total = sum((tax - tax_wo_CG) * WEIGHT),
            avg = mean(tax - tax_wo_CG))

tax_on_CG_prev <- 
  sample_file_prev %>%
  filter(Net_CG_amt > 0) %>%
  mutate(tax = income_tax(Taxable_Income, fy.year = FY.YEAR), 
         tax_wo_CG = income_tax(pmaxC(Taxable_Income - Net_CG_amt, 0), fy.year = FY.YEAR)) %>%
  summarise(total = sum((tax - tax_wo_CG) * WEIGHT),
            avg = mean(tax - tax_wo_CG))
  

## ----latex_percent-------------------------------------------------------
latex_percent <- function(x) gsub("%", "\\%", percent(x), fixed = TRUE)

## ----CG-incidence-by-age-descriptive-stats-------------------------------
probCG_by_age <- 
  sample_file %>%
  group_by(age_range_description) %>%
  summarise(probCG = mean(Net_CG_amt > 0))

probCG_twenties <- 
  sample_file %>%
  filter(age_imp < 30) %$%
  mean(Net_CG_amt > 0)

probCG_65p <- 
  sample_file %>%
  filter(age_imp >= 65) %$%
  mean(Net_CG_amt > 0)

avg_marginal_rate_CG <- 
  sample_file %>%
  filter(Net_CG_amt > 0) %>%
  mutate(marginal_rate = income_tax(Taxable_Income + 1, fy.year = FY.YEAR) - income_tax(Taxable_Income, fy.year = FY.YEAR)) %$% 
  mean(marginal_rate)

avg_marginal_rate_CG_weighted_by_CG <- 
  sample_file %>%
  filter(Net_CG_amt > 0) %>%
  mutate(marginal_rate = income_tax(Taxable_Income + 1, fy.year = FY.YEAR) - income_tax(Taxable_Income, fy.year = FY.YEAR)) %$% 
  weighted.mean(marginal_rate, Net_CG_amt)

avg_marginal_rate_b4_CG <- 
  sample_file %>%
  filter(Net_CG_amt > 0, 
         age_imp >= 20) %>%
  mutate(Taxable_Income_b4_CG = pmaxC(Taxable_Income - Net_CG_amt, 0),
         marginal_rate_b4_CG = income_tax(Taxable_Income_b4_CG + 1, fy.year = FY.YEAR) - income_tax(Taxable_Income_b4_CG, fy.year = FY.YEAR)) %>%
  mutate(is_in_workforce = between(age_imp, 20, 65)) %>%
  group_by(is_in_workforce) %>%
  summarise(avg_marginal_rate_weighted = weighted.mean(marginal_rate_b4_CG, Net_CG_amt), 
            avg_marginal_Rate = mean(marginal_rate_b4_CG))

prop_no_CGT_discount <- 
  sample_file %>%
  mutate(apparent_discount = 1 - Net_CG_amt / Tot_CY_CG_amt) %>%
  filter(Tot_CY_CG_amt > 0) %$%
  mean(apparent_discount == 0)

prop_100pc_CGT_discount <- 
  sample_file %>%
  mutate(apparent_discount = 1 - Net_CG_amt / Tot_CY_CG_amt) %>%
  filter(Tot_CY_CG_amt > 0) %$%
  mean(apparent_discount == 1)

prop_50pc_CGT_discount <- 
  sample_file %>%
  mutate(apparent_discount = 1 - Net_CG_amt / Tot_CY_CG_amt) %>%
  filter(Tot_CY_CG_amt > 0) %$%
  mean(between(apparent_discount, 0.45, 0.55))

prop_no_CGT_discount_by_val <- 
  sample_file %>%
  mutate(apparent_discount = 1 - Net_CG_amt / Tot_CY_CG_amt) %>%
  filter(Tot_CY_CG_amt > 0) %$%
  weighted.mean(apparent_discount == 0, Tot_CY_CG_amt)

cgt_ratio_res <- 50

## ----Ratio-Net-CG-to-Tot-CG----------------------------------------------
sample_file %>%
  select(Tot_CY_CG_amt, Net_CG_amt, WEIGHT) %>%
  filter(Tot_CY_CG_amt > 0) %>%
  mutate(apparent_discount = Net_CG_amt / Tot_CY_CG_amt) %>%
  mutate(apparent_discount_round = round(apparent_discount * cgt_ratio_res) / cgt_ratio_res) %>%
  group_by(apparent_discount_round) %>%
  summarise(n_taxpayers = sum(WEIGHT), 
            n_taxpayers_by_val = sum(as.double(WEIGHT * Tot_CY_CG_amt))) %>%
  ggplot(aes(x = apparent_discount_round, y = n_taxpayers_by_val)) +
  xlab("Ratio of Net capital gains to Total capital gains") +
  geom_bar(stat = "identity", width = 1/cgt_ratio_res) + 
  theme(axis.title.y = element_blank(),
        axis.ticks.y = element_blank(),
        axis.text.y = element_blank())

## ----CG-by-tax-bracket---------------------------------------------------
CG_descriptive_by_bracket <- 
sample_file %>%
  mutate(tax = income_tax(Taxable_Income, fy.year = FY.YEAR), 
         tax_wo_CG = income_tax(pmaxC(Taxable_Income - Net_CG_amt, 0), fy.year = FY.YEAR)) %>%
  group_by(Tax_Bracket) %>%
  summarise(n_taxpayers = sum(WEIGHT),
            n_CG = sum(WEIGHT[Net_CG_amt > 0]),
            val_CG = sum(as.double(Tot_CY_CG_amt * WEIGHT)), 
            total_CGT = sum(as.double((tax - tax_wo_CG) * WEIGHT))) %>%
  ungroup %>%
  arrange(Tax_Bracket) 

## ------------------------------------------------------------------------
CG_descriptive_by_bracket %>% 
  # cosmetic
  mutate(Taxpayers = comma(n_taxpayers),
         `with CG` = comma(n_CG),
         `Total cap. gains ($)` = grattan_dollar(val_CG),
         `Total CGT ($)` = grattan_dollar(total_CGT)) %>%
  select(`Tax bracket` = Tax_Bracket,
         `Taxpayers`, `with CG`, `Total cap. gains ($)`, `Total CGT ($)`) %>%
  kable(align = "rrrrrr") 

## ----CG-incidence-by-age-------------------------------------------------
sample_file %>%
  ggplot(aes(x = age_imp, y = as.numeric(Net_CG_amt > 0))) + 
  geom_smooth(color = viridis(1), size = 1.2) + 
  scale_y_continuous(label = percent) 

## ----CG-incidence-by-age-by-fy-------------------------------------------
sample_files_all %>%
  select(age_range, Net_CG_amt, fy.year) %>%
  merge(age_range_decoder, by = "age_range") %>%
  group_by(age_range_description) %>%
  mutate(min_age = if_else(grepl("to", age_range_description), 
                           as.numeric(gsub("^([0-9]{2}).*$", "\\1", age_range_description)), 
                           if_else(grepl("70", age_range_description),
                                   70, 
                                   15)),
         max_age = min_age + 5, 
         age_imp = runif(n(), min_age, max_age)) %>%
  select(-min_age, -max_age) %>%
  mutate(last_fy = fy.year == max(fy.year)) %>%
  mutate(`Tax year` = factor(fy.year)) %>%
  group_by(`Tax year`) %>%
  mutate(label = if_else(age_imp == max(age_imp), fy.year, NA_character_),
         is_CG = Net_CG_amt > 0,
         label.y = mean(is_CG[age_imp > 71]), 
         Age = age_imp) %>%
         {
           
           ggplot(., aes(x = Age, 
                         y = as.numeric(is_CG), 
                         color = `Tax year`, 
                         group = `Tax year`)) + 
             scale_y_continuous(label = percent) + 
             ggtitle("Incidence of capital gains") +
             scale_color_viridis(discrete = TRUE) + 
             geom_line(stat = "smooth", method = "auto", se = FALSE, size = 1.2) +
             geom_label_repel(aes(label = label, y = label.y),
                              fill = NA,
                              nudge_x = 1,
                              hjust = 0, 
                              vjust = 0, 
                              fontface = "bold", 
                              na.rm = TRUE) + 
             annotate("blank", 
                      x = 80, y = 0) +
             theme_dark() + 
             theme(axis.title.y = element_blank())
         }

## ----CGT-by-age-weighted-ntile-------------------------------------------
set.seed(24841)
sample_files_all %>%
  select(age_range, Net_CG_amt, fy.year) %>%
  merge(age_range_decoder, by = "age_range") %>%
  group_by(age_range_description) %>%
  mutate(min_age = ifelse(grepl("to", age_range_description), 
                          as.numeric(gsub("^([0-9]{2}).*$", "\\1", age_range_description)), 
                          ifelse(grepl("70", age_range_description),
                                 70, 
                                 15)),
         max_age = min_age + 5, 
         age_imp = runif(n(), min_age, max_age)) %>%
  select(-min_age, -max_age) %>%
  filter(Net_CG_amt > 0) %>%
  mutate(Age = round(age_imp)) %>%
  group_by(fy.year, Age) %>%
  summarise(mean_Net_CG = mean(Net_CG_amt), 
            sd_Net_CG = sd(Net_CG_amt)) %>%
  ungroup %>%
  mutate(last_fy = fy.year == max(fy.year) | fy.year == max(fy.year[fy.year != max(fy.year)])) %>%
  group_by(fy.year) %>%
  mutate(label = ifelse(Age == max(Age), fy.year, NA_character_), 
         label.y = mean(mean_Net_CG[Age > 70])) %>%
         {
           ggplot(., aes(x = Age, y = mean_Net_CG, color = factor(fy.year), group = factor(fy.year))) + 
             scale_y_continuous(label = dollar) + 
             scale_color_viridis(discrete = TRUE) + 
             geom_line(stat = "smooth", method = "auto", se = FALSE, size = 1.2) +
             scale_alpha_discrete(range = c(0.5, 1)) + 
             geom_text(aes(label = label, y = label.y, size = if_else(last_fy %in% c("2012-13", "2013-14"), 2, 1),
                                                                      nudge_x = if_else(last_fy, 1, 0)),
                       hjust = 0, 
                       vjust = 0, 
                       fontface = "bold", 
                       na.rm = TRUE) + 
             scale_x_continuous(expand = c(0,0)) + 
             theme_dark() + 
             annotate("blank", 
                      x = 85, y = 0) + 
             theme(axis.title.y = element_blank(), 
                   plot.margin = unit(c(0,0,5,0), "pt"))
         }

## ----Age-distribution-ofCG-by-taxable-income-exclCG----------------------
sample_file %>%
  mutate(Tot_inc_amt_noCG = Tot_inc_amt - Net_CG_amt, 
         Taxable_Income_noCG = pmaxC(Tot_inc_amt_noCG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0)) %>%
  mutate(Taxable_Income_noCG_decile = ntile(Taxable_Income_noCG, 10)) %>%
  filter(Taxable_Income_noCG_decile %in% c(1, 5, 10)) %>%
  filter(Net_CG_amt > 0) %>%
  rename(Age = age_imp) %>%
  mutate(`Taxable Income\n(excl CG) decile` = factor(Taxable_Income_noCG_decile)) %>%
  ggplot(aes(x = Age, fill = `Taxable Income\n(excl CG) decile`)) +
  geom_density(alpha = 0.7) +
  theme(legend.position = "right")

## ----CGT-marginal-rate-weighted-and-unweighted---------------------------
if (FY.YEAR != "2013-14"){
  stop("Check annotations in this chart before compiling")
}
sample_file %>% 
  filter(Net_CG_amt > 0, age_imp > 20) %>% 
  mutate(marginal_rate = income_tax(Taxable_Income + 1, fy.year = FY.YEAR) - income_tax(Taxable_Income, fy.year = FY.YEAR)) %>%
  rename(Age = age_imp) %>%
  ggplot(aes(x = Age, y = marginal_rate)) + 
  scale_y_continuous(label = percent) + 
  geom_smooth(aes(weight = 1), colour = viridis(2)[1], size = 1.2) + 
  geom_smooth(aes(weight = Net_CG_amt), colour = viridis(2)[2], size = 1.2) + 
  annotate("text", 
           x = c(57, 57), 
           y = c(0.335, 0.435), 
           label = c("Unweighted", "Weighted by CG amt"), 
           colour = viridis(2), 
           fontface = "bold", 
           hjust = 0) + 
  theme(axis.title.y = element_blank())

## ----CGT-marginal-rate-b4-CG-weighted-and-unweighted---------------------
if (FY.YEAR != "2013-14"){
  stop("Check annotations in this chart before compiling")
}
sample_file %>% 
  filter(Net_CG_amt > 0, age_imp > 20) %>% 
  mutate(Taxable_Income_b4_CG = pmaxC(Taxable_Income - Net_CG_amt, 0),
         marginal_rate_b4_CG = income_tax(Taxable_Income_b4_CG + 1, fy.year = FY.YEAR) - income_tax(Taxable_Income_b4_CG, fy.year = FY.YEAR)) %>% 
  rename(Age = age_imp) %>%
  ggplot(aes(x = Age, y = marginal_rate_b4_CG)) + 
  scale_y_continuous(label = percent) +
  geom_smooth(aes(weight = 1),  colour = viridis(2)[2], size = 1.2) +
  geom_smooth(aes(weight = Net_CG_amt), colour = viridis(2)[1], size = 1.2) + 
  annotate("text", 
           x = c(31, 35), 
           y = c(0.315, 0.225), 
           label = c("Unweighted", "Weighted by CG amt"), 
           colour = viridis(2), 
           fontface = "bold", 
           hjust = 0) + 
  theme(axis.title.y = element_blank())

## ----Negative-gearing-stats----------------------------------------------
n_prop_invstrs <-
  sample_file %$%
  sum((Gross_rent_amt > 0) * WEIGHT)

n_NGs <- 
  sample_file %$%
  sum((Net_rent_amt < 0) * WEIGHT)

val_NG_losses <- 
  sample_file %$%
  sum(abs(pminC(Net_rent_amt, 0) * WEIGHT))

NG_tax_exp <- 
  sample_file %>%
  mutate(tax = income_tax(Taxable_Income, fy.year = FY.YEAR),
         new_tax = income_tax(Taxable_Income - pminC(Net_rent_amt, 0), fy.year = FY.YEAR),
         diff = new_tax - tax) %$%
  sum(diff * WEIGHT)

## ----NG-vs-salary--------------------------------------------------------
sample_file %>%
  filter(between(Sw_amt, 0, 250e3)) %>%
  rename(Salary = Sw_amt) %>%
  ggplot(aes(x = Salary, y = as.numeric(Net_rent_amt < 0))) + 
  geom_smooth(colour = viridis(2)[2], size = 1.5) +
  scale_y_continuous(label = percent) + 
  scale_x_continuous(label = dollar) + 
  theme(axis.title.y = element_blank())

## ----NG-by-tax-bracket---------------------------------------------------
NG_by_taxBracket <-
  sample_file %>%
  mutate(Tax_bracket = cut(Taxable_Income, 
                             breaks = c(-Inf, 18200, 37e3, 80e3, 180e3, Inf),
                             labels = c("$0-$18,200", "$18,201-$37,000", 
                                        "$37,001-$80,000", "$80,001-$180,000", 
                                        "Over $180,000"),
                             ordered_results = TRUE,
                             include.lowest = TRUE)) %>%
  group_by(Tax_bracket) %>%
  summarise(n_NG = wsum(Net_rent_amt < 0, WEIGHT), 
            n = sum(WEIGHT)) %>%
  arrange(Tax_bracket)

## ----NG-by-tax-bracket-xtable, results='asis'----------------------------
NG_by_taxBracket %>%
  mutate(`Number negative gearing` = comma(n_NG), 
         `\\%` = percent(n_NG / n)) %>%
  select(`Tax bracket` = Tax_bracket, 
         `Number negative gearing`, 
         `\\%`) %>%
  kable(align = "rrr") 

## ----NG-by-tax-bracket-tax-benefit---------------------------------------
NG_by_taxBracket_tax_benefit <- 
  sample_file %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  mutate(Tax_bracket = cut(Taxable_Income, 
                             breaks = c(-Inf, 18200, 37e3, 80e3, 180e3, Inf),
                             labels = c("$0-$18,200", 
                                        "$18,201-$37,000", 
                                        "$37,001-$80,000", 
                                        "$80,001-$180,000", 
                                        "Over $180,000"),
                             ordered_results = TRUE,
                             include.lowest = TRUE)) %>%
  group_by(Tax_bracket) %>%
  summarise(total_tax_change = sum(change * WEIGHT),
            avg_tax_change = mean(change)) %>%
  arrange(Tax_bracket)

## ----NG-by-tax-bracket-tax-benefit-xtable, results='asis'----------------
NG_by_taxBracket_tax_benefit %>%
  mutate(`Total tax change` = grattan_dollar(total_tax_change), 
         `Average tax change` = grattan_dollar(avg_tax_change)) %>%
  select(`Tax bracket` = Tax_bracket, 
         `Total tax change`, 
         `Average tax change`) %>%
  kable(align = paste0(rep("r", ncol(.)), collapse = ""))

## ----NG-by-taxable-income-decile-----------------------------------------
NG_by_taxable_income_decile <- 
  sample_file %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  group_by(Taxable_Income_decile) %>%
  summarise(n_NG = wsum(Net_rent_amt < 0, WEIGHT), 
            n = sum(WEIGHT)) %>%
  arrange(Taxable_Income_decile) 

## ----NG-by-taxable-income-decile-xtable, results='asis'------------------
NG_by_taxable_income_decile %>%
mutate(`Number negative gearing` = comma(n_NG), 
         `\\%` = percent(n_NG / n)) %>%
  mutate(`Taxable Income decile` = factor(Taxable_Income_decile)) %>%
  select(`Taxable Income decile`, 
         `Number negative gearing`, 
         `\\%`) %>%
  kable(align = "rrrr") 

## ----NG-tax-benefit-by-income-tax-decile---------------------------------
NG_tax_benefit_taxable_income_decile <-
  sample_file %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  group_by(Taxable_Income_decile) %>%
  summarise(tax_diff = sum(change * WEIGHT)) %>% 
  ungroup %>%
  mutate(tax_diff_prop = tax_diff / sum(tax_diff)) %>%
  arrange(Taxable_Income_decile) %>%
  mutate(decile_by = "Taxable income")

NG_tax_benefit_taxable_income_decile_noNG <-
  sample_file %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income_noNG, 10)) %>%
  group_by(Taxable_Income_decile) %>%
  summarise(tax_diff = sum(change * WEIGHT)) %>%
  ungroup %>%
  mutate(tax_diff_prop = tax_diff / sum(tax_diff)) %>%
  arrange(Taxable_Income_decile) %>%
  mutate(decile_by = "Taxable income before NG")

bind_rows("Current" = NG_tax_benefit_taxable_income_decile, 
          "Before NG" = NG_tax_benefit_taxable_income_decile_noNG) %>%
  mutate(`Taxable income decile` = factor(Taxable_Income_decile)) %>%
  ggplot(aes(x = `Taxable income decile`, y = tax_diff_prop, fill = decile_by)) + 
  geom_bar(stat = "identity") +
  facet_grid(~decile_by) + 
  scale_y_continuous(label = percent, 
                     expand = c(0,0),
                     limits = c(0, round(max(c(NG_tax_benefit_taxable_income_decile_noNG$tax_diff_prop, 
                                               NG_tax_benefit_taxable_income_decile$tax_diff_prop)), 1)))
  

## ----NG-tax-benefit-comparison-prev-fy-----------------------------------
NG_tax_benefit_taxable_income_decile_prev <-
  sample_file_prev %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  group_by(Taxable_Income_decile) %>%
  summarise(tax_diff = sum(change * WEIGHT)) %>% 
  ungroup %>%
  mutate(tax_diff_prop = tax_diff / sum(tax_diff)) %>%
  arrange(Taxable_Income_decile) %>%
  mutate(decile_by = "Taxable income")

NG_tax_benefit_taxable_income_decile_noNG_prev <-
  sample_file_prev %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  group_by(Taxable_Income_decile) %>%  summarise(tax_diff = sum(change * WEIGHT)) %>%
  ungroup %>%
  mutate(tax_diff_prop = tax_diff / sum(tax_diff)) %>%
  arrange(Taxable_Income_decile) %>%
  mutate(decile_by = "Taxable income before NG")

bind_rows("Current" = NG_tax_benefit_taxable_income_decile, 
          "Before NG" = NG_tax_benefit_taxable_income_decile_noNG, 
          "Current (prev fy)" = NG_tax_benefit_taxable_income_decile_prev, 
          "Before NG (prev fy)" = NG_tax_benefit_taxable_income_decile_noNG_prev, 
          .id = "df_id") %>%
  mutate(`Taxable income decile` = factor(Taxable_Income_decile)) %>%
  mutate(financial_year = ifelse(grepl("prev fy", df_id), PREV.FY.YEAR, FY.YEAR)) %>%
  ggplot(aes(x = `Taxable income decile`, y = tax_diff_prop, fill = financial_year)) + 
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_viridis(discrete = TRUE, begin = 0, end = 0.3333) +
  facet_grid(~decile_by) + 
  scale_y_continuous(label = percent, 
                     expand = c(0,0),
                     limits = c(0, round(max(c(NG_tax_benefit_taxable_income_decile_noNG$tax_diff_prop, 
                                               NG_tax_benefit_taxable_income_decile$tax_diff_prop)), 1))) + 
  theme(legend.margin = unit(0, "lines"), 
        legend.title = element_blank(),
        legend.position = c(0.00, 1.025), 
        legend.background = element_blank(),
               
        legend.justification = c(0, 1), 
        axis.title.y = element_blank(),
        strip.background = element_rect(color = grey(0.8), fill = grey(0.8)),
        strip.text = element_text(colour = "white", face = "bold"))

## ----NG-incidence-by-age-------------------------------------------------
p <- 
  ggplot(NULL) + 
  geom_smooth(data = sample_file, 
              aes(x = age_imp, y = as.numeric(Net_rent_amt < 0)), 
              colour = viridis(2)[1], 
              size = 1.2) + 
  geom_smooth(data = filter(sample_file, Gross_rent_amt > 0), 
              aes(x = age_imp, 
                  y = as.numeric(Net_rent_amt < 0)), 
              colour = viridis(2)[2], 
              size = 1.2) +
  scale_y_continuous(label = percent) + 
  xlab("Age") + 
  coord_cartesian(ylim = c(0,1)) + 
  theme(axis.title.y = element_blank()) 

if (FY.YEAR == "2013-14"){
  p <- 
    p + 
    annotate("text", 
             x = c(38, 38), 
             y = c(0.18, y = 0.80), 
             label = c("All taxpayers", "Property investors"), 
             hjust = c(0.5, 0), 
             colour = viridis(2),
             fontface = "bold")
} else {
  p <- p + 
    theme(legend.position = "right")
}

p

## ----NG-by-age-by-total-income-------------------------------------------
age_res = 1
inc_res = 10000

sample_file %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  
  # This excludes income losses (barely any anyway)
  # and high income earners
  filter(between(Tot_inc_amt_NoNG, 
                 0, 
                 upper_ylim <<- quantile(.$Tot_inc_amt_NoNG[.$Tot_inc_amt_NoNG > 0], probs = 0.95))) %>%
  
  mutate(Age = age_res * round(age_imp / age_res), 
         `Total Income (before NG)` = inc_res * round(Tot_inc_amt_NoNG / inc_res)) %>%
  group_by(Age, `Total Income (before NG)`) %>%
  summarise(n_NG = sum((Net_rent_amt < 0) * WEIGHT), 
            prop_NG = mean(Net_rent_amt < 0),
            tot_tax_benefit = sum(change * WEIGHT), 
            avg_tax_benefit = mean(change)) %>% ungroup %>%  
  
  
  ggplot(aes(x = Age, y = `Total Income (before NG)`, fill = prop_NG)) + 
  geom_bin2d(stat = "identity") + 
  scale_fill_viridis("% NG", labels = percent) + 
  scale_y_continuous(expand = c(0,0), label = grattan_dollar) + 
  scale_x_continuous(expand = c(0,0)) + 
  theme_dark() +
  theme(legend.title = element_blank(), 
        plot.margin = unit(c(0,0,0,0), "pt"))# %>%
  #align_baptiste(.)

## ----NG-tax-benefit-by-age-by-total-income-------------------------------
age_res = 1
inc_res = 10000

sample_file %>%
  mutate(Tot_inc_amt_NoNG = Tot_inc_amt - Net_rent_amt + pmaxC(Net_rent_amt, 0),
         Taxable_Income_noNG = pmaxC(Tot_inc_amt_NoNG - Tot_ded_amt - NPP_loss_claimed - PP_loss_claimed, 0),
         tax_current = income_tax(Taxable_Income, fy.year = FY.YEAR),
         tax_noNG = income_tax(Taxable_Income_noNG, fy.year = FY.YEAR),
         change = tax_noNG - tax_current) %>%
  
  # This excludes income losses (barely any anyway)
  # and high income earners
  filter(between(Tot_inc_amt_NoNG, 
                 0, 
                 upper_ylim <<- quantile(.$Tot_inc_amt_NoNG[.$Tot_inc_amt_NoNG > 0], probs = 0.95))) %>%
  
  mutate(Age = age_res * round(age_imp / age_res), 
         `Total Income (before NG)` = inc_res * round(Tot_inc_amt_NoNG / inc_res)) %>%
  group_by(Age, `Total Income (before NG)`) %>%
  summarise(n_NG = sum((Net_rent_amt < 0) * WEIGHT), 
            prop_NG = mean(Net_rent_amt < 0),
            tot_tax_benefit = sum(change * WEIGHT), 
            avg_tax_benefit = mean(change)) %>% ungroup %>%  
  
  
  ggplot(aes(x = Age, y = `Total Income (before NG)`, fill = avg_tax_benefit)) + 
  geom_bin2d(stat = "identity") + 
  scale_fill_viridis("Tax benefit", labels = grattan_dollar) + 
  scale_y_continuous(expand = c(0,0), label = grattan_dollar) + 
  scale_x_continuous(expand = c(0,0)) + 
  theme_dark() +
  theme(legend.title = element_blank())

## ------------------------------------------------------------------------
wage_r_by_fy <- 
  data.table(fy.year = yr2fy(2005:2014)) %>%
  mutate(lag_fy = yr2fy(2004:2013)) %>%
  mutate(wage_growth_r = wage_inflator(from_fy = lag_fy, to_fy = fy.year) - 1)

## ---- fig.width=7, fig.height=6------------------------------------------
average_salary_by_fy_swtile <- 
  sample_files_all %>%
  select(fy.year, Sw_amt) %>%
  filter(Sw_amt > 0) %>%
  group_by(fy.year) %>%
  mutate(`Salary percentile` = ntile(Sw_amt, 100)) %>%
  ungroup %>%
  group_by(fy.year, `Salary percentile`) %>%
  summarise(average_salary = mean(Sw_amt)) %>%
  ungroup %>%
  arrange(`Salary percentile`, fy.year) %>%
  group_by(`Salary percentile`) %>%
  mutate(r_average_salary = average_salary / lag(average_salary) - 1) %>%
  filter(fy.year != min(fy.year))

{
  p <- 
    average_salary_by_fy_swtile %>%  # NA
    ungroup %>%
    merge(wage_r_by_fy, by = "fy.year") %>%
    mutate(`Basic wage inflator` = "Basic wage inflator") %>%
    ggplot() + 
    geom_area(aes(x = `Salary percentile`, y = r_average_salary, group = fy.year, fill = fy.year), 
              se = FALSE, stat = "smooth", method = "loess") + 
    theme_bw() + 
    theme(legend.position = "right", plot.background = element_blank()) + 
    geom_line(aes(x = `Salary percentile`, y = wage_growth_r, group = `Basic wage inflator`, color = `Basic wage inflator`),
              size = 1.125) + 
    scale_color_manual(values = "black") +
    scale_y_continuous(name = "Salary rate of increase", label = percent) + 
    facet_wrap(~fy.year, ncol = 5) +
    guides(fill = FALSE) + 
    theme(legend.position = c(0, 1), 
          legend.title = element_blank(), 
          legend.key = element_blank(),
          legend.justification = c(0, 1))
  
  # ggplotly(p)
  p
}


## ------------------------------------------------------------------------
differential_uprates <- 
  average_salary_by_fy_swtile %>%
  group_by(`Salary percentile`) %>%
  summarise(avg_r = mean(r_average_salary)) %>% 
  mutate(avg_r_normed = avg_r / mean(avg_r))

differential_uprates %>%
  ggplot(aes(x = `Salary percentile`, y = avg_r)) +
  geom_line() + 
  scale_y_continuous(label = percent)

## ---- echo=TRUE----------------------------------------------------------
data_frame(wage = c(20e3, 50e3, 100e3)) %>%
  mutate(ordinary = wage_inflator(wage, from_fy = "2012-13", to_fy = "2013-14"), 
         `change ordinary` = ordinary / wage - 1, 
         differential = differentially_uprate_wage(wage, from_fy = "2012-13", to_fy = "2013-14"), 
         `change differential` = differential / wage - 1
         ) %>%
  mutate(wage = dollar(wage),
         ordinary = dollar(ordinary), 
         differential = dollar(differential), 
         `change ordinary` = percent(`change ordinary`), 
         `change differential` = percent(`change differential`)) %>%
  kable(align = rep("r", ncol(.)))

## ------------------------------------------------------------------------
library(grattan)
library(data.table)
if (requireNamespace("taxstats", quietly = TRUE)){
  library(taxstats)
  sample_files_all <- get_sample_files_all()
} else {
  templib <- tempfile()
  hutils::provide.dir(templib)
  install.packages("taxstats",
                   lib = templib,
                   repos = "https://hughparsonage.github.io/drat/",
                   type = "source")
  library("taxstats", lib.loc = templib)
  sample_files_all <- get_sample_files_all()
}
library(magrittr)
#' dollar scales
#' 
#' @name grattan_dollar
#' @param x A numeric vector
#' @param digits Minimum number of digits after the decimal point. (\code{nsmall} in \code{base::format}).
#' @details Makes negative numbers appear as \eqn{-\$10,000} instead of \eqn{\$-10,000} in \code{scales::dollar}.
#' @export
# from scales

grattan_dollar <- function (x, digits = 0) {
  #
  nsmall <- digits
  commaz <- format(abs(x), nsmall = nsmall, trim = TRUE, big.mark = ",", 
                   scientific = FALSE, digits = 1L)
  
  hutils::if_else(x < 0, 
          paste0("\U2212","$", commaz),
          paste0("$", commaz))
}

(new_revenue <- 
  sample_file_1314 %>%
  project_to(to_fy = "2017-18") %>%
  as.data.table %>%
  revenue_from_new_cap_and_div293(new_cap = 25e3, fy.year = "2016-17", new_age_based_cap = FALSE, new_div293_threshold = 250e3))

paste(grattan_dollar(new_revenue / 1e9), "bn")

(n_affected <-
  sample_file_1314 %>%
  project_to(to_fy = "2017-18") %>%
  as.data.table %>%
  n_affected_from_new_cap_and_div293(new_cap = 25e3, fy.year = "2016-17", new_age_based_cap = FALSE, new_div293_threshold = 250e3))

prettyNum(round(n_affected), big.mark = ",")

## ------------------------------------------------------------------------
sample_file_1718 <-
  sample_file_1314 %>%
  project_to(to_fy = "2017-18") %>%
  as.data.table

## ------------------------------------------------------------------------
new_sample_file_1718 <- 
  sample_file_1718 %>%
  model_new_caps_and_div293(new_cap = 25e3, fy.year = "2016-17", new_age_based_cap = FALSE, new_div293_threshold = 250e3)


## ------------------------------------------------------------------------
library(knitr)
library(dplyr)
library(dtplyr)  # for data.table

new_sample_file_1718 %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  group_by(Taxable_Income_decile) %>%
  summarise(`Average increase in tax` = round(mean(new_revenue - prv_revenue), 2)) %>%
  arrange(Taxable_Income_decile) %>%
  kable

## ------------------------------------------------------------------------
library(ggplot2)
new_sample_file_1718 %>%
  mutate(Taxable_Income_decile = ntile(Taxable_Income, 10)) %>%
  group_by(Taxable_Income_decile) %>%
  summarise(`Average increase in tax` = mean(new_revenue - prv_revenue)) %>%
  arrange(Taxable_Income_decile) %>%
  #
  mutate(`Taxable income decile` = factor(Taxable_Income_decile)) %>%
  ggplot(aes(x = `Taxable income decile`, y = `Average increase in tax`)) + 
  geom_bar(stat = "identity") + 
  
  # cosmetic:
  scale_y_continuous(label = grattan_dollar) + 
  theme(axis.title.y = element_text(face = "bold", angle = 90, margin = margin(1, 1, 1, 1, "lines")))

## ------------------------------------------------------------------------
sample_file_1314_projected <- 
  sample_file_1213 %>%
  copy %>%
  mutate(WEIGHT = 50) %>%
  project(h = 1L,
          fy.year.of.sample.file = "2012-13",
          .recalculate.inflators = TRUE) %>%
  .[]

## ------------------------------------------------------------------------
data.table(the_source = c("Actual",
                          "Projected"),
           n_persons = c(nrow(sample_file_1314) * 50,
                         sum(sample_file_1314_projected$WEIGHT)), 
           avg_Taxable_Income = c(mean(sample_file_1314$Taxable_Income),
                                  mean(sample_file_1314_projected$Taxable_Income)),
           avg_Sw = c(mean(sample_file_1314$Sw_amt),
                      mean(sample_file_1314_projected$Sw_amt))
) %>% 
  melt.data.table(id.vars = "the_source") %>%
  group_by(variable) %>%
  mutate(value_rel = value / first(value)) %>%
  # dcast.data.table(variable ~ the_source) %>%
  ggplot(aes(x = variable, y = value_rel, fill = the_source)) + 
  geom_bar(stat = "identity", position = "dodge") + 
  geom_text(aes(label = comma(round(value))),
            position = position_dodge(width = 0.9),
            hjust = 1.02) + 
  coord_flip() + 
  theme(legend.position = "top")

## ------------------------------------------------------------------------
conf_int_of_t.test <- function(variable){
  t_test <- t.test(sample_file_1314[[variable]],
                   sample_file_1314_projected[[variable]])
  
  data.table(var = variable,
             conf.low = t_test$conf.int[1],
             conf.high = t_test$conf.int[2],
             p.value = t_test$p.value)
}

c("Sw_amt",
  "Net_rent_amt",
  "Net_CG_amt",
  "Tot_inc_amt",
  "Tot_ded_amt",
  "Taxable_Income") %>%
  lapply(conf_int_of_t.test) %>%
  rbindlist %>%
  .[, list(var, conf.low, conf.high, p.value)] %>%
  ggplot(aes(x = var,
             ymin = conf.low,
             ymax = conf.high,
             color = p.value > 0.05)) + 
  geom_errorbar() + 
  geom_hline(yintercept = 0)

## ----echo=FALSE----------------------------------------------------------
options("scipen" = 0)

