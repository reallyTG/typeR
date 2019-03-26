library(rebus.base)


### Name: Backreferences
### Title: Backreferences
### Aliases: Backreferences REF1 Backreferences REF2 Backreferences REF3
###   Backreferences REF4 Backreferences REF5 Backreferences REF6
###   Backreferences REF7 Backreferences REF8 Backreferences REF9
###   Backreferences ICU_REF1 Backreferences ICU_REF2 Backreferences
###   ICU_REF3 Backreferences ICU_REF4 Backreferences ICU_REF5
###   Backreferences ICU_REF6 Backreferences ICU_REF7 Backreferences
###   ICU_REF8 Backreferences ICU_REF9
### Keywords: datasets

### ** Examples

# For R's PCRE and Perl engines
REF1
REF2
# and so on, up to
REF9

# For stringi/stringr's ICU engine
ICU_REF1
ICU_REF2
# and so on, up to
ICU_REF9

# Usage
sub("a(b)c(d)", REF1 %R% REF2, "abcd")
stringi::stri_replace_first_regex("abcd", "a(b)c(d)", ICU_REF1 %R% ICU_REF2)



