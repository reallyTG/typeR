library(sitar)


### Name: codeplot
### Title: Plot and zap velocity outliers in growth curves
### Aliases: codeplot zapvelout zapvelout

### ** Examples


## identify outliers
outliers <- velout(age, height, id, heights, limit=2)

## plot outliers with code 4 or 6
codeplot(outliers, icode=c(4,6))

## set the 8 outliers missing
newheights <- zapvelout(outliers, icode=6)




