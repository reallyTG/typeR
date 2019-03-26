library(Nippon)


### Name: sanitizeZenkaku
### Title: Sanitizing strings contaminated with fullwidth (zenkaku)
###   charactors.
### Aliases: sanitizeZenkaku

### ** Examples

(n <- intToUtf8(c(65296 + 1:3, 12288)))
sanitizeZenkaku(n)



