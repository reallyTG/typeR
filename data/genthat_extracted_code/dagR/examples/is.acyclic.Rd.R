library(dagR)


### Name: is.acyclic
### Title: Check if a DAG actually is acyclic.
### Aliases: is.acyclic

### ** Examples

dag6<-demo.dag6();
is.acyclic(dag6);
dag6c<-add.arc(dag6, c(3,5));
is.acyclic(dag6c);



