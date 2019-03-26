library(cwhmisc)


### Name: paste00
### Title: paste with collapse=""
### Aliases: paste00
### Keywords: misc character

### ** Examples

# Note the differences:
  a <- 1:2;  b <- 3:5
  paste  (a,b)             # "1 3" "2 4" "1 5"
  paste0 (a,b)             #  "13" "24" "15"
  paste00(a,b)             #  "132415"
  paste0 (a,b,c=";")       #  "13;" "24;" "15;"
  paste  (a,b,s="-")       #  "1-3" "2-4" "1-5"
  paste  (a,b,s="-",c=";") #  "1 3 - ;" "2 4 - ;" "1 5 - ;"
  paste00(0:9) # "0123456789"
  paste00(LETTERS) # "ABCDEFGHIJKLMNOPQRSTUVWXYZ"



