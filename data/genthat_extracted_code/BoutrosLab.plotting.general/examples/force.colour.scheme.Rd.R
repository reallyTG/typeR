library(BoutrosLab.plotting.general)


### Name: force.colour.scheme
### Title: Based on predefined colour schemes, returns a vector of
###   corresponding colours.
### Aliases: force.colour.scheme force.color.scheme

### ** Examples

annovar.output <- c('nonsynonymous snv', 'stopgain snv', 'none', 'stoploss snv', 
'frameshift deletion', 'frameshift substitution', 'splicing', 'none');
force.colour.scheme(annovar.output,'annovar.annotation');
force.colour.scheme(annovar.output,'annovar.annotation', 'white');



