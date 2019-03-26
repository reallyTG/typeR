library(RonFHIR)


### Name: fhirBulkClient
### Title: fhirBulkClient
### Aliases: fhirBulkClient

### ** Examples

## Not run: 
##D # Read your private key
##D privatekey <- openssl::read_key("PrivateKey.pem")
##D 
##D # Create your claim
##D claim <- jose::jwt_claim(iss = "ServiceURL",
##D                          sub = "ClientID",
##D                          aud = "TokenURL",
##D                          
##D 			                    # expiration date as epoch (5 minutes)
##D                          exp = as.integer(as.POSIXct( Sys.time() + 300)), 
##D                          
##D    			                # 'random' number
##D                          jti = charToRaw(as.character(runif(1, 0.5, 100000000000)))) 
##D 
##D # Sign your claim with your private key
##D jwt <- jose::jwt_encode_sig(claim, privatekey)
##D 
##D # Define your scope(s)
##D scopes <- c("system/*.read", "system/CommunicationRequest.write")
##D 
##D # Create a new fhirBulkClient
##D bulkclient <- fhirBulkClient$new("FHIRBulkServerURL", tokenURL = "TokenURL")
##D 
##D # Retrieve your token
##D token <- bulkclient$retrieveToken(jwt, scopes)
##D 
##D # Set your token
##D bulkclient$setToken(token$access_token)
##D 
##D # Request a download for Patient Cohort 3
##D bulkclient$groupExport(3)
##D 
##D # Request the progress of the requests
##D bulkclient$getBulkStatus()
##D 
##D # When the downloads a available, download the bulkdata
##D patient_cohort_3 <- bulkclient$downloadBulk(1)
##D 
##D View(patient_cohort_3)
## End(Not run)




