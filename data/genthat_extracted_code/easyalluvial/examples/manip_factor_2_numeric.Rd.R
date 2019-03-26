library(easyalluvial)


### Name: manip_factor_2_numeric
### Title: converts factor to numeric preserving numeric levels and order
###   in character levels.
### Aliases: manip_factor_2_numeric

### ** Examples

fac_num = factor( c(1,3,8) )
fac_chr = factor( c('foo','bar') )
fac_chr_ordered = factor( c('a','b','c'), ordered = TRUE )

manip_factor_2_numeric( fac_num )
manip_factor_2_numeric( fac_chr )
manip_factor_2_numeric( fac_chr_ordered )



