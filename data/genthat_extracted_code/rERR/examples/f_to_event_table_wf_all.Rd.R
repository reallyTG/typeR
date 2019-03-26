library(rERR)


### Name: f_to_event_table_wf_all
### Title: Data transformation: Wide format -> Event format required for
###   the model
### Aliases: f_to_event_table_wf_all

### ** Examples

## No test: 
f_to_event_table_wf_all(formula,data,id_name='patientids',doses=data[,31:50],
                             times=data[,11:30],covars=data[,c('sex','country','birthcohort')])
## End(No test)



