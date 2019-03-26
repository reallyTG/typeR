library(fredr)


### Name: fredr_set_key
### Title: Set the FRED API key
### Aliases: fredr_set_key

### ** Examples

current_key <- Sys.getenv("FRED_API_KEY")
fredr_set_key("abcdefghijklmnopqrstuvwxyz123456")
Sys.getenv("FRED_API_KEY")
fredr_set_key(current_key)
Sys.getenv("FRED_API_KEY")




