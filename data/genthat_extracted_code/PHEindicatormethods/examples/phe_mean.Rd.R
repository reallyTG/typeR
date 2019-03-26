library(PHEindicatormethods)


### Name: phe_mean
### Title: phe_mean
### Aliases: phe_mean

### ** Examples

library(dplyr)
df <- data.frame(values = c(30,40,50,60))
phe_mean(df, values)

## OR

df2 <- data.frame(area = rep(c("Area1", "Area2"),each=3),
                  values = c(20,30,40,200,300,400)) %>%
                  group_by(area)
phe_mean(df2,values)
phe_mean(df2,values,type="full", confidence=0.998)





