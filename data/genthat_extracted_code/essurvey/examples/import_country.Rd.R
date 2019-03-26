library(essurvey)


### Name: import_country
### Title: Download integrated rounds separately for countries from the
###   European Social Survey
### Aliases: import_country import_all_cntrounds download_country

### ** Examples

## Not run: 
##D 
##D set_email("your_email@email.com")
##D 
##D # Get first three rounds for Denmark
##D dk_three <- import_country("Denmark", 1:3)
##D 
##D # Only download the files, this will return nothing
##D 
##D temp_dir <- tempdir()
##D 
##D download_country(
##D  "Turkey",
##D  rounds = c(2, 4),
##D  output_dir = temp_dir
##D )
##D 
##D # By default, download_country downloads 'stata' files but
##D # you can also download 'spss' or 'sas' files.
##D 
##D download_country(
##D  "Turkey",
##D  rounds = c(2, 4),
##D  output_dir = temp_dir,
##D  format = 'spss'
##D )
##D 
##D # If email is not registered at ESS website, error will arise
##D uk_one <- import_country("United Kingdom", 5, "wrong_email@email.com")
##D # Error in authenticate(ess_email) : 
##D # The email address you provided is not associated with any registered user.
##D # Create an account at http://www.europeansocialsurvey.org/user/new
##D 
##D # If selected rounds don't exist, error will arise
##D 
##D czech_two <- import_country("Czech Republic", c(1, 22))
##D 
##D # Error in ess_country_url(country, rounds) : 
##D # Only rounds ESS1, ESS2, ESS4, ESS5, ESS6, ESS7, ESS8 available
##D # for Czech Republic
## End(Not run)




