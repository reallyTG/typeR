library(hansard)


### Name: mp_edms
### Title: Early Day Motions by MP or Peer
### Aliases: mp_edms hansard_mp_edms

### ** Examples

## Not run: 
##D 
##D # All EDMs primarily sponsored, sponsored or signed by Mike Crockart
##D x <- mp_edms(
##D   mp_id = 3967, primary_sponsor = TRUE,
##D   sponsor = TRUE, signatory = TRUE
##D )
##D 
##D # Detailed data on all EDMs primarily sponsored by Mike Crockart
##D y <- mp_edms(
##D   mp_id = 3967, primary_sponsor = TRUE,
##D   sponsor = TRUE, signatory = FALSE, full_data = TRUE
##D )
## End(Not run)




