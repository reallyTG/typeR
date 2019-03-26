library(qdapRegex)


### Name: rm_zip
### Title: Remove/Replace/Extract Zip Codes
### Aliases: rm_zip ex_zip
### Keywords: zip

### ** Examples

x <- c("Mr. Bean bought 2 tickets 2-613-213-4567",
  "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
  "Rat Race, XX, 12345",
  "Ignore phone numbers(613)2134567",
  "Grab zips with dashes 12345-6789 or no space before12345-6789",  
  "Grab zips with spaces 12345 6789 or no space before12345 6789",
  "I like 1234567 dogs"
)

rm_zip(x)
ex_zip(x)

## ======================= ##
## BUILD YOUR OWN FUNCTION ##
## ======================= ##

## example from: http://stackoverflow.com/a/26092576/1000343
zips <- data.frame(id = seq(1, 6), 
    address = c("Company, 18540 Main Ave., City, ST 12345", 
    "Company 18540 Main Ave. City ST 12345-0000", 
    "Company 18540 Main Ave. City State 12345", 
    "Company, 18540 Main Ave., City, ST 12345 USA", 
    "Company, One Main Ave Suite 18540m, City, ST 12345",
    "company 12345678")
)

## Function to grab even if a character follows the zip

# paste together a more flexible regular expression    
pat <- pastex(
    "@rm_zip", 
    "(?<!\\d)\\d{5}(?!\\d)",
    "(?<!\\d)\\d{5}-\\d{4}(?!\\d)"
)
# Create your own function that extract is set to TRUE
ex_zip2 <- rm_(pattern=pat, extract=TRUE)
ex_zip2(zips$address)

## Function to extract just 5 digit zips

ex_zip3 <- rm_(pattern="(?<!\\d)\\d{5}(?!\\d)", extract=TRUE)
ex_zip3(zips$address)



