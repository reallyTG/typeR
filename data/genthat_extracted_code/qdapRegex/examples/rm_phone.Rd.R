library(qdapRegex)


### Name: rm_phone
### Title: Remove/Replace/Extract Phone Numbers
### Aliases: rm_phone ex_phone
### Keywords: phone telephone

### ** Examples

x <- c(" Mr. Bean bought 2 tickets 2-613-213-4567 or 5555555555 call either one",
  "43 Butter Rd, Brossard QC K0A 3P0 - 613 213 4567", 
  "Please contact Mr. Bean (613)2134567",
  "1.575.555.5555 is his #1 number",  
  "7164347566",
  "I like 1234567 dogs"
)

rm_phone(x)
ex_phone(x)



