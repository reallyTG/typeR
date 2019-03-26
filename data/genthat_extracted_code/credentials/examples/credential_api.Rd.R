library(credentials)


### Name: credential_api
### Title: Retrieve and store git HTTPS credentials
### Aliases: credential_api credential_fill credential_approve
###   credential_reject

### ** Examples

## No test: 
# Insert example cred
example <- list(protocol = "https", host = "example.com",
  username = "test", password = "secret")
credential_approve(example)

# Retrieve it from the store
cred <- credential_fill(list(protocol = "https", host = "example.com", path = "/foo"))
print(cred)

# Delete it
credential_reject(cred)
## End(No test)



