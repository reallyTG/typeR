library(decoder)


### Name: rc
### Title: Codes used by RC's kvartalen
### Aliases: rc sjukhus_rc forvaltning_rc
### Keywords: datasets

### ** Examples

 # From RCC hospital code to RC hospital code
 decode(51012, "sjukhus_rc")
 
 # From RCC code to RC name
 decode(51012, "sjukhus_rc", "sjukhus_rc_namn")
 
 # From RCC hospital code to RC organizational unit code
 decode(51012, "forvaltning_rc")
 
 # From RCC code to RC name
 decode(51012, "forvaltning_rc", "forvaltning_rc_namn")
     



