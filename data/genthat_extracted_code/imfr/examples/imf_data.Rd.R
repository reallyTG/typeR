library(imfr)


### Name: imf_data
### Title: Download a data from the IMF
### Aliases: imf_data

### ** Examples

# Download Real Effective Exchange Rate (CPI base) for the UK and China
# at an annual frequency
real_ex <- imf_data(database_id = 'IFS', indicator = 'EREER_IX',
               country = c('CN', 'GB'), freq = 'A')

## Not run: 
##D # Also download Interest Rates, Lending Rate, Percent per annum
##D ex_interest <- imf_data(database_id = 'IFS',
##D                          indicator = c('FILR_PA', 'EREER_IX'),
##D                          freq = 'M')
## End(Not run)



