library(qdapRegex)


### Name: rm_white
### Title: Remove/Replace/Extract White Space
### Aliases: rm_white ex_white rm_white_bracket ex_white_bracket
###   rm_white_colon ex_white_colon rm_white_comma ex_white_comma
###   rm_white_endmark ex_white_endmark rm_white_lead ex_white_lead
###   rm_white_lead_trail ex_white_lead_trail rm_white_trail ex_white_trail
###   rm_white_multiple ex_white_multiple rm_white_punctuation
###   ex_white_punctuation
### Keywords: percent

### ** Examples

x <-  c(" There is ( $5.50 ) for , me . ", " that's [ 45.6% ] of! the pizza !", 
    "     14% is { $26  } or $25.99 ?", "Oh ;  here's colon : Yippee !")

rm_white(x)
rm_white_bracket(x)
rm_white_colon(x)
rm_white_comma(x)
rm_white_endmark(x)
rm_white_lead(x)
rm_white_trail(x)
rm_white_lead_trail(x)
rm_white_multiple(x)
rm_white_punctuation(x)



