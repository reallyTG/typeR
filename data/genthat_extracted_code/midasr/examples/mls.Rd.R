library(midasr)


### Name: mls
### Title: MIDAS lag structure
### Aliases: mls

### ** Examples

## Quarterly frequency data
x <- 1:16
## Create MIDAS lag for use with yearly data
mls(x,0:3,4)

## Do not use contemporaneous lag
mls(x,1:3,4)

## Compares with embed when m=1
embed(x,2)
mls(x,0:1,1)



