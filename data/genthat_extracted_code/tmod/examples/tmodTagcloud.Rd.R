library(tmod)


### Name: tmodTagcloud
### Title: Tag cloud based on tmod results
### Aliases: tmodTagcloud

### ** Examples

data(tmod)
fg <- tmod$MODULES2GENES[["LI.M127"]]
bg <- tmod$GENES$ID
result <- tmodHGtest( fg, bg )
tmodTagcloud(result)



