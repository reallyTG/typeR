library(essurvey)


### Name: import_rounds
### Title: Download integrated rounds from the European Social Survey
### Aliases: import_rounds import_all_rounds download_rounds

### ** Examples


## Not run: 
##D 
##D set_email("your_email@email.com")
##D 
##D # Get first three rounds
##D three_rounds <- import_rounds(1:3)
##D 
##D temp_dir <- tempdir()
##D 
##D # Only download the files to output_dir, this will return nothing.
##D download_rounds(
##D  rounds = 1:3,
##D  output_dir = temp_dir,
##D )
##D 
##D # By default, download_rounds saves a 'stata' file. You can
##D # also download 'spss' and 'sas' files.
##D 
##D download_rounds(
##D  rounds = 1:3,
##D  output_dir = temp_dir,
##D  format = 'spss'
##D )
##D 
##D # If rounds are repeated, will download only unique ones
##D two_rounds <- import_rounds(c(1, 1))
##D 
##D # If email is not registered at ESS website, error will arise
##D two_rounds <- import_rounds(c(1, 2), "wrong_email@email.com")
##D 
##D # Error in authenticate(ess_email) : 
##D # The email address you provided is not associated with any registered user.
##D # Create an account at https://www.europeansocialsurvey.org/user/new
##D 
##D # If selected rounds don't exist, error will arise
##D 
##D two_rounds <- import_rounds(c(1, 22))
##D # Error in ess_round_url(rounds) : 
##D # ESS round 22 is not a available. Check show_rounds()
## End(Not run)




