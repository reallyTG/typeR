library(rcrypt)


### Name: decrypt
### Title: Decrypt a File Using GPG
### Aliases: decrypt

### ** Examples

## Not run: 
##D decrypt("path/to/your/file.csv.gpg")
##D decrypt("path/to/your/file.csv.gpg", output = "path/to/your/file.csv")
##D # WARNING: only use the passphrase argument if you understand why it's
##D # not secure.
##D decrypt("path/to/your/file.csv.gpg", passphrase = "your-passphrase")
## End(Not run)



