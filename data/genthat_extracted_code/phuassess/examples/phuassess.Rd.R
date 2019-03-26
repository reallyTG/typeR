library(phuassess)


### Name: phuassess
### Title: phuassess
### Aliases: phuassess
### Keywords: habitat selection proportional habitat use permutation-based
###   combination of sign tests multiple test approach nonparametric test

### ** Examples

## The following examples are the habitat selection analysis of 14 hares in 
## the protected area of Spicciano (Tuscany, Central Italy) reported in
## Fattorini et al. (2017). 


data(hares)

## Don't show: 
##############################################################################
## Second order habitat selection: study area vs home range 
## In order to save computation time, only a sample of 5000 permutations
## is considered, while the results reported in the paper refer to all the 
## possible 16.384 permutations. The instructions to run the analysis reported
## in the paper are available in the help page

second_order <- phuassess(hares$PAHR, hares$study_area, hnames=TRUE, 
exactperm = FALSE, nrperm = 5000)
## End(Don't show)
## Not run: 
##D ##############################################################################
##D ## Second order habitat selection: study area vs home range 
##D ## All the possible 16.384 permutations are considered
##D 
##D second_order <- phuassess(hares$PAHR, hares$study_area, hnames=TRUE)
##D 
##D ## Overall p-value for the assessment of the hypothesis of proportional
##D ## habitat use
##D second_order$pvalue.overall
##D 
##D ## Overall p-value allows the rejection of the hypothesis of proportional
##D ## habitat use. The data frame containing the p-values for each partial
##D ## hypothesis and for the paired comparisons among habitat types, together
##D ## with habitat ordering, can be considered.
##D second_order$ordering
##D 
##D ##############################################################################
##D ## Third order habitat selection: percentages of radio locations vs home range
##D ## All the possible 16.384 permutations are considered
##D 
##D ## Day
##D third_order_day <- phuassess(hares$PAT_day, hares$PAHR, hnames=TRUE)
##D 
##D ## Overall p-value for the assessment of the hypothesis of proportional
##D ## habitat use
##D third_order_day$pvalue.overall
##D 
##D ## Overall p-value does not allow the rejection of the hypothesis of 
##D ## proportional habitat use. As the p-value is considerably near the 
##D ## critical value of 0.05, instead of mechanistically precluding further 
##D ## insights, the marginal tests are also considered.
##D third_order_day$ordering
##D 
##D ## Night
##D third_order_night <- phuassess(hares$PAT_night, hares$PAHR, hnames=TRUE)
##D 
##D ## Overall p-value for the assessment of the hypothesis of proportional 
##D ## habitat use.
##D third_order_night$pvalue.overall
##D 
##D ## Overall p-value allows the rejection of the hypothesis of proportional
##D ## habitat use. The data frame with the p-values for partial hypotheses and
##D ## paired comparisons, together with habitat ordering, can be considered.
##D third_order_night$ordering
## End(Not run)



