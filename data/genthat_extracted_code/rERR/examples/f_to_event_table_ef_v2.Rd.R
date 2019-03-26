library(rERR)


### Name: f_to_event_table_ef_v2
### Title: Data transformation: Event format -> Event format required for
###   the model (internal use)
### Aliases: f_to_event_table_ef_v2

### ** Examples

## No test: 
f_to_event_table_ef_v2(id='patientids',start='entry_age',stop='exit_age',
                                       outcome='leukaemia',data,times='age',doses='ActMar_med',
                                       covars=c('sex','country','birthcohort'))
## End(No test)



