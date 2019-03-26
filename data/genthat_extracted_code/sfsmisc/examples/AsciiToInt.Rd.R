library(sfsmisc)


### Encoding: UTF-8

### Name: AsciiToInt
### Title: Character to and from Integer Codes Conversion
### Aliases: AsciiToInt ichar chars8bit strcodes
### Keywords: manip

### ** Examples

chars8bit(65:70)#-> "A" "B" .. "F"
stopifnot(identical(LETTERS,   chars8bit(65:90)),
          identical(AsciiToInt(LETTERS), 65:90))

## may only work in ISO-latin1 locale (not in UTF-8):
try( strcodes(c(a= "ABC", ch="1234", place = "Zürich")) )
## in "latin-1" gives  {otherwise should give NA instead of 252}:
## Not run: 
##D $a
##D [1] 65 66 67
##D 
##D $ch
##D [1] 49 50 51 52
##D 
##D $place
##D [1]  90 252 114 105  99 104
## End(Not run)
 myloc <- Sys.getlocale()

if(.Platform $ OS.type == "unix") { # ''should work'' here
  try( Sys.setlocale(locale = "de_CH") )# "try": just in case
  print(strcodes(c(a= "ABC", ch="1234", place = "Zürich"))) # no NA hopefully
  print(AsciiToInt(chars8bit()))# -> 1:255  {if setting latin1 succeeded above}

  print(chars8bit(97:140))
  try( Sys.setlocale(locale = "de_CH.utf-8") )# "try": just in case
  print(chars8bit(97:140)) ## typically looks different than above
}

## Resetting to original locale .. works "mostly":
lapply(strsplit(strsplit(myloc, ";")[[1]], "="),
       function(cc) try(Sys.setlocale(cc[1], cc[2]))) -> .scratch

Sys.getlocale() == myloc # TRUE if we have succeeded to reset it




