library(epiR)


### Name: epi.nomogram
### Title: Post-test probability of disease given sensitivity and
###   specificity of a test
### Aliases: epi.nomogram
### Keywords: univar univar

### ** Examples

## EXAMPLE 1:
## You are presented with a dog with lethargy, exercise intolerance, 
## weight gain and bilaterally symmetric truncal alopecia. You are 
## suspicious of hypothyroidism and take a blood sample to measure 
## basal serum thyroxine (T4).

## You believe that around 5% of dogs presented to your clinic with 
## a signalment of general debility have hypothyroidism. The serum T4 
## has a sensitivity of 0.89 and specificity of 0.85 for diagnosing 
## hypothyroidism in the dog. The laboratory reports a serum T4 
## concentration of 22.0 nmol/L (reference range 19.0 to 58.0 nmol/L). 
## What is the post-test probability that this dog is hypothyroid?

epi.nomogram(se = 0.89, sp = 0.85, lr = NA, pre.pos = 0.05, verbose = FALSE)

## Given a positive test result, the post-test probability of being 
## disease positive is 0.24.

## Given a negative test result, the post-test probability of being 
## disease negative is 0.0068.

## EXAMPLE 2:
## A dog is presented to you with severe pruritis. You suspect sarcoptic 
## mange and decide to take a skin scraping (LR+ 9000; LR- 0.1). The scrape 
## returns a negative result (no mites are seen). What is the post-test 
## probability that your patient has sarcoptic mange? You recall that you 
## diagnose around 3 cases of sarcoptic mange per year in a clinic that 
## sees approximately 2 -- 3 dogs per week presented with pruritic skin disease.

pre.pos <- 3 / (3 * 52)
epi.nomogram(se = NA, sp = NA, lr = c(9000, 0.1), pre.pos = pre.pos, 
   verbose = FALSE)

## If the skin scraping is negative the post-test probability that this dog 
## has sarcoptic mange is 0.002.




