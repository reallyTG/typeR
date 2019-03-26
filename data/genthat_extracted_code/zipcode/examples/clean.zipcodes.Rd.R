library(zipcode)


### Name: clean.zipcodes
### Title: clean up and standardize ZIP codes
### Aliases: clean.zipcodes

### ** Examples

	
# given a mix of possible zip codes, including ZIP+4 and foreign postal codes,
# attempt to identify valid zip codes and return character vector:

zips = c(2061, "02142", 2043, "20210", "2061-2203", "SW1P 3JX", "210", '02199-1880')
	
clean.zipcodes(zips)
# [1] "02061" "02142" "02043" "20210" "02061" NA      "00210" "02199"	



