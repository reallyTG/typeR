library(marked)


### Name: mvms_design_data
### Title: Multivariate Multistate (mvms) Design Data
### Aliases: mvms_design_data

### ** Examples

x=set_mvms(list(location=c("A","B","C"),repro_status=c("N","P","u")))
mvms_design_data(x$df.states)
mvms_design_data(x$df.states,transition=FALSE)




