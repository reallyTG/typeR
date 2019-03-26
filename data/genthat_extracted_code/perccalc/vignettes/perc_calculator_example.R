## ---- message = FALSE, warning = FALSE-----------------------------------
library(dplyr)
library(ggplot2)
library(carData)

## ---- message = FALSE, warning = FALSE-----------------------------------
set.seed(213141)
data("GSSvocab")

gss <- 
  as_tibble(GSSvocab) %>% 
  filter(year == '1978') %>% 
  mutate(weight = sample(1:3, size = nrow(.), replace = TRUE, prob = c(0.1, 0.5, 0.4))) %>% 
  select(ageGroup, vocab, weight)


gss

## ---- eval = F-----------------------------------------------------------
#  devtools::install_github("cimentadaj/perccalc")
#  library(perccalc)

## ---- echo = F, message = F, warning = F---------------------------------
library(perccalc)

## ---- error = TRUE-------------------------------------------------------
perc_diff(gss, ageGroup, vocab, percentiles = c(90, 10))

## ------------------------------------------------------------------------
gss <-
  gss %>%
  mutate(ageGroup = factor(ageGroup, ordered = TRUE))

## ------------------------------------------------------------------------
perc_diff(gss, ageGroup, vocab, percentiles = c(90, 10))

## ------------------------------------------------------------------------
perc_diff(gss, ageGroup, vocab, percentiles = c(50, 10))

## ------------------------------------------------------------------------
perc_diff(gss, ageGroup, vocab, weight)

## ---- eval = FALSE-------------------------------------------------------
#  # Saving the dataset to a path
#  gss %>%
#    write_dta(path = "C:\\Users\\cimentadaj\\Downloads\\gss_data.dta", version = 13)

## ---- eval = F-----------------------------------------------------------
#  *--------
#  use "/Users/cimentadaj/Downloads/gss_data.dta", clear
#  
#  drop if missing(ageGroup)
#  drop if missing(vocab)
#  
#  tab ageGroup, gen(inc)
#  *--------
#  
#  /*-----------------------
#  	Making a data set that has
#  	one observation per age group category
#  	and has mean and se(mean) in each category
#  	and percent of population in the category
#  ------------------------*/
#  
#  tempname memhold
#  tempfile results
#  postfile `memhold' agegroup mean se_mean per using `results'
#  
#  forv i = 1/5 {
#  	sum inc`i' [aw=weight]
#  	loc per`i' = r(mean)
#  									
#  	qui sum vocab if inc`i'==1
#  							
#  	if `r(N)'>0 {
#  		qui regress vocab if inc`i'==1 [aw=weight]
#  		post `memhold' (`i') (_b[_cons]) (_se[_cons]) (`per`i'')
#  							
#  	}				
#  }
#  postclose `memhold'	
#  
#  /*-----------------------
#  	Making age group categories
#  	into percentiles
#  ------------------------*/
#  
#  
#  	use `results', clear
#  
#  	sort agegroup
#  	gen cathi = sum(per)
#  	gen catlo = cathi[_n-1]
#  	replace catlo = 0 if agegroup==1
#  	gen catmid = (catlo+cathi)/2
#  	
#  	/*-----------------------
#  		Calculate age group
#  		vocabulary gaps
#  	------------------------*/
#  
#  	sort agegroup
#  	
#  	g x1 = catmid
#  	g x2 = catmid^2 + ((cathi-catlo)^2)/12
#  	g x3 = catmid^3 + ((cathi-catlo)^2)/4
#  
#  	g cimnhi = mean + 1.96*se_mean
#  	g cimnlo = mean - 1.96*se_mean
#  
#  	reg mean x1 x2 x3 [aw=1/se_mean^2]
#  
#  	twoway (rcap cimnhi cimnlo catmid) (scatter mean catmid) ///
#  		(function y = _b[_cons] + _b[x1]*x + _b[x2]*x^2 + _b[x3]*x^3, ran(0 1))	
#  	
#  	loc hi_p = 90
#  	loc lo_p = 10
#  
#  	loc d1 = [`hi_p' - `lo_p']/100
#  	loc d2 = [(`hi_p')^2 - (`lo_p')^2]/(100^2)
#  	loc d3 = [(`hi_p')^3 - (`lo_p')^3]/(100^3)
#  
#  	lincom `d1'*x1 + `d2'*x2 + `d3'*x3
#  	loc diff`hi_p'`lo_p' = r(estimate)
#  	loc se`hi_p'`lo_p' = r(se)
#  	
#  	di "`hi_p'-`lo_p' gap:     `diff`hi_p'`lo_p''"
#  	di "se(`hi_p'-`lo_p' gap): `se`hi_p'`lo_p''"

## ------------------------------------------------------------------------
perc_diff(gss, ageGroup, vocab, weight)

## ------------------------------------------------------------------------
perc_dist(gss, ageGroup, vocab) %>%
  head()

## ---- fig.align = 'center', fig.width = 6, fig.height = 5----------------
gss %>%
  perc_dist(ageGroup, vocab, weight) %>%
  mutate(ci_low = estimate - 1.96 * std.error,
         ci_hi = estimate + 1.96 * std.error) %>%
  ggplot(aes(percentile, estimate)) +
  geom_point() +
  geom_errorbar(aes(ymin = ci_low, ymax = ci_hi))

## ------------------------------------------------------------------------
perc_dist(gss, ageGroup, vocab, weight) %>%
  filter(percentile %in% c(90, 10)) %>%
  summarize(diff = diff(estimate),
            se_diff = diff(std.error))

## ------------------------------------------------------------------------
perc_diff(gss, ageGroup, vocab, weight, percentiles = c(90, 10))

