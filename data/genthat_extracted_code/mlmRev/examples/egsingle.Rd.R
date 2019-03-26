library(mlmRev)


### Name: egsingle
### Title: US Sustaining Effects study
### Aliases: egsingle
### Keywords: datasets

### ** Examples

str(egsingle)
(fm1 <- lmer(math~year*size+female+(1|childid)+(1|schoolid), egsingle))



