library(LexisNexisTools)


### Name: lnt_asDate
### Title: Convert Strings to dates
### Aliases: lnt_asDate

### ** Examples

LNToutput <- lnt_read(lnt_sample(), convert_date = FALSE)
d <- lnt_asDate(LNToutput@meta$Date)
d



