library(ggdag)


### Name: DAG Labels
### Title: DAG labels
### Aliases: 'DAG Labels' label<- label<-.dagitty label<-.tidy_dagitty
###   dag_label label has_labels

### ** Examples

labelled_dag <- dagify(y ~ z, x ~ z) %>%
 tidy_dagitty() %>%
 dag_label(labels = c("x" = "exposure", "y" = "outcome", "z" = "confounder"))

 has_labels(labelled_dag)



