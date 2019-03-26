library(MortalityLaws)


### Name: ReadHMD
### Title: Download Mortality and Population Data (HMD)
### Aliases: ReadHMD

### ** Examples

## Not run: 
##D # Download demographic data for 3 countries in 1x1 format 
##D age_int  <- 1  # age interval: 1,5
##D year_int <- 1  # year interval: 1,5,10
##D interval <- paste0(age_int, "x", year_int)  # --> 1x1
##D # And the 3 countries: Sweden Denmark and USA. We have to use the HMD codes
##D cntr  <- c('SWE', 'DNK', 'USA')  
##D 
##D # Download death counts. We don't want to export data outside R.
##D HMD_Dx <- ReadHMD(what = "Dx",
##D                   countries = cntr,
##D                   interval  = interval,
##D                   username  = "user@email.com",
##D                   password  = "password",
##D                   save = FALSE)
##D ls(HMD_Dx)
##D HMD_Dx
##D 
##D # Download life tables for female population and export data.
##D LTF <- ReadHMD(what = "LT_f",
##D                countries = cntr,
##D                interval  = interval,
##D                username  = "user@email.com",
##D                password  = "password",
##D                save = TRUE)
##D LTF
## End(Not run) 



