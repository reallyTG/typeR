library(tangram)


### Name: tangram
### Title: Table creation methods
### Aliases: tangram tangram.numeric tangram.data.frame tangram.formula
###   tangram.character tangram.table tangram.tbl_df tangram.rms

### ** Examples

tangram(1, 1)
tangram(data.frame(x=1:3, y=c('a','b','c')))
tangram(drug ~ bili + albumin + protime + sex + age + spiders, pbc)
tangram("drug ~ bili + albumin + stage::Categorical + protime + sex + age + spiders", pbc)



