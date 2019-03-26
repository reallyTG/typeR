library(keyringr)


### Name: decrypt_dpapi_pw
### Title: Decrypt passwords encrypted with the Microsoft Data Protection
###   API
### Aliases: decrypt_dpapi_pw

### ** Examples

## Not run: 
##D # First run the command below from Powershell:
##D # Read-Host "PW?" -AsSecureString |  ConvertFrom-SecureString | Out-File "C:\Temp\Password.txt"
##D # Now execute the following R commands to decrypt the password and save it in
##D # variable "x".  Note that if run without assignment, the password will not
##D # be displayed in the console.  Passwords must be saved to a variable or used
##D # inline within a connection string.
##D library("keyringr")
##D x <- decrypt_dpapi_pw("C:\\Temp\\Password.txt")
##D 
##D # function is best used in a connection string command:
##D ch <- odbcConnect("some dsn", uid = "user1", pwd = decrypt_dpapi_pw("C:\\Temp\\Password.txt"))
## End(Not run)



