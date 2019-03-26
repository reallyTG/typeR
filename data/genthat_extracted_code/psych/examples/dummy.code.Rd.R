library(psych)


### Name: dummy.code
### Title: Create dummy coded variables
### Aliases: dummy.code
### Keywords: multivariate models

### ** Examples

new <- dummy.code(sat.act$education)
new.sat <- data.frame(new,sat.act)
round(cor(new.sat,use="pairwise"),2)
dum.smoke <- dummy.code(spi$smoke,group=2:9)
table(dum.smoke,spi$smoke)



