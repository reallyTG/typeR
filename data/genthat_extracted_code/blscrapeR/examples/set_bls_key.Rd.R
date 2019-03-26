library(blscrapeR)


### Name: set_bls_key
### Title: Install a BLS API Key in Your '.Renviron' File for Repeated Use
### Aliases: set_bls_key

### ** Examples


## Not run: 
##D set_bls_key("111111abc")
##D # First time, relead your enviornment so you can use the key without restarting R.
##D readRenviron("~/.Renviron")
##D # You can check it with:
##D Sys.getenv("BLS_KEY")
## End(Not run)

## Not run: 
##D # If you need to overwrite an existing key:
##D set_bls_key("111111abc", overwrite = TRUE)
##D # First time, relead your enviornment so you can use the key without restarting R.
##D readRenviron("~/.Renviron")
##D # You can check it with:
##D Sys.getenv("BLS_KEY")
## End(Not run)



