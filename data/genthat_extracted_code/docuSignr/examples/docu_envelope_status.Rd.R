library(docuSignr)


### Name: docu_envelope_status
### Title: Check status of envelope
### Aliases: docu_envelope_status

### ** Examples

## Not run: 
##D login <- docu_login(demo = TRUE)
##D  envelopes <- docu_list_envelopes(base_url = login$baseUrl[1], from_date = "2017/1/1")
##D  envelope_id <- envelopes[envelopes$status == "completed","envelopeId"][1]
##D  status <- docu_envelope_status(base_url = login[1, 3], 
##D                            envelope_id = envelope_id)
## End(Not run)




