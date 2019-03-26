library(rERR)


### Name: f_to_event_table_wf_v2
### Title: ata transformation: Wide format -> Event format required for the
###   model (internal use)
### Aliases: f_to_event_table_wf_v2

### ** Examples

## No test: 
 f_to_event_table_wf_v2(id='patientids',start='entry_age',stop='exit_age',
                              outcome='leukaemia',data,times=data[,11:30],doses=data[,31:50],
                              covars=data[,c('sex','country','birthcohort')])
## End(No test)



