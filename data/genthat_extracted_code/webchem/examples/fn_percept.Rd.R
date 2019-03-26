library(webchem)


### Name: fn_percept
### Title: Retrieve flavor percepts from www.flavornet.org
### Aliases: fn_percept

### ** Examples

## No test: 
# might fail if website is not available
fn_percept("123-32-0")

CASs <- c("75-07-0",  "64-17-5",  "109-66-0", "78-94-4",  "78-93-3")
fn_percept(CASs)
## End(No test)



