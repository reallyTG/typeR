library(QTLRel)


### Name: rem
### Title: Random effect matrices
### Aliases: rem

### ** Examples

## Not run: 
##D # make-up example
##D dat<- data.frame(
##D    group=c("A","A","A","A","A","A","B","B","B","B"),
##D    sex=c("F","F","F","M","M","M","F","F","M","M"),
##D    pass=c("Y","N","N","Y","Y","Y","Y","N","N","Y"),
##D    z=1:10)
##D 
##D # random effect pass, group and sex, where sex is nested
##D # within group:
##D # y_{ijk} = x_{ij}*b + group_i + sex_{ij} + z*pass_{ij}
##D #           + e_{ijk}
##D rem(~ group/sex + z|pass,data=dat)
## End(Not run)



