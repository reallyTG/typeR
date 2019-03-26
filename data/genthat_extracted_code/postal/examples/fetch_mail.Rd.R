library(postal)


### Name: fetch_mail
### Title: Fetch postage details
### Aliases: fetch_mail

### ** Examples

## Not run: 
##D 
##D fetch_mail(origin_zip = "90210",
##D          destination_zip = "59001",
##D          type = "envelope")
##D 
##D 
##D fetch_mail(origin_zip = "68003",
##D          destination_zip = "23285",
##D          pounds = 4,
##D          ground_transportation_needed = TRUE,
##D          type = "package",
##D          shape = "rectangular",
##D          show_details = TRUE)
##D 
##D # Contains an invalid zip ("foobar"), which will get a "no_success" row
##D origins <- c("90210", "foobar", "59001")
##D destinations <- c("68003", "94707", "23285")
##D 
##D purrr::map2_dfr(
##D   origins, destinations,
##D   fetch_mail,
##D   type = "package"
##D )
##D 
##D # A syntactically fine request, but no results are returned
##D fetch_mail(origin_zip = "04101",
##D     destination_zip = "97211",
##D     shipping_date = "3018-07-04",  # way in the future!
##D     type = "package",
##D     show_details = TRUE)
##D 
## End(Not run)




