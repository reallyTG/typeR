library(hgutils)


### Name: inclusion_flowchart
### Title: Patient flowchart
### Aliases: inclusion_flowchart exclude_patients

### ** Examples

## Not run: 
##D dataset = survival::lung; dataset$sex = factor(dataset$sex,labels=c("male","female"))
##D flowchart = inclusion_flowchart(dataset)
##D dataset = exclude_patients(flowchart, dataset, status==1) #exclude all patients who did not die
##D dataset = exclude_patients(flowchart, dataset, time<100) #exclude patients with a short follow-up
##D flowchart #print diagram
## End(Not run)



