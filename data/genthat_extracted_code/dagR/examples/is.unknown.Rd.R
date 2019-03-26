library(dagR)


### Name: is.unknown
### Title: Check if a DAG node presents an unknown variable.
### Aliases: is.unknown

### ** Examples

dag2<-demo.dag2();
is.unknown(2, dag2);
is.unknown(3, dag2);
dag2u<-dag2; dag2u$names[2]<-"unknown";
is.unknown(2, dag2u);
is.unknown(3, dag2u);



