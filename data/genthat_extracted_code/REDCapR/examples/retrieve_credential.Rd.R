library(REDCapR)


### Name: retrieve_credential
### Title: Read a token and other credentials from a (non-REDCap) database
###   or file.
### Aliases: retrieve_credential retrieve_credential_local
###   retrieve_credential_mssql

### ** Examples

library(REDCapR) #Load the package into the current R session.
# ---- Local File Example ----------------------------
path <- system.file("misc/example.credentials", package="REDCapR")
(p1  <- retrieve_credential_local(path, 153L))
(p2  <- retrieve_credential_local(path, 212L))



