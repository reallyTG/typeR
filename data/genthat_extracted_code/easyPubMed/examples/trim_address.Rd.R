library(easyPubMed)


### Name: trim_address
### Title: Trim and Format Address Information
### Aliases: trim_address

### ** Examples

addr_string <- " 2 Dept of Urology, Feinberg School of Medicine," 
addr_string <- paste(addr_string, "Chicago, US; Dept of Mol Bio as well...")
addr_string
trim_address(addr = addr_string)



